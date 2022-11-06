var admin = require("firebase-admin");
var http = require('http');
const express = require('express')
const app = express()
const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore');

var serviceAccount = require("./logicofdivisible-firebase-adminsdk-xjqvt-81a84bfed3.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = getFirestore();

var currentDate = new Date();
var day = 60 * 60 * 24;

// const docRef = db.collection('users').doc();
//  docRef.set({
//   name: 'Arpit',
//   dueDate: currentDate,
// });

// http.createServer(function (req, res) {
//     if (req.url != '/favicon.ico') {
//         console.log('1');
//         closeScheculed();
//         res.writeHead(200, { 'Content-Type': 'application/json' });
//         res.end();
//     }
// }).listen(7000);

app.get('/', function (req, res) {
    emailTrigger();
    closeScheculed();
    mergerMethods();
    res.send('Hello World');
})
app.listen(3000);


async function closeScheculed() {
    console.log('2');
    const snapshot = await db.collection('users')
        .where('dueDate', '<=', currentDate)
        .get();
    //snapshot.docs.map((doc) => console.log(doc.data()));
    snapshot.forEach((doc) => {
        //console.log(doc.data());
        var userData = doc.data();
        console.log(userData.name);
        console.log('Alogorithm Work');
    });
}

async function emailTrigger() {
    const snapshot = await db.collection('users')
        .where('dueDate', '>=', currentDate)
        .get();
    //snapshot.docs.map((doc) => console.log(doc.data()));
    snapshot.forEach((doc) => {
        //console.log(doc.data());
        var userData = doc.data();
        var due = userData.dueDate
        var d = Math.floor(currentDate.getTime() / 1000);
        //console.log(due);
        // console.log(due['seconds']);
        console.log(userData.name);
        var diff = Math.round((due['seconds'] - d) / day)
        console.log(diff);
        if (diff == 5) {
            console.log('Email trigger of Day 5');
        } else if (diff == 3) {
            console.log('Email trigger of Day 3');
        } else if (diff == 1) {
            console.log('Email trigger of Day 1');
        }
    });
}


async function mergerMethods() {
    const snapshot = await db.collection('users').get();

    snapshot.forEach((doc) => {
        //console.log(doc.data());

        var userData = doc.data();
        var dueDate = userData.dueDate;
        var d = Math.floor(currentDate.getTime() / 1000);
        // console.log("d",d);
        // console.log("dueDate",dueDate['seconds']);
        if (dueDate['seconds'] <= d) {
            console.log(userData.name);
            console.log('Alogorithm Work');
        }

        if (dueDate['seconds'] >= d) {
            console.log(userData.name);
            var diff = Math.round((dueDate['seconds'] - d) / day)
            console.log(diff);
            if (diff == 5) {
                console.log('Email trigger of Day 5');
            } else if (diff == 3) {
                console.log('Email trigger of Day 3');
            } else if (diff == 1) {
                console.log('Email trigger of Day 1');
            }
        }
    });
}