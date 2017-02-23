/*
* Author: Yiqing Zhang
* Date: Mar 10, 2016
* Comment: Nim game sample solution in COMP90041
* 
*/

import java.util.Scanner;

/*
This class is a sample solution to the Nim game exercises of COMP90041 class
*/
class Nim{

	public static void main(String[] args){
		System.out.println("Welcome to Nim\n\nPlease enter initial number of stones:");

        //remaining number of stones in the game
        int totalNum = -1;
        Scanner in = new Scanner(System.in);
        totalNum = in.nextInt();

        if(totalNum < 0){
            System.out.println("please enter a number larger than 0");
            return; //actually, you do not have to check this for your code to pass on the server test
        }

        //while loop for each turn
        while(totalNum > 0){
            System.out.print("\n" + Integer.toString(totalNum) + " stones left:");

            //print the asterisks
            printAsterisks(totalNum);

            System.out.print("\nRemove how many?\n");
            
            //read in the next number
            int numToRemove = in.nextInt();

            //update the number of stones, this line is equal as totalNum = totalNum - numToRemove
            totalNum -= numToRemove;
            
        }

        System.out.println("\nGame Over");

	}

    /*
    Helper function to print the stone asterisks, no whitespace at end
    put the code in function make your code more readable, 
    and you can reused the function when needed
    */
    private static void printAsterisks(int numberToPrint){
        for(int i = 0; i < numberToPrint; i++){
            System.out.print(" *");            
        }
    }

}