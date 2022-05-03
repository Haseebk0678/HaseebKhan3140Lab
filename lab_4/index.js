var express = require("express")
var app = express()

// connect to the database
var db = require("./database.js")

// Server
var HTTP_PORT = 8000

// start server
app.listen(HTTP_PORT, () => {
    console.log("Server running on port %PORT%".replace("%PORT%", HTTP_PORT))
});

// root endpoint
app.get("/", (req, res, next) => {
    res.json({"message": "Success"})
});
