
 class Mobike {
    constructor(bikeno, phone, name, noofday) {
        this.bikeno = bikeno;
        this.phone = phone;
        this.name = name;
        this.noofday = noofday;
  
    }
    compute(noofday) {
        var rent = 0;
        if (isNaN(noofday)) {
            console.log("Please Enter vaild No of Day");
        }
        else if (noofday <= 5) {
            var rent = noofday * 500;
            console.log("Bike Number is :" + this.bikeno);
            console.log("Customer Name is :" + this.name);
            console.log("Customer Number is :" + this.phone);
            console.log("Bike Rent is " + rent);
        }
        else if (noofday <= 10) {
            var rent = 2500 + ((noofday - 5) * 400);
            console.log("Bike Number is :" + this.bikeno);
            console.log("Customer Name is :" + this.name);
            console.log("Customer Number is :" + this.phone);
            console.log("Bike Rent is " + rent);
  
        }
        else {
            var rent = 4500 + ((noofday - 10) * 200);
            console.log("Bike Number is :" + this.bikeno);
            console.log("Customer Name is :" + this.name);
            console.log("Customer Number is :" + this.phone);
            console.log("Bike Rent is " + rent);
        }
    }
  
  }

  module.exports = Mobike;