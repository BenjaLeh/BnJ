public class Greeting
{
	public static void main(String[] args)
	{
		String name=args[0];
		String place=args[1];
		String PLACE=args[1].toUpperCase();
		System.out.println("Hello "+name+" from "+place+".");
		System.out.println("I\'VE ALWAYS WANTED TO GO TO "+PLACE);
	}
}