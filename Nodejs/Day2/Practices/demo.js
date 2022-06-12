var data = require('./index');

data.areaofcircle(3,4);


class mobike {
    constructor(name,phoneno,bikeno,noofday){
        this.name = name;
        this.phoneno = phoneno;
        this.bikeno = bikeno;
        this.noofday = noofday;
    }

    compute(noofday){

       if(!isNaN(noofday)){
        console.log('0');
       } else if(noofday < 5){
        var rent = noofday * 500;
           console.log(this.name);
           console.log(this.phoneno);
           console.log(this.bikeno);
           console.log(rent);
       } else {
           console.log('done');
       }

    }
}