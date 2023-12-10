const express = require("express");
const db = require("./db");
const app = express();
const port = 3000;
const bodyParser = require('body-parser');

app.use(express.static("public"));
app.use(express.json())
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req,res) =>{
    res.send("<h1>PAGINA PRINCIPAL<h1/>");
});

app.get("/admin", async (req, res) => {
    const date_ob = new Date();
    const date = ("0" + date_ob.getDate()).slice(-2);
    const month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
    const year = date_ob.getFullYear();
    console.log(year + "-" + month + "-" + date);
    const day = year + "-" + month + "-" + date
    try {
        const result = await db.query(`SELECT monto, precio_ben FROM public.ventas_ben WHERE fecha = '${day}' ;`);
        const count = result.rowCount
        const monto = []
        const precio = []
        for (let index = 0; index < count; index++) {
            monto.push(result.rows[index].monto);
            precio.push(result.rows[index].precio_ben);
        }
        const litros = []
        for (let index = 0; index < count; index++) {
            litros.push(monto[index]/precio[index])
        }
        var sum = 0;
        var dinero = 0;
        for (let index = 0; index < count; index++) {
            sum = sum + litros[index];
            dinero = dinero + monto[index]
        }

        console.log(sum.toFixed(1));
        console.log(dinero);

        const result2 = await db.query(`SELECT to_char(fecha,'YYYY-MM-DD'), sum(monto/precio_ben) FROM public.ventas_ben GROUP BY fecha ORDER BY fecha;`);
        //console.log(result2);
        const options1 = { style: 'currency', currency: 'CLP' };
        const numberFormat1 = new Intl.NumberFormat('en-US', options1);
        const formatDinero = numberFormat1.format(dinero)

        const sumas_graf = []
        const fechas_graf = []
        for (let index = 0; index < result2.rowCount; index++) {
            sumas_graf.push(result2.rows[index].sum)
            fechas_graf.push(result2.rows[index].to_char)
        }

        //console.log(sumas_graf);
        //console.log(fechas_graf);

        const result3 = await db.query(`SELECT * FROM public.precio_bencinas ORDER BY fecha DESC;`);
        const precios_ben = []
        //const precios_bencinas = result3;
        precios_ben.push(result3.rows[0].bencina_93)
        precios_ben.push(result3.rows[0].bencina_95)
        precios_ben.push(result3.rows[0].bencina_97)
        precios_ben.push(result3.rows[0].kerosene)

        console.log(precios_ben);

        res.render("pages/admin.ejs", {day: day, sumLitros : sum.toFixed(1), sumDinero:formatDinero, graf_fechas: fechas_graf, graf_sumas: sumas_graf, precios: precios_ben });



    } catch (err) {
        console.error(err);
        res.status(500).send("Internal Server Error");
    }
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

app.post("/eliminar", async (req, res) => {
    const nombre_prod = req.body.nombre_prod;
    console.log(req.body);
    try {
        const query =  ` DELETE FROM public.bodega WHERE nombre_prod = '${nombre_prod}'; `
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
