// Timers

  // SetTimeOut
var a,b;
const myFunction = (a, b) => {
    var c = a + b;
    console.log(c);
  };
  
  setTimeout(myFunction, 50, 5, 4);
  

  // Zero Delay
function settime(){
  setTimeout(() => {
    console.log('after ');
  }, 0);
  console.log('before ');
}

settime();
  

// SetTimeInterval

function setinterval() {
const id = setInterval(() => {
    console.log('settimeinterval');
  }, 2000);
}

setinterval();
  
  