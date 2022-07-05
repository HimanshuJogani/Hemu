
// Path

var path = require('path');
var filename = path.basename('/Users/Refsnes/demo_path.js');
var file = path.win32.basename('C:\\temp\\myfile.html');
var file1 = path.posix.basename('/tmp/myfile.html');
var file2 = path.extname('index.html');
var file3 = path.format({
    root: '/ignored',
    dir: '/home/user/dir',
    base: 'file.txt'
  });
var file4 = path.isAbsolute('/foo/bar'); 
var file5 = path.join('/foo', 'bar', 'baz/asdf', 'quux', '..');
var file6 = path.normalize('C:\\temp\\\\foo\\bar\\..\\');
var file7 = path.parse('C:\\path\\dir\\file.txt');
var file8 = path.relative('C:\\orandea\\test\\aaa', 'C:\\orandea\\impl\\bbb');
var file9 = path.resolve('/foo/bar', './baz');
var file10 = 'foo\\bar\\baz'.split(path.sep);



console.log(filename);
console.log(file);
console.log(file1);
console.log(file2);
console.log(file3);
console.log(file4);
console.log(file5);
console.log(file6);
console.log(file7);
console.log(file8);
console.log(file9);
console.log(file10);