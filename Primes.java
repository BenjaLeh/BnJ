public class Primes
{
	public static void main(String[] args)
	{
		int a = Integer.parseInt(args[0]);
		int b = Integer.parseInt(args[1]);
		if(a>b)
		{
			int t = b;
			b = a;
			a = t;
		}
		for (int i=a; i<= b;++i )
		{	
			boolean k = true;
			for (int j=2;j<= Math.floor(Math.sqrt(i));++j)
			{
				if(i%j==0)
				{
				k = false;
				}
			}
			if(k)
			{
			System.out.println(i);
			}
		}
		
	}
}