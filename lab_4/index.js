var express = require("express")
var app = express()

// connect to the database
var db = require("./database.js")

// Server
var HTTP_PORT = 8000

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
    var sqlscripit = "select * from Car"
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
    var sqlscripit = "select * from Car where Car_ID = ?"
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
    var sqlscripit = "select * from Owners where Car_ID = ?"
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

