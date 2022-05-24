var fs = require("fs");

fs.readFile('address.txt',(err, data)=>{
    
    var data1 = data.toString();

        var vowels = 0,
          consonant = 0
    
        for (var i in data1) {
          var ch = data1[i];
 
          if ((ch >= "a" && ch <= "z") ||
          (ch >= "A" && ch <= "Z")) {
          
            ch = ch.toLowerCase();
 
            if (ch == "a" || ch == "e" || ch == "i" ||
            ch == "o" || ch == "u")
            vowels++;
            else 
            consonant++;
          } 
        }
        console.log("Consonant: " + consonant);
   
});