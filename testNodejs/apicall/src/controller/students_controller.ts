import { usermodel } from "../model/students";
import express , {Express, Request , Response} from 'express'

export = {
     async addstudents(req: Request, res: Response) {
        var std: any = new usermodel(req.body);
        await std.save();
        res.send(std);
    },

     viewStudents(req: Request, res: Response){
        usermodel.find({}, function(err: Error,result: any){
            res.send(result);
            res.end();
        })
    },

     deleteStudents(req: Request, res: Response){
        var id:any = req.params.id
        var query: any = {studentId: id}
        usermodel.deleteOne(query, function(err: Error, result: any){
            res.send(result);
        })
    },

     updateStudents(req: Request, res: Response){
        var data: any = req.body;
        usermodel.updateOne({studentId: data.studentId}, {$set: {name: data.name, mobile: data.mobile, password: data.password}}, function(err: Error, result: any){
                res.send(result);
        })
    }
}