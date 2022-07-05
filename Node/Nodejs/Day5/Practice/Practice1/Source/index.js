
// Event Emitter

var EventEmitter = require('events');
const myEmitter = new EventEmitter();

function c1() {
   console.log('an event occurred!');
}

function c2() {
   console.log('yet another event occurred!');
}

myEmitter.on('eventOne', c1); 
myEmitter.on('eventOne', c2); 
myEmitter.on('start', number => {
    console.log(`started ${number}`);
})
myEmitter.on('started', (start, end) => {
    console.log(`started from ${start} to ${end}`);
});
  
  

myEmitter.emit('eventOne');
myEmitter.emit('start', 20);
myEmitter.emit('started', 1, 100);