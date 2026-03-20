<div style="text-align: center;">
    <p>Please enter the time (in seconds):</p>
    <input id="timeInput" type="text">
    <br><br>
    <button onclick="countDown()">Start Countdown</button>
    <p id="disp" style="font-size:100px;"></p>

    <script>
        function countDown() {
            let secs = document.getElementById("timeInput").value;
            try {
                // validation
                if(secs.trim() == "") throw "Time input is empty";
                if(isNaN(secs)) throw "Time input is not a number";
                secs = Number(secs);
                if(secs < 0) throw "Time input cannot be negative";
                if(secs == 0 || secs == 1) throw "Time input should be more than 1 second";

                // setTimeout function expression
                setTimeout(() => {
                    document.getElementById("disp").innerHTML = "Time's up!";
                }, secs * 1000);

            } catch (error) {
                alert(error);
                return;
            }
        }
    </script>
</div>


Explanation:
1. First we get the value from the input field and store it in the variable secs

2. using try-catch block we validate the input value. Using throw statement we create a custom error
    eg:  if(secs.trim() == "") throw "Time input is empty";
        -> this prevents from taking empty value by throwing custom error "Time input is empty"

3. After the validation is done and the imput is valid number, we use setTimeout function expression
    to do the counting. Inside setTimeout expression, we place the code for displaying message
    once the counting is done.

        setTimeout(() => {
            document.getElementById("disp").innerHTML = "Time's up!";
        }, secs * 1000);

    setTimeout does one thing only:
    -> waits for secs * 1000 milliseconds then runs the callback once.


💡 Callback: PASSING FUNCTION TO ANOTHER FUNCTION AS A PARAMETER

        setTimeout( function() {
            document.getElementById("disp").innerHTML = "Time's up!";
        }, secs * 1000);

    -> Here, function() is passed as a parameter for a setTimeout function so function() is a
        callback
    -> After secs * 1000 milliseconds is over, call back will run once to display the "Time's up".