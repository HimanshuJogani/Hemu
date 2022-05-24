var fs = require('fs');

var name = process.argv.slice(2)[0];

fs.appendFile('person.txt', 'Hello '+ name, function (err) {
  if (err) throw err;
  console.log('Saved!');
}); 