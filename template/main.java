import java.util.Scanner;
 
class Main
{
	int matrix[][];
	int row, column;
    void create() 
    {
		Scanner in = new Scanner(System.in);		
		System.out.println("Number of rows :");
		row = Integer.parseInt(in.nextLine());
		System.out.println("Number of columns :");
		column = Integer.parseInt(in.nextLine());
		matrix = new int[row][column];
		System.out.println("Enter the data :");
		for(int i=0; i < row; i++) {
			for(int j=0; j < column; j++)
			 {
				matrix[i][j] = in.nextInt();
			}
    }
    void check()
    {
        System.out.println("\nCHECK :");
        for (int i = 0; i < row; i++) 
        { count=0;
 
            for (int j = 0; j < column; j++) 
            {
                if(matrix[i][j]==0)
                {
                	count=count+1;
                }
            }
            if(count==column)
            {
              System.out.println("this row contain all zeroes");
            }
            
        	}
    	}
	}
}
 
class matrix {
	public static void main(String args[]) {
		MainClass obj = new MainClass();
        obj.create();
        obj.check();
	}
}