function addInput()
    {
        var amount = document.getElementById("test_case_input").value;
        var inputs = document.getElementById("multiple_inputs");
        
        while(inputs.firstChild) 
        { 
            inputs.removeChild(inputs.firstChild); 
        }

        for(var i = 0 ; i < amount ; i++)
        {
            inputs.innerHTML += "<label>Enter TestCase values :</label><br><input type='text' name='num"+i+"'placeholder='Enter Test Case Values' class='js-input'/><br>"; 
        }
        
         
    }