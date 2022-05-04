var express = require("express")
var app = express()

// connect to the database
var db = require("./database.js")

// Server
var HTTP_PORT = 8000

// hashing for password later
var md5 = require("md5")


// Formatting
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// start server
app.listen(HTTP_PORT, () => {
    console.log("Server running on port %PORT%".replace("%PORT%", HTTP_PORT))
});


// root endpoint
app.get("/", (req, res, next) => {
    res.json({"message": "Success"})
});

// Credit to website below most infomormation from this lab was gotten here
// https://developerhowto.com/2018/12/29/build-a-rest-api-with-node-js-and-express-js/

// Shows all from table "Car_info"
app.get("/api/all", (req,res,next) => {
    var sqlscripit = "select * from Car_info"
    var params = []
    db.all(sqlscripit, params, (err, rows) =>{
        if(err){
            res.status(400).json({"error":err.message});
            return;
        }
        res.json({
            "message":"success",
            "data":rows
        })
    });
});


// selects all from the table "Car"
app.get("/api/cars", (req,res,next) => {
    var sqlscripit = "select * from Cars"
    var params = []
    db.all(sqlscripit, params, (err, rows) =>{
        if(err){
            res.status(400).json({"error":err.message});
            return;
        }
        res.json({
            "message":"success",
            "data":rows
        })
    });
});

// select all from table "Owners"
app.get("/api/owners", (req,res,next) => {
    var sqlscripit = "select * from Owners"
    var params = []
    db.all(sqlscripit, params, (err, rows) =>{
        if(err){
            res.status(400).json({"error":err.message});
            return;
        }
        res.json({
            "message":"success",
            "data":rows
        })
    });
});

// select Car from table "Car" where Car_Id = parameter passed
app.get("/api/cars/:carid", (req,res,next) => {
    var sqlscripit = "select * from Cars where Car_ID = ?"
    var params = [req.params.carid]
    db.all(sqlscripit, params, (err, rows) =>{
        if(err){
            res.status(400).json({"error":err.message});
            return;
        }
        res.json({
            "message":"success",
            "data":rows
        })
    });
});

// select all owners where car_id = parameter passed
app.get("/api/owners/:carid", (req,res,next) => {
    var sql = "select * from Owners where Car_ID = ?"
    var params = [req.params.carid]
    db.all(sql, params, (err, rows) =>{
        if(err){
            res.status(400).json({"error":err.message});
            return;
        }
        res.json({
            "message":"success",
            "data":rows
        })
    });
});



app.post("/api/owners/", (req, res, next) => {
    var errors=[]
    if (!req.body.Car_ID){
        errors.push("No Car_Id specified");
    }
    if (!req.body.Name){
        errors.push("No Name specified");
    }
    if (!req.body.Email){
        errors.push("No email specified");
    }
    if (errors.length){
        res.status(400).json({"error":errors.join(",")});
        return;
    }
    var data = {
        Car_ID: req.body.Car_ID,
        Name: req.body.Name,
        Email: req.body.Email
    }
    var sql ='INSERT INTO Owners (Car_ID, Name, Email) VALUES (?,?,?)'
    var params =[data.Car_ID, data.Name, data.Email]
    db.run(sql, params, function (err, result) {
        if (err){
            res.status(400).json({"error": err.message})
            return;
        }
        res.json({
            "message": "success",
            "data": data,
            "id" : this.lastID
        })
    });
})


// b. Inserting new data record of cars by post 
app.post("/api/cars/", (req, res, next) => {
    var errors=[]
    if (!req.body.Car_ID){
        errors.push("No id specified");
    }
    if (!req.body.Year){
        errors.push("No year specified");
    }
    if (!req.body.Make){
        errors.push("No make specified");
    }
    if (!req.body.Model){
        errors.push("No model specified");
    }
    if (errors.length){
        res.status(400).json({"error":errors.join(",")});
        return;
    }
    var data = {
        Car_ID: req.body.Car_ID,
        Year: req.body.Year,
        Make: req.body.Make,
        Model: req.body.Model
    }
    var sql ='INSERT INTO Cars (Car_ID, Year, Make, Model) VALUES (?,?,?,?)'
    var params =[data.Car_ID, data.Year, data.Make, data.Model]
    db.run(sql, params, function (err, result) {
        if (err){
            res.status(400).json({"error": err.message})
            return;
        }
        res.json({
            "message": "success",
            "data": data,
            "id" : this.lastID
        })
    });
});

// Update information on Cars using carid
app.patch("/api/cars/:carid", (req, res, next) => {
    var data = {
        carid: req.params.carid,
        Year: req.body.Year,
        Make: req.body.Make,
        Model: req.body.Model
    }
    db.run(
        `UPDATE Cars set  
           Year = COALESCE(?,Year), 
           Make = COALESCE(?,Make),
           Model = COALESCE(?,Model) 
           WHERE Car_ID = ?`,
        [data.carid, data.Year, data.Make, data.Model],
        function (err, result) {
            if (err){
                res.status(400).json({"error": res.message})
                return;
            }
            res.json({
                message: "success",
                data: data,
                changes: this.changes
            })
    });
});

// updating information on owner Table by the Owner's carid
app.patch("/api/owners/:carid", (req, res, next) => {
    var data = {
        carid: req.params.carid,
        Email: req.body.Email,
        Name : req.body.Name
    }
    db.run(
        `UPDATE Owners set 
           Name = COALESCE(?,Name), 
           Email = COALESCE(?,Email), 
           password = COALESCE(?,password) 
           WHERE Car_ID = ?`,
        [data.name, data.email, data.carid],
        function (err, result) {
            if (err){
                res.status(400).json({"error": res.message})
                return;
            }
            res.json({
                message: "success",
                data: data,
                changes: this.changes
            })
    });
})

// Deleting information from Owner table by Car_ID
app.delete("/api/owners/:carid", (req, res, next) => {
    db.run(
        'DELETE FROM Owners WHERE Car_ID = ?',
        req.params.id,
        function (err, result) {
            if (err){
                res.status(400).json({"error": res.message})
                return;
            }
            res.json({"message":"deleted", changes: this.changes})
    });
})

// Deleting information from Cars table by Car_ID
app.delete("/api/cars/:carid", (req, res, next) => {
    db.run(
        'DELETE FROM Cars WHERE Car_ID = ?',
        req.params.id,
        function (err, result) {
            if (err){
                res.status(400).json({"error": res.message})
                return;
            }
            res.json({"message":"deleted", changes: this.changes})
    });
})