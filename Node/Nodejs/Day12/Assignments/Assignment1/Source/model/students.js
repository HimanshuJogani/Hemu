const mongoose = require('mongoose');

const studentsData = new mongoose.Schema({ 
        ID: {
          type: Number,
          unique: true
        },
        Name: {
          type: String,
          required: true,
        },
        Address: {
          type: String,
          required: true,
        },
        Fees: {
          Amount: {
            type: Number,
            min: 0
          },
          PaymentDate: {
            type: Date
          },
          Status: {
            type: String,
            enum: ["true","false"]
          }
        },
        Result: {
          Hindi: {
            type: Number,
            min: 0,
            max: 100
          },
          Eng: {
            type: Number,
            min: 0,
            max: 100
          },
          Math: {
            type: Number,
            min: 0,
            max: 100
          },
          Total: {
            type: Number,
            min: 0,
            max: 400
          },
          Grade: {
            type: String,
            enum: ["A","B","C","D"]
          }
        }
      
 });

 module.exports = mongoose.model("students",studentsData);