/* Sample to demonstrate coding style.
 * NOTE this is not a good sample solution to Exercise 1.
 * Jianzhong Qi, 24/03/2016
 */
import java.util.Scanner;
public class Nim {					
	public static final int STONE_UPPERBOUND = 3;
	public static void main(String[] args) {
		int numberOfStones, numberToRemove; // Good variable names
		int a, b, c; // Bad variable names
		int i;
		Scanner keyboard = new Scanner(System.in);
		System.out.println("Welcome to Nim");
		System.out.println();
		System.out.println("Please enter initial number of stones:");
		// Lack of whitespace in the piece of code above, that is, there is no space between lines at all.
		
		numberOfStones = keyboard.nextInt();

		while (numberOfStones > 10) // Use of magic number
		{ // Inconsistent braces
			System.out.println();
			System.out.print(numberOfStones + " stones left:");
	
			printStones(numberOfStones);
	 
		// Bad indentation
		System.out.println("Remove how many?");
		numberToRemove = keyboard.nextInt();
		numberOfStones -= numberToRemove;
		}
		System.out.println();
		System.out.println("Game Over");
	}
	// Bad method name
	public static void functionA() {
		return 0;
	}
	// Good method name
	public static void printStones(int numberOfStones) {
		int i;
		for (i = 1; i <= numberOfStones; i++) {
			System.out.print(" *");
		}
		System.out.print("\n");
	}
}
