var fs = require('fs');

fs.appendFile('person.txt', 'Hello World' + ' Hello India', function (err) {
  if (err) throw err;
  console.log('Saved!');
}); 
