import java.util.Scanner;
public class PlaceOrder{
    public static void main(String[] args){
        Scanner keyInput = new Scanner(System.in);
		System.out.print("Quantity: ");
		int q = keyInput.nextInt();
		keyInput.nextLine();
		System.out.print("Description: ");
		String d = keyInput.nextLine();
		System.out.print("Unit price: ");
		float unitPrice = keyInput.nextFloat();
		System.out.println("Order for "+q+" "+d);
		float t = unitPrice*q;
		System.out.printf("Total price %14.2f",t);
	}
}