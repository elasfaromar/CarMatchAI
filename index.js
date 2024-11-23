const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const app = express();
const fs = require('fs');
const port = 3000;

const db = new sqlite3.Database('./cars.db');

// Set up the express app
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true })); // to parse form data

// Serve static files from the 'photos' folder
app.use('/photos', express.static(path.join(__dirname, 'photos')));

// Route to get the 10 random cars
app.get('/', (req, res) => {
    db.all("SELECT * FROM cars ORDER BY RANDOM() LIMIT 10", (err, cars) => {
        if (err) {
            return res.status(500).send("Error retrieving cars from database.");
        }
        res.send(`
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Car Match AI</title>
            </head>
            <body>
                <h1>Rate Your Cars</h1>
                <form action="/submit" method="POST">
                    ${cars.map(car => `
                        <div>
                            <h2>${car.name}</h2>
                            <p>MSRP: $${car.msrp} USD</p>
                            <p>Gas Efficiency: ${car.gas} L/100km | Relibality Score: ${car.reliability}/100</p>
                            <p>Horse Power: ${car.hp} Hp | Seats: ${car.seats}</p>
                            <p>Length: ${car.length/100} m | Width: ${car.width/100} m | Height: ${car.height/100} m</p>
                            <img src="${car.photo}" alt="${car.photo}" style="width:400px;">
                            <p>Rate this car:</p>
                            <input type="number" name="${car.name}" min="0" max="100" required>
                        </div>
                    `).join('')}
                    <button type="submit">Submit Ratings</button>
                </form>
            </body>
            </html>
        `);
    });
});

// Route to handle form submission
app.post('/submit', (req, res) => {
    const ratings = req.body;
    const carNames = Object.keys(ratings);

    carNames.forEach((carName) => {
        const rating = ratings[carName];
        console.log(carNames);
        db.run("UPDATE cars SET score = ? WHERE name = ?", [rating, carName], (err) => {
            console.log(carName.split('_')[1]);
            if (err) {
                console.error("Error updating score for " + carName);
            }
        });
    });
    res.send("<h1>Thank you for your ratings!</h1>");
});

// Watch for changes to the database file
const dbFilePath = path.join(__dirname, 'cars.db');
fs.watch(dbFilePath, (eventType, filename) => {
    if (eventType === 'change') {
        console.log('Database file changed. Fetching updated data...');
        db.all("SELECT * FROM cars ORDER BY score DESC", (err, cars) => {
            if (err) {
                return console.error("Error retrieving updated cars:", err);
            }
            console.log("Cars ordered by score (high to low):");
            cars.forEach(car => {
                console.log(`Name: ${car.name}, Score: ${car.score}`);
            });
        });
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
