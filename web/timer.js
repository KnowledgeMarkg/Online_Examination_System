/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var minutes = 10;
minutes--;
   if (minutes < "10") {
                  minutes = "0" + minutes;
            }
var seconds = 60;
document.getElementById("minutes").innerHTML = minutes + "<span>Minutes</span>";
document.getElementById("seconds").innerHTML =seconds + "<span>Seconds</span>";
//it calls fuction after specific time again and again                  
var x = window.setInterval(timerFunction, 1000);
function timerFunction() {
      seconds--;
      // Display the result in the element with id="demo"
            if (seconds < "10") {
                  seconds = "0" + seconds;
            }

      if (minutes < 1) {
            clearInterval(x);
            document.getElementById("minutes").innerHTML = "00";
            document.getElementById("seconds").innerHTML = "00";
            document.getElementById("myform").submit();
      }
      document.getElementById("minutes").innerHTML = minutes + "<span>Minutes</span>";
      document.getElementById("seconds").innerHTML = seconds + "<span>Seconds</span>";
      if (seconds == 0) {
            seconds = 59;
            minutes--;
      }
}