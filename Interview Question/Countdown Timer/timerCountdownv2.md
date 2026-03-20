<div style = "text-align: center;">
    <p>Please enter the time (in seconds):</p>
    <input id = "timeInput" type = "text" placeholder = "Time in seconds">
    <button id = "startBtn">Start Countdown</button>
    <p id="disp" style="font-size:50px;"></p>

    <script>
        const inputVal = document.getElementById("timeInput");
        const start = document.getElementById("startBtn");
        const display = document.getElementById("disp");

        let endTime = null;
        // let timerId = null;

        start.addEventListener("click", () => {
            const seconds = parseInt(inputVal.value);   // return NaN if input is not a number

            if(isNaN(seconds) || seconds <= 0) {
                display.textContent = `Please enter a positive number greater than 0.`;
                return;
            }

            endTime = Date.now() + seconds * 1000;  // into milliseconds

            // kill any previous timer (important)
            // if (timerId) clearTimeout(timerId);

            update();
        });

        function update() {
            const remaining = Math.max(0, endTime - Date.now());
            const secs = Math.ceil(remaining / 1000);   // back to seconds
            display.textContent = secs; // live update of remaining seconds

            if(remaining > 0) {
                // timerId = setTimeout(update, 250);
                setTimeout(update, 1000);
            }

            if(remaining === 0) {
                display.textContent = "Time's up!";
            }
        }
    </script>
</div>


Explanation:
1. First we validate the inputs:

    const seconds = parseInt(inputVal.value);   // return NaN if input is not a number

    if(isNaN(seconds) || seconds <= 0) {
        display.textContent = `Please enter a positive number greater than 0.`;
        return;
    }

2. Since we want to display a live countdown we need to work with the Date objects.

        endTime = Date.now() + seconds * 1000;

    Note that defining variables remaining and secs constants outside the update function does not work

        const remaining = Math.max(0, endTime - Date.now());    // select max value
        const secs = Math.ceil(remaining / 1000);   // round up to its near integer
        display.textContent = secs; // live update of remaining seconds

3. We place setTimeout function inside if statement. setTimeout will only execute if remaining > 0

4. When the remaining === 0(strict/equal value and type), we display "Time's up".

5. Potential Question: WHY CAN'T WE JUST GET THE INPUT VALUE WHERE WE DEFINE THE inputVal CONSTANTS
                        FOR REDUCING DOM ACCESS(PERFORMANCE OPTIMIZATION)?

        const inputVal = document.getElementById("timeInput").value;    ❌
        const seconds = parseInt(inputVal);

    Reasons:
    1) This line runs immediately when the script loads and at the moment, the input field is empty
    2) Then later when we do const seconds = parseInt(inputVal);, we are passing the old stored    value  which is ""(empty), not the current value(user typed) so even if the user enter valid values say 10, code is using the initial empty value so the correct approach is

        const inputVal = document.getElementById("timeInput");  ✅
        const seconds = parseInt(inputVal.value);

6. Note that we did not bind the button with the the addEventListener method or click event handler. And from inside the event handler, we call the update function that does the actual counting.

        start.addEventListener("click", () => {
            const seconds = parseInt(inputVal.value);   // return NaN if input is not a number

            if(isNaN(seconds) || seconds <= 0) {
                display.textContent = `Please enter a positive number greater than 0.`;
                return;
            }

            endTime = Date.now() + seconds * 1000;  // into milliseconds

            // kill any previous timer (important)
            // if (timerId) clearTimeout(timerId);

            update();
        });
    
    1) Here, Arrow function is a callback function
    2) simplified code will look like:

        function handleClick() {
            const seconds = parseInt(inputVal.value);   // return NaN if input is not a number

            if(isNaN(seconds) || seconds <= 0) {
                display.textContent = `Please enter a positive number greater than 0.`;
                return;
            }

            endTime = Date.now() + seconds * 1000;  // into milliseconds

            // kill any previous timer (important)
            // if (timerId) clearTimeout(timerId);

            update();
        }
        start.addEventListener("click", handleClick);