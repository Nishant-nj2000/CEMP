from flask import *
from flaskext.mysql import MySQL
from flask_mail import Mail, Message
from random import *
from datetime import *
from flask_htmlmin import HTMLMIN
import time
import os
import string
import requests
import random
from datetime import datetime

app = Flask(__name__,template_folder ='template')
app.config['MINIFY_HTML'] = True

app.secret_key = os.urandom(34)

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'cemp'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
connection = mysql.connect()


#MySQL Query Driver
def mysql_query(sql):
	connection = mysql.connect()
	cursor = connection.cursor()
	if sql.strip().split(' ')[0].lower() == "select" :
		print(sql)
		cursor.execute(sql)
		print(cursor._executed)
		
		columns = [column[0] for column in cursor.description]
		results = []
		for row in cursor.fetchall():
			results.append(dict(zip(columns, row)))
		data = results
		cursor.close()
		connection.close()
		return data
	if sql.strip().split(' ')[0].lower() != "select" :
		cursor.execute(sql)
		print(cursor._executed)
		
		connection.commit()
		cursor.close()
		connection.close()
		return None
# How to use this function
# --> mysql_query("Select * from user_master;")
# --> mysql_query(" select * from user_master where emailid='{}';".format(email))
#################################################################


# Main Page Route
@app.route('/')
def main():
	return render_template('main.html')


#About PAg Route
@app.route('/about')
def about():
	return render_template('about.html')


#register page route
@app.route('/register')
def register():
	return render_template("register.html")

#registeration code
@app.route('/registerscreen', methods =['GET','POST'])
def registerscreen():
	usertype = request.form['usertype']
	gender = request.form['gender']
	name = request.form['name']
	dob = request.form['age']
	phone = request.form['phone']
	aadhaar = request.form['aadhaar'] 
	email = request.form['email']
	password = request.form['password']
	address = request.form['address']
	city = request.form['city']
	state = request.form['state']
	doj=date.today()
	try:
		if usertype == 'Manager':
			cursor = connection.cursor()
			sql = 'insert into manager_details (Name, dob, Gender, Phone, Email, Address, City, State, Adhaar_number,doj) values (%s, %s, %s, %s, %s, %s, %s, %s, %s,%s)'
			val = (name,dob,gender,phone,email,address,city,state,aadhaar,doj)
			cursor.execute(sql,val)

			sql = 'insert into user_type_master (Email, User_type, Password) values (%s, %s, %s)'
			val = (email,usertype,password)
			cursor.execute(sql,val)

			sql = 'select user_type_id from user_type_master where Email = %s'
			val = (email)
			cursor.execute(sql,val)
			data = cursor.fetchone()

			sql = 'Update manager_details set user_type_id = %s where email = %s'
			val = (data,email)
			cursor.execute(sql,val)
			connection.commit()
			cursor.close()
		else:
			cursor = connection.cursor()
			sql = 'insert into candidate_details (Name, dob, Gender, Phone, Email, Address, City, State, Adhaar_number,doj) values (%s, %s, %s, %s, %s, %s, %s, %s, %s,%s)'
			val = (name,dob,gender,phone,email,address,city,state,aadhaar,doj)
			cursor.execute(sql,val)

			sql = 'insert into user_type_master (Email, User_type, Password) values (%s, %s, %s)'
			val = (email,usertype,password)
			cursor.execute(sql,val)

			sql = 'select user_type_id from user_type_master where Email = %s'
			val = (email)
			cursor.execute(sql,val)
			data = cursor.fetchone()

			sql = 'Update candidate_details set user_type_id = %s where email = %s'
			val = (data,email)
			cursor.execute(sql,val)
			connection.commit()
			cursor.close()

	except TypeError as e:
		return render_template("error.html", Message ="wrong password")
	return render_template('Login.html',title = "Login")
#End

#Manage forms Page
@app.route('/Manageform',methods=["GET",'POST'])
def Manageform():
	data=mysql_query("select exam_id from exam_master")
	if request.method=="POST":
		if "button1" in request.form:
			eid=""
			ename=request.form['ename']
			etype=request.form['etype']
			niche=request.form['niche']
			noo=request.form['noo']
			city=request.form['city']
			state=request.form['state']
			mysql_query("insert into exam_master values('{}','{}','{}','{}','{}','{}','{}'')".format(eid,ename,etype,niche,noo,city,state)) 		
		elif "button2" in request.form:
			eid=request.form['examid']
			ename=request.form['ename']
			etype=request.form['etype']
			niche=request.form['niche']
			noo=request.form['noo']
			city=request.form['city']
			state=request.form['state']
			mysql_query(" UPDATE exam_master SET exam_name='{}',exam_type='{}',exam_niche='{}',name_of_organisation='{}',city='{}',state='{}' where exam_id='{}'".format(exam_name,etype,niche,noo,city,state,eid))
		redirect(url_for('Manageform'))
	return render_template('Manageform.html',data=data)


	



#Manage link Page
@app.route('/Managelink/',methods=['GET',"POST"])
def Managelink():
	form=mysql_query("select form_id,form_name from exam_form_details")
	centre=mysql_query("select centre_id from centre_master")
	exam=mysql_query("select exam_id,exam_name from exam_master")
	if request.form=="POST":
		if "button1" in request.form:
			fid=""
			ename=request.form['ename']
			cid=request.form['cid']
			fname=request.form['fname']
			doo=request.form['doo']
			doc=request.form['doc']
			fees=request.form['fees']
			eli=request.form['eli']
			link=request.form['link']
			doe=request.form['doe']
			mysql_query("insert into exam_form_details values('{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(fid,fname,ename,cid,doo,doc,fees,eli,link,doe))
		elif "button2" in request.form:
			ename=request.form['ename']
			fname=request.form['fname']
			doo=request.form['doo']
			doc=request.form['doc']
			fees=request.form['fees']
			eli=request.form['eli']
			link=request.form['link']
			doe=request.form['doe']
			mysql_query("UPDATE exam_form_details set form_name='{}',date_of_opening='{}',date_of_closing='{}',fees='{}',eligibility='{}',link='{}',date_of_exam='{}' where form_id='{}'".format(fname,doo.doc,fees,eli,link,doe,ename))
			redirect(url_for('Managelink'))
	return render_template("managelink.html",exam=exam,centre=centre,form=form)


#Login Page
@app.route('/login')
def login():
	return render_template("login.html")

# LOGIN CODE
# START
@app.route('/loginscreen', methods =['POST'])
def loginscreen():
	try:
		email = request.form['email']	
		password = request.form['password'] 
		cursor = connection.cursor()
		sql = "select user_type_master.User_type , user_type_master.email, manager_details.name, manager_details.phone, manager_details.Address, manager_details.city, manager_details.state from manager_details JOIN user_type_master  on user_type_master.User_type_id=manager_details.user_type_id WHERE user_type_master.email = %s and Password = %s" 
		sqldt=(email,password)
		cursor.execute(sql,sqldt)
		connection.commit()
		account = cursor.fetchone()
		session['user_type'] = account[0]
		session['email'] = account[1]
		session['name'] = account[2]

	except TypeError as e:
		try:
			email = request.form['email']	
			password = request.form['password'] 
			cursor = connection.cursor()
			sql = "select user_type_master.User_type, user_type_master.email, candidate_details.name, candidate_details.user_id from candidate_details JOIN user_type_master  on user_type_master.User_type_id=candidate_details.user_type_id WHERE user_type_master.email = %s and Password = %s" 
			sqldt=(email,password)
			cursor.execute(sql,sqldt)
			connection.commit()
			account = cursor.fetchone()
			session['user_type'] = account[0]
			session['email'] = account[1]
			session['name'] = account[2]
			session['user_id'] = account[3]
		except TypeError as e:
			try:
				email = request.form['email']	
				password = request.form['password'] 
				cursor = connection.cursor()
				sql = "select user_type,email from user_type_master WHERE user_type_master.email = %s and user_type_master.Password = %s" 
				sqldt=(email,password)
				cursor.execute(sql,sqldt)
				connection.commit()
				account = cursor.fetchone()
				session['user_type'] = account[0]
				print(session['user_type'])
				session['email'] = account[1]
			except TypeError as e:
				return render_template("error.html", Message ="wrong password")
	return render_template('dashboard.html',title = "Dashboard: "+session['user_type'])		
# END


#Logout Code

@app.route('/logout')
def logout():
	# Remove session data, this will log the user out
   session.pop('email', None)
   session.pop('name', None)
   session.pop('user_id', None)
   # Redirect to login page
   return redirect(url_for('login'))

#Logout Code End



#UPDATE PASSWORD CODE
@app.route("/updatepasswordscr/",methods=['POST'])
def updatepasswordscr():
	password = request.form['password'] 
	email=session['email']
	cursor = connection.cursor()
	sql = "UPDATE `user_type_master` SET `Password`=%s WHERE `email`= %s "
	sqldt = (password,email)
	cursor.execute(sql,sqldt)
	connection.commit()
	cursor.close()
	return redirect(url_for('updatedetailuser,html'))

#END

#Admin page Route
@app.route('/updatepasswordadmin')
def updatedadmin():
	return render_template("updatepassadmin.html")
#End 


#Admin password passsword
@app.route("/updatepasswordscr/",methods=['POST'])
def updatepassadmin():
	password = request.form['password'] 
	print(password)
	cursor = connection.cursor()
	sql = "UPDATE `user_type_master` SET `Password`=%s WHERE `email`= %s "
	sqldt = (password,email)
	cursor.execute(sql,sqldt)
	connection.commit()
	cursor.close()
	return redirect(url_for('updatepassadmin.html'))
#End


#Submit complaint
@app.route('/submitcomplaint',methods=["POST","GET"])
def submitcomplaint():
	data=mysql_query("select form_id,form_name from exam_form_details")
	if request.method=="POST":
		if "button1" in request.form:
			doc=date.today()
			c=""
			userid=session['user_id']
			ctype=request.form['type']
			fname=request.form['fname']
			forward="no"
			desc=request.form['desc']
			mysql_query("insert into complaint_details values('{}','{}','{}','{}','{}','{}','{}')".format(c,userid,fname,ctype,desc,doc,forward))
			redirect(url_for('submitcomplaint'))
	return render_template("submitcomplaint.html",data=data)
#END

#Show Complaint and  Route
@app.route("/complaint/",methods=["POST","GET"])
def showcomplaint():
	data = mysql_query("select c.complaint_id, c.user_id, u.name, c.type, c.description,c.forward from complaint_details c, candidate_details u where u.user_id = c.user_id")
	if request.method=="POST":
		if "button1" in request.form:
			cid=request.form['cid']
			mysql_query(" UPDATE complaint_details set forward='{}' where Complaint_id='{}'".format("Yes",cid))
			redirect(url_for('showcomplaint'))
	return render_template('showcomplaint.html',data=data)
#END


#Show Admin Complaint and  Route
@app.route("/Admincomplaint/")
def admincomplaint():
	y="Yes"
	data = mysql_query("select complaint_details.user_id, candidate_details.name, complaint_details.type, complaint_details.description from complaint_details join candidate_details on candidate_details.user_id = complaint_details.user_id where complaint_details.forward ='{}'".format(y))
	print(data)
	return render_template('admincomplain.html',data=data)
#END


#Submit feedback
@app.route('/submitfeedback',methods=["GET","POST"])
def submitfeedback():
	if request.method=="POST":
		if "button1" in request.form:
			fid=" "
			dof=date.today()
			userid=session['user_id']
			desc=request.form['desc']
			rating=request.form['rating']
			mysql_query("insert into feedback_details values('{}','{}','{}','{}','{}')".format(fid,userid,desc,rating,dof))
			redirect(url_for('submitfeedback'))
	return render_template("submitfeedback.html")
#END

#Show Feeback and route

@app.route("/feedback/")
def showfeedback():
	data = mysql_query("select u.user_id, u.name, f.feedback_msg from candidate_details u, feedback_details f where u.user_id = f.user_id")
	print(data)
	return render_template('showfeedback.html',data=data)
#END

#view form code
@app.route('/viewform',methods=["GET",'POST'])
def viewform():
	today=date.today()
	data=mysql_query("select exam_master.exam_id,exam_master.exam_name,exam_master.exam_type,exam_master.name_of_organisation,exam_form_details.form_id,exam_form_details.date_of_opening,exam_form_details.date_of_closing,exam_form_details.fees,exam_form_details.eligibility,exam_form_details.date_of_exam,exam_form_details.link,centre_master.city from exam_form_details join exam_master on exam_form_details.exam_id= exam_master.exam_id join centre_master on exam_form_details.centre_id = centre_master.centre_id")
	if request.method=="POST":
		if "button1" in request.form:
			session['fid']=request.form['fid']
			session['eid']=request.form['eid']
			return redirect(url_for('fillform'))
	return render_template('viewform.html',data=data,today=today)
#END

#Registration id generator
def regid(size=6, chars=string.ascii_uppercase + string.digits):
	return ''.join(random.choice(chars) for _ in range(size))

#END

#Fill Form Function
@app.route('/fillform',methods=["GET",'POST'])
def fillform():
	detail=mysql_query("select name,dob,gender,email,phone,Adhaar_number from candidate_details where email='{}'".format(session['email']))
	centre=mysql_query("select centre_master.city from centre_master")
	rid=regid()
	if request.method=='POST':
		if "button1" in request.form:
			cen=[]
			c1=request.form['c1']
			c2=request.form['c2']
			c3=request.form['c3']
			cen.append(c1)
			cen.append(c2)
			cen.append(c3)
			print(cen)
			fc=random.choices(cen)
			print(fc)
			aid=""
			dof=date.today()
			now = datetime.now()
			tof= now.strftime("%H:%M:%S")
			mysql_query("insert into applied_form values('{}','{}','{}','{}','{}','{}','{}','{}')".format(aid,session['fid'],session['eid'],session['user_id'],rid,dof,tof,fc))
			return redirect(url_for('registerationId'),rid=rid)
		if "button2" in request.form:
			return redirect(url_for('viewform'))
		if "button3" in request.form:
			return redirect(url_for('viewform'))
	return render_template("fillform.html",detail=detail,rid=rid,centre=centre)

#Registration code display:
@app.route("/registration complete/",methods=["GET","POST"])
def registrationId():
	passw=regid()
	if request.method=="POST":
		if "button1" in request.form:
			return redirect(url_for('viewform'))
	return render_template("registrationId.html",passw=passw,rid=rid)


#Applied form for user
@app.route("/viewapplied/")
def viewapplied():
	data = mysql_query("select applied_id,registration_no,exam_form_details.form_name,date_of_filling,time_of_filling,candidate_details.email from applied_form join exam_form_details on applied_form.form_id=exam_form_details.form_id join candidate_details on applied_form.user_id=candidate_details.user_id where candidate_details.email='{}'".format(session['email']))
	return render_template('viewapplied.html',data=data)

#end


#Admit Card for user
@app.route("/downlaodadmit/")
def downlaodadmit():
	data = mysql_query("select exam_form_details.form_name,applied_form.date_of_filling,applied_form.time_of_filling,admit_card_details.issue_date,admit_card_details.date_of_exam,admit_card_details.card_available,admit_card_details.link from admit_card_details join applied_form on admit_card_details.form_id=applied_form.form_id join exam_form_details on admit_card_details.form_id=exam_form_details.form_id join candidate_details on applied_form.user_id=candidate_details.user_id where candidate_details.Email='{}'".format(session['email']))
	print(data)
	return render_template('downloadadmitcard.html',data=data)

#END


#Admitcard link page route
@app.route('/Admitcard',methods=["GET","POST"])
def Admitcard():
	form=mysql_query("select form_id,form_name from exam_form_details")
	if request.method=="POST":
		if "button1" in request.form:
			aid=""
			cur=date.today();
			card=request.form['card']
			fname=request.form['fname']
			doe=request.form['doe']
			link=request.form['link']
			mysql_query("insert admit_card_details values('{}','{}','{}','{}','{}','{}'')".format(aid,fname,card,cur,doe,link))
		if "button2" in request.form:
			cur=date.today();
			card=request.form['card']
			fname=request.form['fname']
			doe=request.form['doe']
			link=request.form['link']
			mysql_query("UPDATE admit_card_details set card_available='{}',issue_date='{}',date_of_exam='{}',link='{}' where form_id='{}'".format(card,cur,doe,link,fname))
			redirect(url_for('Admitcard'))
	return render_template("admitcardlink.html",form=form)


#Manage Managers

@app.route('/managemanager/',methods=['GET','POST'])
def managemanager():
	data=mysql_query("select manager_id,name,city,gender,Adhaar_number,afl,status from manager_details")
	if request.method=="POST":
		mid=request.form['mid']
		if "button1" in request.form:
			st="block"
			mysql_query("UPDATE manager_details set status='{}' where manager_id='{}'".format(st,mid))
			return redirect(url_for('managemanager'))	
	return render_template('managemanager.html',data=data)

#END


#Admin Generate
@app.route('/Report')
def report():
	return render_template("report.html")
#END



#Forgot Password
@app.route('/forgotpassword')
def forgotpassword():
	return render_template("forgotpassword.html")
#End

#update details screen
@app.route('/updatedetails/',methods=["GET",'POST'])
def updatedetailsscr():
	utype=session['user_type']
	email=session['email']
	account =mysql_query("select user_type_master.User_type , user_type_master.email, manager_details.name, manager_details.phone, manager_details.Address, manager_details.city, manager_details.state from manager_details JOIN user_type_master  on user_type_master.User_type_id=manager_details.user_type_id WHERE user_type_master.email='{}'".format(email))
	Candidate =mysql_query("select user_type_master.User_type, user_type_master.email, candidate_details.name, candidate_details.phone, candidate_details.address, candidate_details.city, candidate_details.state from candidate_details JOIN user_type_master  on user_type_master.User_type_id=candidate_details.user_type_id WHERE user_type_master.email='{}'".format(email))
	if request.method == "POST":
		if utype =="Manager":
			name=request.form['name']
			email=request.form['email']
			phone=request.form['phone']
			address=request.form['address']
			city=request.form['city']
			state=request.form['state']
			mysql_query("UPDATE  manager_details SET name='{}',email='{}',phone='{}',address='{}',city='{}',state='{}' where email='{}'".format(name,email,phone,address,city,state,session['email']))	
		if utype =="Candidate":
			name=request.form['name']
			email=request.form['email']
			phone=request.form['phone']
			address=request.form['address']
			city=request.form['city']
			state=request.form['state']
			mysql_query("UPDATE  candidate_details SET name='{}',email='{}',phone='{}',address='{}',city='{}',state='{}' where email='{}'".format(name,email,phone,address,city,state,session['email']))
	return render_template('updatedetailuser.html',account=account,Candidate=Candidate)


#Report Generation

@app.route('/Generatereports/',methods=['POST','GET'])
def reports():
	return render_template("reports.html")

#END

#
#
#
#
#
#
#
#
#

#Report display

@app.route('/datewise',methods=['GET','POST'])
def datewise():
	if request.method=="POST":
		ustype=request.form['user']
		df=request.form['df']
		dt=request.form['dt']
		print(ustype)
		if "button1" in request.form:
			if ustype=="Manager":
				man=mysql_query("select manager_id,name,email,Adhaar_number,gender,dob from manager_details where doj between '{}' and '{}'".format(df,dt))
				return render_template('datewise.html',man=man,ustype=ustype)
			if ustype=="Candidate":
				man=mysql_query("select user_id,name,email,Adhaar_number,gender,dob from candidate_details where doj between '{}' and '{}'".format(df,dt))
				return render_template('datewise.html',man=man,ustype=ustype)
	return render_template("datewise.html")

@app.route('/areawise',methods=['GET','POST'])
def areawise():
	if request.method=="POST":
		ustype=request.form['user']
		city=request.form['city']
		state=request.form['state']
		print(ustype)
		if "button1" in request.form:
			if ustype=="Manager":
				man=mysql_query("select manager_id,name,email,Adhaar_number,gender,dob from manager_details where manager_details.city='{}' OR manager_details.state='{}'".format(city,state))
				return render_template('areawise.html',man=man,ustype=ustype)
			if ustype=="Candidate":
				man=mysql_query("select user_id,name,email,Adhaar_number,gender,dob from candidate_details where candidate_details.city='{}'OR candidate_details.state='{}'".format(city,state))
				return render_template('areawise.html',man=man,ustype=ustype)
	return render_template("areawise.html")


@app.route('/complaintwise',methods=['GET','POST'])
def complaintwise():
	if request.method=="POST":
		ustype=request.form['user']
		df=request.form['df']
		dt=request.form['dt']
		print(ustype)
		if "button1" in request.form:
			if ustype=="Candidate":
				data=mysql_query("select candidate_details.user_id,complaint_details.forward,candidate_details.name,candidate_details.email,candidate_details.Adhaar_number,candidate_details.gender,candidate_details.city from candidate_details join complaint_details on candidate_details.user_id = complaint_details.user_id where doc between '{}' and '{}'".format(df,dt))
				print(data)
				return render_template('complaintwise.html',data=data,ustype=ustype)
	return render_template("complaintwise.html")



@app.route('/feedbackwise',methods=['GET','POST'])
def feedbackwise():
	if request.method=="POST":
		ustype=request.form['user']
		df=request.form['df']
		dt=request.form['dt']
		print(ustype)
		if "button1" in request.form:
			if ustype=="Candidate":
				data=mysql_query("select candidate_details.user_id,candidate_details.name,candidate_details.email,candidate_details.Adhaar_number,candidate_details.gender,candidate_details.city from candidate_details join feedback_details on candidate_details.user_id = feedback_details.user_id where dof between '{}' and '{}'".format(df,dt))
				return render_template('feedbackwise.html',data=data,ustype=ustype)
	return render_template("feedbackwise.html")


@app.route('/examwise',methods=['GET','POST'])
def examwise():
	exam=mysql_query("select exam_name,exam_type,name_of_organisation from exam_master")
	if request.method=="POST":
		evalue=request.form['button2']
		ename=request.form['ename']
		etype=request.form['type']
		noo=request.form['noo']
		if "button2" in request.form:
				data=mysql_query("select exam_id,exam_name,exam_type,exam_niche,name_of_organisation,city,state from exam_master where exam_name='{}' or exam_type='{}' or name_of_organisation='{}'".format(ename,etype,noo))
				print(data)
				print(evalue)
				return render_template('examwise.html',data=data,evalue=evalue,exam=exam)
	return render_template("examwise.html",exam=exam)



@app.route('/formwise',methods=['GET','POST'])
def formwise():
	form=mysql_query("select form_name from exam_form_details")
	if request.method=="POST":
		evalue=request.form['button2']
		name=request.form['fname']
		od=request.form['od']
		cd=request.form['cd']
		centre=request.form['city']
		if "button2" in request.form:
				data=mysql_query("select distinct exam_form_details.form_id,form_name,date_of_opening,date_of_closing,date_of_exam,fees,eligibility,centre_master.city from exam_form_details join centre_master join centre_details on exam_form_details.centre_id=centre_details.centre_id where centre_master.city='{}'".format(centre))
				data2=mysql_query("select exam_form_details.form_id,form_name,date_of_opening,date_of_closing,date_of_exam,fees,eligibility from exam_form_details  where exam_form_details.form_name='{}' or exam_form_details.date_of_opening='{}' or exam_form_details.date_of_closing='{}' ".format(name,od,cd))
				return render_template('formwise.html',data=data,form=form,data2=data2)
	return render_template("formwise.html",form=form)


@app.route('/candidatewise',methods=['GET','POST'])
def candidatewise():
	if request.method=="POST":
		evalue=request.form['button1']
		name=request.form['name']
		ad=request.form['ad']
		gender=request.form['gender']
		if "button1" in request.form:
			data=mysql_query("select user_id,name,email,adhaar_number,gender,dob,city,state from candidate_details where name='{}' or adhaar_number='{}' or gender='{}'".format(name,ad,gender))
			print(data)
			print(evalue)
			return render_template('candidatewise.html',data=data,evalue=evalue)
	return render_template("candidatewise.html")


@app.route('/managerwise',methods=['GET','POST'])
def managerwise():
	if request.method=="POST":
		evalue=request.form['button1']
		name=request.form['name']
		ad=request.form['ad']
		gender=request.form['gender']
		if "button1" in request.form:
			data=mysql_query("select manager_id,name,email,adhaar_number,gender,dob,city,state from manager_details where name='{}' or adhaar_number='{}' or gender='{}'".format(name,ad,gender))
			print(data)
			print(evalue)
			return render_template('managerwise.html',data=data,evalue=evalue)
	return render_template("managerwise.html")


app.jinja_env.cache = {}
if __name__ == '__main__':
	app.run(host='0.0.0.0',port='3030',debug = True)

