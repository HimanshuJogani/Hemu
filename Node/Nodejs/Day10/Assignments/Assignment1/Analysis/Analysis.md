
=> Day9 task should be done MongoDB.

For Implementation of folder strcture in nodejs, create five folder.
1. controller
2. data / model
3. middleware
4. routes
5. util

- Your working flow start from data or model folder.
- Add your data into mongodb Compass.
- Declare the model file in model folder.
- Call that model file into the controller folder.
- In controller folder, add your logic or method.
- In controller folder, there are three files. Employee ,students and authencation file.
- In the employee and students file ,there is different method in it.
- In authencation file , there is verification method of login.
- Now , All controller files call into the routes folder in different routes file.
- In routes file , use the get method of express for getting the data into the browers with user authencate.
- All the routes file call into the main file.
- Add the routes or url into the main file using the use method of the express.
- Middleware folder is use for the verification of user.
- Util folder is used for configuration.
- Listening at port number 3000.
