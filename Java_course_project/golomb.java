import java.util.*;

class golomb
{
    private  long first_term , last_term ;

    private Dictionary<Long,Long> golomb_remember = new Hashtable<Long,Long>();
    private Vector<Long> gb_series_storer = new Vector<Long>();

    private long sum = 0;
    golomb(long a , long b)
    {
        first_term = a;
        last_term = b;
    }

    long findGolomb(long n) 
    {
        if (n == 1) 
        {
            return 1;
        }

        else if(golomb_remember.get(n) != null)
        {
            return  (golomb_remember.get(n));
        }

        else 
        {
            long temp_rem = (1 + findGolomb(n - findGolomb(findGolomb(n - 1))));
            golomb_remember.put(n , temp_rem);
            return temp_rem;
        }
    }

    void Golomb_create()
    {
        for(long k = first_term ; k <= last_term ; k++)
        {
            if(golomb_remember.get(k) == null)
            {
                long temp = findGolomb(k);
                golomb_remember.put(k,temp);
                gb_series_storer.add(temp);
            }

            else
            {
                gb_series_storer.add(golomb_remember.get(k));
            } 
        }

        Golomb_sq_sum_cal();
        sum_printer();

    }

    private void Golomb_sq_sum_cal()
    {
        int len = gb_series_storer.size();

        for(int it = 0; it < len ; it++)
        {
            sum = sum + (gb_series_storer.get(it) * gb_series_storer.get(it));
        }
    }

    private void sum_printer()
    {
        System.out.println(sum);
    }



}

class Main 
{
    public static void main(String[] args) 
    {
        Scanner ipt = new Scanner(System.in);
        int test_cases = ipt.nextInt();
        
        for (int i = 1; i <= test_cases; i++) 
        {
            long a = ipt.nextLong();
            long b = ipt.nextLong();
            golomb gb_series = new golomb(a, b);
            gb_series.Golomb_create();
        }
        
    }
}
