
// Closure

function makeFunc() {
  var name = 'Himanshu Jogani';
  function displayName() {
    console.log(name);
  }
  return displayName;
}

var myFunc = makeFunc();
myFunc();




