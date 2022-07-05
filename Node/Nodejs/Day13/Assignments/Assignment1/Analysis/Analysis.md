For Implementation of folder strcture in nodejs, create five folder.
1. controller
2. data / model
3. middleware
4. routes
5. util

- Working flow start from data or model folder.
- Add your data into mongodb Compass.
- Declare the model file in model folder.
- Call that model file into the controller folder.
- In controller folder, add your logic or method.
- In controller folder, there are five files. Assistant ,Department , Doctor, Drugs and Patients file.
- Delcare the methods of insert doctor, delete doctor and update doctor.
- In the Patients file , Declare the patientsreport method and patients list method.
- Now , All controller files call into the routes folder in different routes file.
- In routes file , use the get method of express for getting the data into the browers.
- All the routes file call into the main file.
- Add the routes or url into the main file using the use method of the express.
- Listening at port number 3000.
