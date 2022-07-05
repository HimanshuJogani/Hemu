const mongoose = require('mongoose');

const studentsData = new mongoose.Schema({ 
        ID: {
          type: Number
        },
        Name: {
          type: String
        },
        Address: {
          type: String
        },
        Fees: {
          Amount: {
            type: Number
          },
          PaymentDate: {
            type: Date
          },
          Status: {
            type: String
          }
        },
        Result: {
          Hindi: {
            type: Number
          },
          Eng: {
            type: Number
          },
          Math: {
            type: Number
          },
          Total: {
            type: Number
          },
          Grade: {
            type: String
          }
        }
      
 });

 module.exports = mongoose.model("students",studentsData);