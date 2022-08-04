import mongoose from 'mongoose';
import express , {Express,Request ,Response} from 'express';
import addrouter from './routes/students_routes';

var app = express();
app.use(express.json());


// Connect MongoDB at default port 27017.
mongoose.connect('mongodb://localhost:27017/mydata', {
}, (err) => {
    if (!err) {
        console.log('MongoDB Connection Succeeded.')
    } else {
        console.log('Error in DB connection: ' + err)
    }
});


app.get('/', (req: Request, res: Response) => {
    res.send('MMT Backend development');
    res.end();
});
app.use('/students',addrouter);

app.listen(3000 ,() => {
    console.log(`⚡️[server]: Server is running at 3000`);
});



