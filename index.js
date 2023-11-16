const express = require("express");
const db = require("./db");
const app = express();
const port = 3000;
const bodyParser = require('body-parser');

app.use(express.static("public"));
app.use(express.json())
app.use(bodyParser.urlencoded({ extended: true }));

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
        const result = await db.query('SELECT * FROM public."bodega" ORDER BY nombre_prod;');
        var i = result.rowCount;
        let nombres = [];
        let cantidad = [];
        for (let index = 0; index < i; index++) {
            nombres.push(result.rows[index].nombre_prod);
            cantidad.push(result.rows[index].cantidad);
        }
        res.render("pages/index.ejs", {
            nombre_prod: nombres,
            numero: cantidad,
            i: i,
        });
    } catch (err) {
        console.error(err);
        res.status(500).send("Internal Server Error");
    }
});

app.get("/modProd", (req, res) => {
    var nombre_prod = req.query.nombre_prod;
    let cantidad = req.query.cantidad;
    res.render("pages/modProd.ejs",{nombre_prod: nombre_prod, cantidad: cantidad});
});

app.get("/agregar", (req, res) => {
    res.render("pages/agregar.ejs");
});

app.post("/agregar", async (req, res) => {
    const nombre_prod3 = req.body.nombre;
    const cantidad3 = req.body.cantidad;
    try {
        const query =  `INSERT INTO public.bodega(nombre_prod, cantidad) VALUES ('${nombre_prod3}', ${cantidad3}); `
        console.log(query);
        const result = await db.query(query);
        console.log(result);
        const query2 =  `SELECT * FROM  public.bodega ORDER BY nombre_prod ASC`
        const result2 = await db.query(query2);
        var i = result2.rowCount;
        let nombres = [];
        let cantidad = [];
        for (let index = 0; index < i; index++) {
            nombres.push(result2.rows[index].nombre_prod);
            cantidad.push(result2.rows[index].cantidad);
        }
        
        res.render("pages/index.ejs", {
            nombre_prod: nombres,
            numero: cantidad,
            i: i,
        });

    } catch (error) {
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
    
});

app.post("/modificar", async (req, res) => {
    const nombreAnterior = req.body.nombreAnterior;
    const nombre_prod = req.body.nombre;
    const cantidad2 = req.body.cantidad;
    try {
        const query =  `UPDATE public.bodega SET "nombre_prod"= '${nombre_prod}' , cantidad='${cantidad2}' WHERE bodega.nombre_prod = '${nombreAnterior}'; `
        console.log(query);
        const result = await db.query(query);
        console.log(result);
        const query2 =  `SELECT * FROM  public.bodega ORDER BY nombre_prod ASC`
        const result2 = await db.query(query2);
        var i = result2.rowCount;
        let nombres = [];
        let cantidad = [];
        for (let index = 0; index < i; index++) {
            nombres.push(result2.rows[index].nombre_prod);
            cantidad.push(result2.rows[index].cantidad);
        }
        console.log(nombre_prod);
        res.render("pages/index.ejs", {
            nombre_prod: nombres,
            numero: cantidad,
            i: i,
        });

    } catch (error) {
        console.error(error);
        res.status(500).send("Internal Server Error");
    }



});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
