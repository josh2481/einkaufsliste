const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());

// Einkaufslisten-Daten
let einkaufsliste = [];

// API-Endpunkte
app.get("/liste", (req, res) => res.json(einkaufsliste));
app.post("/liste", (req, res) => {
    const item = req.body.item;
    if (item) {
        einkaufsliste.push(item);
        res.json({ message: "Item hinzugefügt!", liste: einkaufsliste });
    } else {
        res.status(400).json({ message: "Kein Item übermittelt." });
    }
});
app.delete("/liste", (req, res) => {
    einkaufsliste = [];
    res.json({ message: "Liste geleert!" });
});

// Statische Dateien (Frontend)
app.use(express.static("public"));

// Server starten
const PORT = 3000;
app.listen(PORT, () => console.log(`Server läuft auf http://localhost:${PORT}`));