const { Pool } = require("pg");

const pool = new Pool({
    user: "postgres",
    password: "PROYECTOTICS2",
    host: "db.dxigcboppwhxmcoxkzdb.supabase.co",
    port: 5432,
    database: "postgres",
});

module.exports = {
    query: (text, params) => pool.query(text, params),
};
