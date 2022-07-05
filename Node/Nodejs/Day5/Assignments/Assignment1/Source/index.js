

//University of Mumbai needs to set an online exam for their students. 
//For that they need to set a timer for three hours. 
//After 3 hours exams should be finished.
//Once Exam is started start event should be invoke and When we end the exam end event should be call.


var myTimer;
function clock() {
    myTimer = setInterval(myClock, 1000);
    var c = 10800; 


    function myClock() {
        --c
        var seconds = c % 60; 
        var secondsInMinutes = (c - seconds) / 60; 
        var minutes = secondsInMinutes % 60; 
        var hours = (secondsInMinutes - minutes) / 60;
        
        console.clear();
        console.log(hours + ":" + minutes + ":" + seconds)
        if (c == 0) {
            setTimeout(() => {
                console.log("Exam is Over");
                clearInterval(myTimer);
            }, c);
        }
    }
}

clock();