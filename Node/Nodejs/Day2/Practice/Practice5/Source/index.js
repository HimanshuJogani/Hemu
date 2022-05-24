var fs = require('fs');

fs.rename('person.txt', 'folder/file.txt', function (err) {
  if (err) throw err;
  console.log('File Move!');
}); 