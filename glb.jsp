<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport">
    <title>Golomb Series</title>
    <link rel="icon" type="image/png"  href="java_logo.png">
    <link rel="stylesheet" href="glb.css">
</head>
<body>
    <table>
        <tr>
            <th>S.No</th>
            <th>Test Case Values</th>
            <th>Answers</th>
        </tr>
        
        <%!
        class GolombSequence
        {
            private  long first_term , last_term ;

            private Dictionary<Long,Long> golomb_remember = new Hashtable<Long,Long>();

            private long sum = 0;

            public GolombSequence()
            {
                ;
            }
            
            public void input(long a , long b)
            {
            	first_term = a;
            	last_term = b;
            	sum = 0;
            }

            private long findGolomb(long n) 
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

            public void Golomb_create()
            {
                for(long k = first_term ; k <= last_term ; k++)
                {
                    if(golomb_remember.get(k) == null)
                    {
                        long temp = findGolomb(k);
                        golomb_remember.put(k,temp);
                        sum = sum + temp*temp;
                    }

                    else
                    {
                    	sum = sum + golomb_remember.get(k)*golomb_remember.get(k);
                    } 
                }

            }


            public long get_sum()
            {
                return sum;
            }

        }

        %>
        
        
        <%  
            long i = Long.parseLong(request.getParameter("test_case_input"));
            GolombSequence series = new GolombSequence();
            int k = 0;
        
            for(k=0;k<i;k++)
            {
                String  s = request.getParameter("num"+k);
                String [] arr = s.split(" ");
                
                try
                {
            
                    int a = Integer.parseInt(arr[0]);
                	int b = Integer.parseInt(arr[1]);
                
            
                	series.input(a, b);
                	series.Golomb_create();
                
                	out.println("<tr>");
                
                	out.print("<td>");
                	out.print(k+1);
                	out.print("</td>");
                
                	out.print("<td>");
                	out.print(s);
                	out.print("</td>");
                
                	out.print("<td>");
                	out.print(series.get_sum());
                	out.print("</td>");
                
                }
                
                catch (Exception e)
                {
                	out.println("<tr>");
                    
                	out.print("<td>");
                	out.print(k+1);
                	out.print("</td>");
                
                	out.print("<td>");
                	out.print(s);
                	out.print("</td>");
                
                	out.print("<td>");
                	out.print("Invalid Input");
                	out.print("</td>");
                }
              
        }
            
        %>

    </table>
    
    <section>
        <p class="asb"> For another submission <a href="index.html"> Click Here </a> </p>
    </section>
</body>
</html>