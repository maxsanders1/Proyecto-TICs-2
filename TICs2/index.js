const express = require("express");
const db = require("./db");
const app = express();
const port = 3000;

app.use(express.static("public"));

app.get("/", (req, res) => {
    res.send("Test TICS db");
});

app.get("/db", async (req, res) => {
    try {
        const result = await db.query('SELECT * FROM public."planillaProd";');
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).send("Internal Server Error");
    }
});

app.get("/inventario", async (req, res) => {
    try {
        const result = await db.query('SELECT * FROM public."bodega";');
        console.log(result);
        var i = result.rowCount;
        let nombres = [];
        let cantidad = [];
        for (let index = 0; index < i; index++) {
            nombres.push(result.rows[index].nombreProd);
            cantidad.push(result.rows[index].cantidad);
        }
        console.log(nombres);
        console.log(cantidad);
        res.render("pages/index.ejs", {
            nombreProd: nombres,
            numero: cantidad,
            i: i,
        });
    } catch (err) {
        console.error(err);
        res.status(500).send("Internal Server Error");
    }
});

app.get("/modProd", (req, res) => {
    res.render("pages/modProd.ejs");
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
