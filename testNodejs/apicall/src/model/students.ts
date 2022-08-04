
import mongoose from "mongoose";

// Declare the Schema of the Mongo model
var userSchema = new mongoose.Schema({
    studentId: {
        type:Number,
        required:true,
        unique:true,
        index:true,
    },
    name: {
        type:String,
        required:true,
    },
    mobile: {
        type:Number,
        required:true,
    },
    password:{
        type:String,
        required:true,
    },
});

const usermodel = mongoose.model('students',userSchema);
export {usermodel} 