--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-12-13 12:01:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16420)
-- Name: bodega; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bodega (
    nombre_prod text NOT NULL,
    cantidad integer
);


ALTER TABLE public.bodega OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16436)
-- Name: lista_cod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista_cod (
    fecha date NOT NULL,
    cod text,
    turno text,
    pk bigint NOT NULL
);


ALTER TABLE public.lista_cod OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16522)
-- Name: listaCod_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."listaCod_pk_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."listaCod_pk_seq" OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 221
-- Name: listaCod_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."listaCod_pk_seq" OWNED BY public.lista_cod.pk;


--
-- TOC entry 218 (class 1259 OID 16468)
-- Name: planilla_prod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planilla_prod (
    codigo text,
    nombre_usr text,
    turno integer,
    fecha date,
    nombre_prod text,
    inicial integer,
    reposicion integer,
    cant_vend integer,
    final integer,
    precio integer,
    total integer,
    pk bigint NOT NULL
);


ALTER TABLE public.planilla_prod OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16473)
-- Name: planillaProd_primaryKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."planillaProd_primaryKey_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."planillaProd_primaryKey_seq" OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 219
-- Name: planillaProd_primaryKey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."planillaProd_primaryKey_seq" OWNED BY public.planilla_prod.pk;


--
-- TOC entry 224 (class 1259 OID 16554)
-- Name: precio_bencinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precio_bencinas (
    fecha date NOT NULL,
    bencina_93 integer,
    bencina_95 integer,
    bencina_97 integer,
    kerosene integer
);


ALTER TABLE public.precio_bencinas OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16413)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    nombre_usr text NOT NULL,
    password text,
    tipo_usr text
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16546)
-- Name: ventas_ben; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_ben (
    id bigint NOT NULL,
    nombre_usr text,
    turno integer,
    fecha date,
    monto integer,
    tipo_ben text,
    precio_ben integer,
    tipo_pago text
);


ALTER TABLE public.ventas_ben OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16545)
-- Name: ventadBen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ventadBen_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ventadBen_id_seq" OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 222
-- Name: ventadBen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ventadBen_id_seq" OWNED BY public.ventas_ben.id;


--
-- TOC entry 217 (class 1259 OID 16443)
-- Name: ventas_prod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas_prod (
    cod_planilla text,
    nombre_prod text,
    cantidad integer,
    modnto integer,
    pk bigint NOT NULL
);


ALTER TABLE public.ventas_prod OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16483)
-- Name: ventasProd_primaryKey_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ventasProd_primaryKey_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ventasProd_primaryKey_seq" OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 220
-- Name: ventasProd_primaryKey_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ventasProd_primaryKey_seq" OWNED BY public.ventas_prod.pk;


--
-- TOC entry 3200 (class 2604 OID 16523)
-- Name: lista_cod pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_cod ALTER COLUMN pk SET DEFAULT nextval('public."listaCod_pk_seq"'::regclass);


--
-- TOC entry 3202 (class 2604 OID 16474)
-- Name: planilla_prod pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planilla_prod ALTER COLUMN pk SET DEFAULT nextval('public."planillaProd_primaryKey_seq"'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16549)
-- Name: ventas_ben id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_ben ALTER COLUMN id SET DEFAULT nextval('public."ventadBen_id_seq"'::regclass);


--
-- TOC entry 3201 (class 2604 OID 16484)
-- Name: ventas_prod pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_prod ALTER COLUMN pk SET DEFAULT nextval('public."ventasProd_primaryKey_seq"'::regclass);


--
-- TOC entry 3369 (class 0 OID 16420)
-- Dependencies: 215
-- Data for Name: bodega; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bodega (nombre_prod, cantidad) FROM stdin;
Renacuajo	1
VIXONE 20/50	7
HELIX HX5 20/50 LTS	12
HX3  SAE 40 LTS	5
HELIX HX7 LT PETROLERO	6
HELIX HX5 20/50 4 LTS	8
HELIX HX7 10/40 4 LTS	8
RIMULA  15W 40 4 LTS	7
AGUA VERDE BIDON	4
ANTICONGELANTE BIDON	2
LIMPIA PARABRISAS	6
LIQUIDO DE FRENO	10
FUTUROIL BENCINERO	55
AGUA DESTILADA BIDON	9
HELIX HX7 10/40 LT	10
SILICONA	8
RIMULA 15/40 LT PRETROLERO	19
\.


--
-- TOC entry 3370 (class 0 OID 16436)
-- Dependencies: 216
-- Data for Name: lista_cod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista_cod (fecha, cod, turno, pk) FROM stdin;
1258-10-25	aaaa	1	1
2024-10-24	ddd	2\n	2
2050-02-02	gggg	3\n	3
2023-11-09	bbbb	2	4
\.


--
-- TOC entry 3372 (class 0 OID 16468)
-- Dependencies: 218
-- Data for Name: planilla_prod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planilla_prod (codigo, nombre_usr, turno, fecha, nombre_prod, inicial, reposicion, cant_vend, final, precio, total, pk) FROM stdin;
aaaa	Tapia	1	2023-11-09	ACEITE 1040 LT MOTO	1	0	0	1	16000	0	15
aaaa	Tapia	1	2023-11-09	FUTUROIL BENCINERO	3	0	0	3	2800	0	16
aaaa	Tapia	1	2023-11-09	VIXONE 20/50	5	0	0	5	4100	0	17
aaaa	Tapia	1	2023-11-09	HELIX HX5 20/50 LTS	5	0	0	5	9500	0	18
aaaa	Tapia	1	2023-11-09	HELIX HX7 10/40 LT	3	0	0	3	15000	0	19
aaaa	Tapia	1	2023-11-09	HX3  SAE 40 LTS	4	0	0	4	7000	0	20
aaaa	Tapia	1	2023-11-09	RIMULA 15/40 LT PRETROLERO	2	0	0	2	12000	0	21
aaaa	Tapia	1	2023-11-09	HELIX HX7 LT PETROLERO	3	0	0	3	17000	0	22
aaaa	Tapia	1	2023-11-09	HELIX HX5 20/50 4 LTS	3	0	0	3	29000	0	23
aaaa	Tapia	1	2023-11-09	HELIX HX7 10/40 4 LTS	3	0	0	3	38000	0	24
aaaa	Tapia	1	2023-11-09	RIMULA  15W 40 4 LTS	3	0	0	3	36000	0	25
aaaa	Tapia	1	2023-11-09	AGUA DESTILADA BIDON	3	0	0	3	1500	0	26
aaaa	Tapia	1	2023-11-09	AGUA VERDE BIDON	3	0	0	3	1500	0	27
aaaa	Tapia	1	2023-11-09	ANTICONGELANTE BIDON	3	0	0	3	2200	0	28
aaaa	Tapia	1	2023-11-09	LIMPIA PARABRISAS	3	0	0	3	1500	0	29
aaaa	Tapia	1	2023-11-09	LIQUIDO DE FRENO	2	0	0	2	3300	0	30
aaaa	Tapia	1	2023-11-09	SILICONA	5	0	0	5	5000	0	31
bbbb	Mendoza	2	2023-11-09	ACEITE 1040 LT MOTO	1	0	0	1	16000	0	49
bbbb	Mendoza	2	2023-11-09	FUTUROIL BENCINERO	3	0	2	1	2800	5600	50
bbbb	Mendoza	2	2023-11-09	VIXONE 20/50	5	0	0	5	4100	0	51
bbbb	Mendoza	2	2023-11-09	HELIX HX5 20/50 LTS	5	0	0	5	9500	0	52
bbbb	Mendoza	2	2023-11-09	HELIX HX7 10/40 LT	3	0	0	3	15000	0	53
bbbb	Mendoza	2	2023-11-09	HX3  SAE 40 LTS	4	0	0	4	7000	0	54
bbbb	Mendoza	2	2023-11-09	RIMULA 15/40 LT PRETROLERO	2	0	0	2	12000	0	55
bbbb	Mendoza	2	2023-11-09	HELIX HX7 LT PETROLERO	3	0	0	3	17000	0	56
bbbb	Mendoza	2	2023-11-09	HELIX HX5 20/50 4 LTS	3	0	0	3	29000	0	57
bbbb	Mendoza	2	2023-11-09	HELIX HX7 10/40 4 LTS	3	0	0	3	38000	0	58
bbbb	Mendoza	2	2023-11-09	RIMULA  15W 40 4 LTS	3	0	0	3	36000	0	59
bbbb	Mendoza	2	2023-11-09	AGUA DESTILADA BIDON	3	0	0	3	1500	0	60
bbbb	Mendoza	2	2023-11-09	AGUA VERDE BIDON	3	0	0	3	1500	0	61
bbbb	Mendoza	2	2023-11-09	ANTICONGELANTE BIDON	3	0	0	3	2200	0	62
bbbb	Mendoza	2	2023-11-09	LIMPIA PARABRISAS	3	0	0	3	1500	0	63
bbbb	Mendoza	2	2023-11-09	LIQUIDO DE FRENO	2	0	0	2	3300	0	64
bbbb	Mendoza	2	2023-11-09	SILICONA	5	0	0	5	5000	0	65
\.


--
-- TOC entry 3378 (class 0 OID 16554)
-- Dependencies: 224
-- Data for Name: precio_bencinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.precio_bencinas (fecha, bencina_93, bencina_95, bencina_97, kerosene) FROM stdin;
2023-11-21	1300	1350	1400	1100
2023-11-17	1000	1100	1300	900
\.


--
-- TOC entry 3368 (class 0 OID 16413)
-- Dependencies: 214
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (nombre_usr, password, tipo_usr) FROM stdin;
admin	admin	admin
Jhorman	789	bombero
Mendoza	456	bombero
Tapia	123\n	bombero
Victor	123	bombero
Orlando	123	bombero
Gerardo	123	bombero
Edward	123	bombero
Yorman	123	bombero
\.


--
-- TOC entry 3377 (class 0 OID 16546)
-- Dependencies: 223
-- Data for Name: ventas_ben; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_ben (id, nombre_usr, turno, fecha, monto, tipo_ben, precio_ben, tipo_pago) FROM stdin;
1	Victor	1	2023-11-20	15000	bencina_93	1310	debito
2	Victor	1	2023-11-20	3000	bencina_97	1400	debito
3	Victor	1	2023-11-20	1000	bencina_97	1400	debito
4	Victor	1	2023-11-20	5000	kerosene	1100	debito
5	Victor	1	2023-11-20	3000	bencina_93	1300	debito
6	Victor	1	2023-11-20	2000	bencina_97	1400	debito
7	Victor	1	2023-11-20	20000	bencina_97	1400	debito
8	Victor	1	2023-11-20	16000	kerosene	1100	debito
9	Victor	1	2023-11-20	10000	bencina_93	1300	debito
10	Victor	1	2023-11-20	10000	bencina_93	1300	debito
11	Victor	1	2023-11-20	10000	bencina_97	1400	debito
12	Victor	1	2023-11-20	1000	bencina_95	1350	debito
13	Victor	1	2023-11-20	7000	bencina_93	1300	debito
14	Victor	1	2023-11-20	6000	kerosene	1100	debito
15	Victor	1	2023-11-20	19000	bencina_93	1300	debito
16	Victor	1	2023-11-20	11000	bencina_93	1300	debito
17	Victor	1	2023-11-20	8000	bencina_93	1300	debito
18	Victor	1	2023-11-20	12000	bencina_95	1350	debito
19	Victor	1	2023-11-20	16000	bencina_95	1350	debito
20	Victor	1	2023-11-20	1000	bencina_97	1400	debito
21	Victor	1	2023-11-20	6000	bencina_97	1400	debito
22	Victor	1	2023-11-20	12000	kerosene	1100	debito
23	Victor	1	2023-11-20	10000	bencina_95	1350	debito
24	Victor	1	2023-11-20	10000	bencina_97	1400	debito
25	Victor	1	2023-11-20	13000	bencina_93	1300	debito
26	Victor	1	2023-11-20	3000	bencina_95	1350	debito
27	Victor	1	2023-11-20	18000	kerosene	1100	debito
28	Victor	1	2023-11-20	17000	bencina_97	1400	debito
29	Victor	1	2023-11-20	6000	bencina_97	1400	debito
30	Victor	1	2023-11-20	20000	bencina_95	1350	debito
31	Victor	1	2023-11-20	15000	bencina_97	1400	debito
32	Victor	1	2023-11-20	20000	bencina_97	1400	debito
33	Victor	1	2023-11-20	13000	bencina_97	1400	debito
34	Victor	1	2023-11-20	13000	bencina_93	1300	debito
35	Victor	1	2023-11-20	5000	bencina_97	1400	debito
36	Victor	1	2023-11-20	8000	bencina_97	1400	debito
37	Victor	1	2023-11-20	17000	bencina_93	1300	debito
38	Victor	1	2023-11-20	5000	bencina_97	1400	debito
39	Victor	1	2023-11-20	14000	bencina_95	1350	debito
40	Victor	1	2023-11-20	8000	bencina_93	1300	debito
41	Victor	1	2023-11-20	20000	kerosene	1100	debito
42	Victor	1	2023-11-20	16000	kerosene	1100	debito
43	Victor	1	2023-11-20	2000	kerosene	1100	debito
44	Victor	1	2023-11-20	9000	bencina_95	1350	debito
45	Victor	1	2023-11-20	9000	kerosene	1100	debito
46	Victor	1	2023-11-20	1000	bencina_95	1350	debito
47	Victor	1	2023-11-20	6000	kerosene	1100	debito
48	Victor	1	2023-11-20	6000	bencina_95	1350	debito
49	Victor	1	2023-11-20	10000	bencina_97	1400	debito
50	Victor	1	2023-11-20	17000	bencina_95	1350	debito
51	Victor	1	2023-11-20	12000	kerosene	1100	debito
52	Victor	1	2023-11-20	7000	bencina_93	1300	debito
53	Victor	1	2023-11-20	6000	bencina_93	1300	debito
54	Victor	1	2023-11-20	1000	bencina_95	1350	debito
55	Victor	1	2023-11-20	10000	bencina_93	1300	debito
56	Victor	1	2023-11-20	1000	bencina_93	1300	debito
57	Victor	1	2023-11-20	1000	bencina_95	1350	debito
58	Victor	1	2023-11-20	13000	bencina_97	1400	debito
59	Victor	1	2023-11-20	15000	kerosene	1100	debito
60	Victor	1	2023-11-20	17000	bencina_95	1350	debito
61	Victor	1	2023-11-20	16000	kerosene	1100	debito
62	Victor	1	2023-11-20	13000	bencina_93	1300	debito
63	Victor	1	2023-11-20	1000	bencina_93	1300	debito
64	Victor	1	2023-11-20	3000	bencina_97	1400	debito
65	Victor	1	2023-11-20	12000	bencina_93	1300	debito
66	Victor	1	2023-11-20	15000	bencina_97	1400	debito
67	Victor	1	2023-11-20	17000	bencina_97	1400	debito
68	Victor	1	2023-11-20	8000	bencina_97	1400	debito
69	Victor	1	2023-11-20	6000	bencina_95	1350	debito
70	Victor	1	2023-11-20	1000	bencina_95	1350	debito
71	Victor	1	2023-11-20	16000	bencina_95	1350	debito
72	Victor	1	2023-11-20	12000	bencina_97	1400	debito
73	Victor	1	2023-11-20	14000	kerosene	1100	debito
74	Victor	1	2023-11-20	6000	bencina_95	1350	debito
75	Victor	1	2023-11-20	20000	bencina_95	1350	debito
76	Victor	1	2023-11-20	7000	bencina_93	1300	debito
77	Victor	1	2023-11-20	10000	bencina_97	1400	debito
78	Victor	1	2023-11-20	19000	bencina_93	1300	debito
79	Victor	1	2023-11-20	14000	bencina_97	1400	debito
80	Victor	1	2023-11-20	18000	bencina_93	1300	debito
81	Victor	1	2023-11-20	3000	bencina_97	1400	debito
82	Victor	1	2023-11-20	12000	bencina_97	1400	debito
83	Victor	1	2023-11-20	13000	bencina_97	1400	debito
84	Victor	1	2023-11-20	13000	bencina_93	1300	debito
85	Victor	1	2023-11-20	19000	bencina_93	1300	debito
86	Victor	1	2023-11-20	17000	kerosene	1100	debito
87	Victor	1	2023-11-20	19000	bencina_97	1400	debito
88	Victor	1	2023-11-20	15000	bencina_95	1350	debito
89	Victor	1	2023-11-20	6000	bencina_95	1350	debito
90	Victor	1	2023-11-20	11000	kerosene	1100	debito
91	Victor	1	2023-11-20	15000	bencina_95	1350	debito
92	Victor	1	2023-11-20	19000	bencina_93	1300	debito
93	Victor	1	2023-11-20	7000	kerosene	1100	debito
94	Victor	1	2023-11-20	20000	bencina_95	1350	debito
95	Victor	1	2023-11-20	10000	bencina_95	1350	debito
96	Victor	1	2023-11-20	10000	bencina_93	1300	debito
97	Victor	1	2023-11-20	12000	kerosene	1100	debito
98	Victor	1	2023-11-20	6000	kerosene	1100	debito
99	Victor	1	2023-11-20	19000	kerosene	1100	debito
100	Victor	1	2023-11-20	6000	kerosene	1100	debito
101	Victor	1	2023-11-20	17000	bencina_95	1350	debito
102	Orlando	2	2023-11-20	13000	bencina_95	1350	debito
103	Orlando	2	2023-11-20	20000	kerosene	1100	debito
104	Orlando	2	2023-11-20	11000	kerosene	1100	debito
105	Orlando	2	2023-11-20	7000	bencina_97	1400	debito
106	Orlando	2	2023-11-20	5000	bencina_97	1400	debito
107	Orlando	2	2023-11-20	19000	kerosene	1100	debito
108	Orlando	2	2023-11-20	15000	kerosene	1100	debito
109	Orlando	2	2023-11-20	15000	bencina_93	1300	debito
110	Orlando	2	2023-11-20	14000	bencina_93	1300	debito
111	Orlando	2	2023-11-20	6000	kerosene	1100	debito
112	Orlando	2	2023-11-20	13000	bencina_93	1300	debito
113	Orlando	2	2023-11-20	10000	kerosene	1100	debito
114	Orlando	2	2023-11-20	12000	bencina_97	1400	debito
115	Orlando	2	2023-11-20	8000	bencina_95	1350	debito
116	Orlando	2	2023-11-20	7000	bencina_93	1300	debito
117	Orlando	2	2023-11-20	7000	bencina_93	1300	debito
118	Orlando	2	2023-11-20	8000	bencina_95	1350	debito
119	Orlando	2	2023-11-20	9000	bencina_95	1350	debito
120	Orlando	2	2023-11-20	11000	bencina_97	1400	debito
121	Orlando	2	2023-11-20	18000	bencina_97	1400	debito
122	Orlando	2	2023-11-20	7000	bencina_93	1300	debito
123	Orlando	2	2023-11-20	7000	bencina_95	1350	debito
124	Orlando	2	2023-11-20	16000	kerosene	1100	debito
125	Orlando	2	2023-11-20	14000	bencina_95	1350	debito
126	Orlando	2	2023-11-20	13000	kerosene	1100	debito
127	Orlando	2	2023-11-20	14000	bencina_93	1300	debito
128	Orlando	2	2023-11-20	2000	bencina_93	1300	debito
129	Orlando	2	2023-11-20	6000	kerosene	1100	debito
130	Orlando	2	2023-11-20	14000	bencina_95	1350	debito
131	Orlando	2	2023-11-20	19000	bencina_97	1400	debito
132	Orlando	2	2023-11-20	5000	bencina_95	1350	debito
133	Orlando	2	2023-11-20	8000	bencina_97	1400	debito
134	Orlando	2	2023-11-20	1000	kerosene	1100	debito
135	Orlando	2	2023-11-20	4000	kerosene	1100	debito
136	Orlando	2	2023-11-20	3000	bencina_93	1300	debito
137	Orlando	2	2023-11-20	7000	kerosene	1100	debito
138	Orlando	2	2023-11-20	17000	bencina_95	1350	debito
139	Orlando	2	2023-11-20	6000	kerosene	1100	debito
140	Orlando	2	2023-11-20	2000	bencina_93	1300	debito
141	Orlando	2	2023-11-20	4000	bencina_93	1300	debito
142	Orlando	2	2023-11-20	2000	bencina_93	1300	debito
143	Orlando	2	2023-11-20	13000	bencina_93	1300	debito
144	Orlando	2	2023-11-20	4000	bencina_93	1300	debito
145	Orlando	2	2023-11-20	13000	kerosene	1100	debito
146	Orlando	2	2023-11-20	9000	bencina_95	1350	debito
147	Orlando	2	2023-11-20	1000	kerosene	1100	debito
148	Orlando	2	2023-11-20	4000	bencina_97	1400	debito
149	Orlando	2	2023-11-20	13000	bencina_95	1350	debito
150	Orlando	2	2023-11-20	19000	bencina_95	1350	debito
151	Orlando	2	2023-11-20	9000	bencina_97	1400	debito
152	Orlando	2	2023-11-20	20000	kerosene	1100	debito
153	Orlando	2	2023-11-20	20000	bencina_93	1300	debito
154	Orlando	2	2023-11-20	2000	kerosene	1100	debito
155	Orlando	2	2023-11-20	18000	bencina_97	1400	debito
156	Orlando	2	2023-11-20	6000	bencina_97	1400	debito
157	Orlando	2	2023-11-20	10000	bencina_93	1300	debito
158	Orlando	2	2023-11-20	13000	bencina_93	1300	debito
159	Orlando	2	2023-11-20	1000	bencina_95	1350	debito
160	Orlando	2	2023-11-20	16000	bencina_97	1400	debito
161	Orlando	2	2023-11-20	15000	kerosene	1100	debito
162	Orlando	2	2023-11-20	12000	bencina_97	1400	debito
163	Orlando	2	2023-11-20	18000	bencina_93	1300	debito
164	Orlando	2	2023-11-20	9000	bencina_93	1300	debito
165	Orlando	2	2023-11-20	16000	bencina_95	1350	debito
166	Orlando	2	2023-11-20	15000	bencina_93	1300	debito
167	Orlando	2	2023-11-20	7000	bencina_95	1350	debito
168	Orlando	2	2023-11-20	11000	kerosene	1100	debito
169	Orlando	2	2023-11-20	16000	kerosene	1100	debito
170	Orlando	2	2023-11-20	20000	bencina_95	1350	debito
171	Orlando	2	2023-11-20	14000	bencina_95	1350	debito
172	Orlando	2	2023-11-20	19000	bencina_97	1400	debito
173	Orlando	2	2023-11-20	8000	bencina_93	1300	debito
174	Orlando	2	2023-11-20	11000	bencina_93	1300	debito
175	Orlando	2	2023-11-20	14000	bencina_97	1400	debito
176	Orlando	2	2023-11-20	6000	kerosene	1100	debito
177	Orlando	2	2023-11-20	4000	bencina_95	1350	debito
178	Orlando	2	2023-11-20	4000	kerosene	1100	debito
179	Orlando	2	2023-11-20	16000	kerosene	1100	debito
180	Orlando	2	2023-11-20	17000	bencina_95	1350	debito
181	Orlando	2	2023-11-20	20000	bencina_95	1350	debito
182	Orlando	2	2023-11-20	2000	bencina_95	1350	debito
183	Orlando	2	2023-11-20	6000	bencina_93	1300	debito
184	Orlando	2	2023-11-20	1000	bencina_95	1350	debito
185	Orlando	2	2023-11-20	9000	bencina_97	1400	debito
186	Orlando	2	2023-11-20	18000	kerosene	1100	debito
187	Orlando	2	2023-11-20	2000	bencina_95	1350	debito
188	Orlando	2	2023-11-20	20000	bencina_97	1400	debito
189	Orlando	2	2023-11-20	1000	kerosene	1100	debito
190	Orlando	2	2023-11-20	8000	bencina_95	1350	debito
191	Orlando	2	2023-11-20	11000	bencina_97	1400	debito
192	Orlando	2	2023-11-20	8000	kerosene	1100	debito
193	Orlando	2	2023-11-20	20000	kerosene	1100	debito
194	Orlando	2	2023-11-20	13000	bencina_95	1350	debito
195	Orlando	2	2023-11-20	8000	bencina_97	1400	debito
196	Orlando	2	2023-11-20	2000	bencina_95	1350	debito
197	Orlando	2	2023-11-20	13000	bencina_95	1350	debito
198	Orlando	2	2023-11-20	11000	bencina_97	1400	debito
199	Orlando	2	2023-11-20	11000	kerosene	1100	debito
200	Orlando	2	2023-11-20	11000	kerosene	1100	debito
201	Orlando	2	2023-11-20	3000	bencina_97	1400	debito
202	Mendoza	3	2023-11-20	13000	kerosene	1100	debito
203	Mendoza	3	2023-11-20	10000	bencina_95	1350	debito
204	Mendoza	3	2023-11-20	2000	bencina_95	1350	debito
205	Mendoza	3	2023-11-20	7000	bencina_93	1300	debito
206	Mendoza	3	2023-11-20	10000	bencina_93	1300	debito
207	Mendoza	3	2023-11-20	15000	bencina_95	1350	debito
208	Mendoza	3	2023-11-20	15000	bencina_93	1300	debito
209	Mendoza	3	2023-11-20	11000	kerosene	1100	debito
210	Mendoza	3	2023-11-20	20000	bencina_97	1400	debito
211	Mendoza	3	2023-11-20	1000	bencina_95	1350	debito
212	Mendoza	3	2023-11-20	12000	bencina_95	1350	debito
213	Mendoza	3	2023-11-20	16000	bencina_95	1350	debito
214	Mendoza	3	2023-11-20	15000	bencina_95	1350	debito
215	Mendoza	3	2023-11-20	17000	kerosene	1100	debito
216	Mendoza	3	2023-11-20	8000	bencina_95	1350	debito
217	Mendoza	3	2023-11-20	12000	kerosene	1100	debito
218	Mendoza	3	2023-11-20	5000	kerosene	1100	debito
219	Mendoza	3	2023-11-20	18000	bencina_93	1300	debito
220	Mendoza	3	2023-11-20	2000	bencina_97	1400	debito
221	Mendoza	3	2023-11-20	6000	bencina_95	1350	debito
222	Mendoza	3	2023-11-20	6000	bencina_93	1300	debito
223	Mendoza	3	2023-11-20	9000	bencina_97	1400	debito
224	Mendoza	3	2023-11-20	16000	bencina_97	1400	debito
225	Mendoza	3	2023-11-20	8000	bencina_93	1300	debito
226	Mendoza	3	2023-11-20	17000	bencina_95	1350	debito
227	Mendoza	3	2023-11-20	20000	kerosene	1100	debito
228	Mendoza	3	2023-11-20	10000	bencina_95	1350	debito
229	Mendoza	3	2023-11-20	19000	bencina_95	1350	debito
230	Mendoza	3	2023-11-20	17000	bencina_93	1300	debito
231	Mendoza	3	2023-11-20	19000	kerosene	1100	debito
232	Mendoza	3	2023-11-20	4000	bencina_97	1400	debito
233	Mendoza	3	2023-11-20	18000	kerosene	1100	debito
234	Mendoza	3	2023-11-20	17000	kerosene	1100	debito
235	Mendoza	3	2023-11-20	7000	bencina_93	1300	debito
236	Mendoza	3	2023-11-20	2000	bencina_97	1400	debito
237	Mendoza	3	2023-11-20	12000	bencina_97	1400	debito
238	Mendoza	3	2023-11-20	10000	bencina_97	1400	debito
239	Mendoza	3	2023-11-20	3000	bencina_93	1300	debito
240	Mendoza	3	2023-11-20	10000	bencina_95	1350	debito
241	Mendoza	3	2023-11-20	18000	kerosene	1100	debito
242	Mendoza	3	2023-11-20	6000	kerosene	1100	debito
243	Mendoza	3	2023-11-20	10000	bencina_95	1350	debito
244	Mendoza	3	2023-11-20	20000	bencina_93	1300	debito
245	Mendoza	3	2023-11-20	10000	bencina_93	1300	debito
246	Mendoza	3	2023-11-20	7000	kerosene	1100	debito
247	Mendoza	3	2023-11-20	3000	bencina_95	1350	debito
248	Mendoza	3	2023-11-20	20000	kerosene	1100	debito
249	Mendoza	3	2023-11-20	9000	bencina_93	1300	debito
250	Mendoza	3	2023-11-20	13000	bencina_95	1350	debito
251	Mendoza	3	2023-11-20	14000	bencina_93	1300	debito
252	Mendoza	3	2023-11-20	16000	bencina_93	1300	debito
253	Mendoza	3	2023-11-20	17000	bencina_97	1400	debito
254	Mendoza	3	2023-11-20	12000	bencina_95	1350	debito
255	Mendoza	3	2023-11-20	8000	bencina_95	1350	debito
256	Mendoza	3	2023-11-20	19000	bencina_93	1300	debito
257	Mendoza	3	2023-11-20	1000	bencina_97	1400	debito
258	Mendoza	3	2023-11-20	1000	bencina_97	1400	debito
259	Mendoza	3	2023-11-20	20000	bencina_97	1400	debito
260	Mendoza	3	2023-11-20	19000	bencina_97	1400	debito
261	Mendoza	3	2023-11-20	13000	bencina_97	1400	debito
262	Mendoza	3	2023-11-20	8000	kerosene	1100	debito
263	Mendoza	3	2023-11-20	17000	kerosene	1100	debito
264	Mendoza	3	2023-11-20	9000	bencina_93	1300	debito
265	Mendoza	3	2023-11-20	17000	bencina_97	1400	debito
266	Mendoza	3	2023-11-20	19000	bencina_95	1350	debito
267	Mendoza	3	2023-11-20	12000	bencina_97	1400	debito
268	Mendoza	3	2023-11-20	19000	bencina_93	1300	debito
269	Mendoza	3	2023-11-20	20000	bencina_95	1350	debito
270	Mendoza	3	2023-11-20	3000	bencina_97	1400	debito
271	Mendoza	3	2023-11-20	18000	bencina_95	1350	debito
272	Mendoza	3	2023-11-20	18000	bencina_93	1300	debito
273	Mendoza	3	2023-11-20	3000	kerosene	1100	debito
274	Mendoza	3	2023-11-20	12000	kerosene	1100	debito
275	Mendoza	3	2023-11-20	17000	bencina_93	1300	debito
276	Mendoza	3	2023-11-20	18000	bencina_93	1300	debito
277	Mendoza	3	2023-11-20	14000	kerosene	1100	debito
278	Mendoza	3	2023-11-20	20000	bencina_95	1350	debito
279	Mendoza	3	2023-11-20	2000	bencina_95	1350	debito
280	Mendoza	3	2023-11-20	19000	bencina_93	1300	debito
281	Mendoza	3	2023-11-20	10000	bencina_95	1350	debito
282	Mendoza	3	2023-11-20	2000	kerosene	1100	debito
283	Mendoza	3	2023-11-20	7000	bencina_95	1350	debito
284	Mendoza	3	2023-11-20	13000	kerosene	1100	debito
285	Mendoza	3	2023-11-20	8000	kerosene	1100	debito
286	Mendoza	3	2023-11-20	4000	bencina_95	1350	debito
287	Mendoza	3	2023-11-20	4000	bencina_93	1300	debito
288	Mendoza	3	2023-11-20	5000	bencina_93	1300	debito
289	Mendoza	3	2023-11-20	20000	kerosene	1100	debito
290	Mendoza	3	2023-11-20	1000	bencina_93	1300	debito
291	Mendoza	3	2023-11-20	15000	bencina_95	1350	debito
292	Mendoza	3	2023-11-20	6000	kerosene	1100	debito
293	Mendoza	3	2023-11-20	3000	bencina_95	1350	debito
294	Mendoza	3	2023-11-20	8000	kerosene	1100	debito
295	Mendoza	3	2023-11-20	17000	bencina_93	1300	debito
296	Mendoza	3	2023-11-20	20000	bencina_95	1350	debito
297	Mendoza	3	2023-11-20	9000	bencina_95	1350	debito
298	Mendoza	3	2023-11-20	8000	bencina_97	1400	debito
299	Mendoza	3	2023-11-20	13000	bencina_97	1400	debito
300	Mendoza	3	2023-11-20	18000	bencina_97	1400	debito
301	Mendoza	3	2023-11-20	2000	bencina_95	1350	debito
302	Edward	1	2023-11-21	12000	kerosene	1100	debito
303	Edward	1	2023-11-21	5000	bencina_97	1400	debito
304	Edward	1	2023-11-21	16000	bencina_95	1350	debito
305	Edward	1	2023-11-21	17000	bencina_97	1400	debito
306	Edward	1	2023-11-21	11000	kerosene	1100	debito
307	Edward	1	2023-11-21	5000	bencina_97	1400	debito
308	Edward	1	2023-11-21	9000	bencina_95	1350	debito
309	Edward	1	2023-11-21	9000	bencina_93	1300	debito
310	Edward	1	2023-11-21	10000	bencina_97	1400	debito
311	Edward	1	2023-11-21	18000	kerosene	1100	debito
312	Edward	1	2023-11-21	6000	bencina_97	1400	debito
313	Edward	1	2023-11-21	7000	bencina_97	1400	debito
314	Edward	1	2023-11-21	1000	kerosene	1100	debito
315	Edward	1	2023-11-21	10000	bencina_95	1350	debito
316	Edward	1	2023-11-21	9000	kerosene	1100	debito
317	Edward	1	2023-11-21	19000	kerosene	1100	debito
318	Edward	1	2023-11-21	1000	kerosene	1100	debito
319	Edward	1	2023-11-21	9000	bencina_95	1350	debito
320	Edward	1	2023-11-21	14000	bencina_97	1400	debito
321	Edward	1	2023-11-21	6000	bencina_95	1350	debito
322	Edward	1	2023-11-21	3000	bencina_97	1400	debito
323	Edward	1	2023-11-21	7000	bencina_97	1400	debito
324	Edward	1	2023-11-21	1000	bencina_97	1400	debito
325	Edward	1	2023-11-21	16000	bencina_93	1300	debito
326	Edward	1	2023-11-21	1000	bencina_95	1350	debito
327	Edward	1	2023-11-21	10000	bencina_95	1350	debito
328	Edward	1	2023-11-21	11000	bencina_97	1400	debito
329	Edward	1	2023-11-21	2000	bencina_95	1350	debito
330	Edward	1	2023-11-21	16000	bencina_95	1350	debito
331	Edward	1	2023-11-21	1000	bencina_97	1400	debito
332	Edward	1	2023-11-21	6000	bencina_97	1400	debito
333	Edward	1	2023-11-21	15000	bencina_95	1350	debito
334	Edward	1	2023-11-21	7000	kerosene	1100	debito
335	Edward	1	2023-11-21	10000	bencina_93	1300	debito
336	Edward	1	2023-11-21	18000	bencina_93	1300	debito
337	Edward	1	2023-11-21	18000	bencina_93	1300	debito
338	Edward	1	2023-11-21	15000	bencina_93	1300	debito
339	Edward	1	2023-11-21	2000	kerosene	1100	debito
340	Edward	1	2023-11-21	17000	bencina_93	1300	debito
341	Edward	1	2023-11-21	8000	bencina_93	1300	debito
342	Edward	1	2023-11-21	8000	bencina_95	1350	debito
343	Edward	1	2023-11-21	7000	bencina_97	1400	debito
344	Edward	1	2023-11-21	12000	bencina_93	1300	debito
345	Edward	1	2023-11-21	6000	bencina_93	1300	debito
346	Edward	1	2023-11-21	20000	bencina_95	1350	debito
347	Edward	1	2023-11-21	17000	bencina_93	1300	debito
348	Edward	1	2023-11-21	2000	bencina_93	1300	debito
349	Edward	1	2023-11-21	7000	bencina_97	1400	debito
350	Edward	1	2023-11-21	3000	bencina_95	1350	debito
351	Edward	1	2023-11-21	19000	kerosene	1100	debito
352	Edward	1	2023-11-21	15000	bencina_97	1400	debito
353	Edward	1	2023-11-21	4000	bencina_93	1300	debito
354	Edward	1	2023-11-21	3000	kerosene	1100	debito
355	Edward	1	2023-11-21	14000	bencina_95	1350	debito
356	Edward	1	2023-11-21	2000	bencina_95	1350	debito
357	Edward	1	2023-11-21	7000	kerosene	1100	debito
358	Edward	1	2023-11-21	7000	kerosene	1100	debito
359	Edward	1	2023-11-21	2000	bencina_95	1350	debito
360	Edward	1	2023-11-21	3000	bencina_93	1300	debito
361	Edward	1	2023-11-21	14000	bencina_93	1300	debito
362	Edward	1	2023-11-21	2000	kerosene	1100	debito
363	Edward	1	2023-11-21	6000	bencina_97	1400	debito
364	Edward	1	2023-11-21	10000	bencina_97	1400	debito
365	Edward	1	2023-11-21	15000	bencina_95	1350	debito
366	Edward	1	2023-11-21	5000	bencina_93	1300	debito
367	Edward	1	2023-11-21	3000	kerosene	1100	debito
368	Edward	1	2023-11-21	3000	bencina_95	1350	debito
369	Edward	1	2023-11-21	2000	bencina_93	1300	debito
370	Edward	1	2023-11-21	10000	kerosene	1100	debito
371	Edward	1	2023-11-21	12000	bencina_97	1400	debito
372	Edward	1	2023-11-21	2000	bencina_93	1300	debito
373	Edward	1	2023-11-21	10000	bencina_97	1400	debito
374	Edward	1	2023-11-21	4000	bencina_97	1400	debito
375	Edward	1	2023-11-21	8000	bencina_95	1350	debito
376	Edward	1	2023-11-21	2000	kerosene	1100	debito
377	Edward	1	2023-11-21	12000	bencina_93	1300	debito
378	Edward	1	2023-11-21	8000	bencina_97	1400	debito
379	Edward	1	2023-11-21	19000	bencina_97	1400	debito
380	Edward	1	2023-11-21	7000	kerosene	1100	debito
381	Edward	1	2023-11-21	15000	kerosene	1100	debito
382	Edward	1	2023-11-21	19000	kerosene	1100	debito
383	Edward	1	2023-11-21	7000	bencina_93	1300	debito
384	Edward	1	2023-11-21	4000	bencina_93	1300	debito
385	Edward	1	2023-11-21	5000	bencina_95	1350	debito
386	Edward	1	2023-11-21	4000	kerosene	1100	debito
387	Edward	1	2023-11-21	9000	kerosene	1100	debito
388	Edward	1	2023-11-21	14000	bencina_97	1400	debito
389	Edward	1	2023-11-21	10000	bencina_95	1350	debito
390	Edward	1	2023-11-21	17000	bencina_97	1400	debito
391	Edward	1	2023-11-21	5000	bencina_93	1300	debito
392	Edward	1	2023-11-21	12000	bencina_93	1300	debito
393	Edward	1	2023-11-21	7000	kerosene	1100	debito
394	Edward	1	2023-11-21	14000	bencina_97	1400	debito
395	Edward	1	2023-11-21	16000	bencina_95	1350	debito
396	Edward	1	2023-11-21	10000	bencina_95	1350	debito
397	Edward	1	2023-11-21	12000	bencina_97	1400	debito
398	Edward	1	2023-11-21	12000	bencina_95	1350	debito
399	Edward	1	2023-11-21	9000	bencina_97	1400	debito
400	Edward	1	2023-11-21	16000	kerosene	1100	debito
401	Edward	1	2023-11-21	11000	bencina_93	1300	debito
1402	Orlando	1	2023-11-16	6000	bencina_95	1350	debito
1403	Orlando	1	2023-11-16	12000	bencina_97	1400	debito
1404	Orlando	1	2023-11-16	19000	kerosene	1100	debito
1405	Orlando	1	2023-11-16	11000	bencina_93	1300	debito
1406	Orlando	1	2023-11-16	17000	bencina_93	1300	debito
1407	Orlando	1	2023-11-16	15000	bencina_97	1400	debito
1408	Orlando	1	2023-11-16	12000	bencina_93	1300	debito
1409	Orlando	1	2023-11-16	11000	bencina_95	1350	debito
1410	Orlando	1	2023-11-16	17000	bencina_95	1350	debito
1411	Orlando	1	2023-11-16	2000	kerosene	1100	debito
1412	Orlando	1	2023-11-16	10000	bencina_97	1400	debito
1413	Orlando	1	2023-11-16	15000	bencina_95	1350	debito
1414	Orlando	1	2023-11-16	9000	kerosene	1100	debito
1415	Orlando	1	2023-11-16	2000	bencina_93	1300	debito
1416	Orlando	1	2023-11-16	1000	bencina_93	1300	debito
1417	Orlando	1	2023-11-16	18000	bencina_97	1400	debito
1418	Orlando	1	2023-11-16	15000	bencina_93	1300	debito
1419	Orlando	1	2023-11-16	9000	kerosene	1100	debito
1420	Orlando	1	2023-11-16	1000	kerosene	1100	debito
1421	Orlando	1	2023-11-16	19000	kerosene	1100	debito
1422	Orlando	1	2023-11-16	18000	kerosene	1100	debito
1423	Orlando	1	2023-11-16	8000	bencina_97	1400	debito
1424	Orlando	1	2023-11-16	9000	kerosene	1100	debito
1425	Orlando	1	2023-11-16	6000	bencina_95	1350	debito
1426	Orlando	1	2023-11-16	8000	bencina_97	1400	debito
1427	Orlando	1	2023-11-16	12000	kerosene	1100	debito
1428	Orlando	1	2023-11-16	1000	kerosene	1100	debito
1429	Orlando	1	2023-11-16	2000	bencina_93	1300	debito
1430	Orlando	1	2023-11-16	11000	bencina_93	1300	debito
1431	Orlando	1	2023-11-16	4000	kerosene	1100	debito
1432	Orlando	1	2023-11-16	14000	bencina_95	1350	debito
1433	Orlando	1	2023-11-16	9000	bencina_97	1400	debito
1434	Orlando	1	2023-11-16	1000	bencina_97	1400	debito
1435	Orlando	1	2023-11-16	3000	bencina_93	1300	debito
1436	Orlando	1	2023-11-16	14000	kerosene	1100	debito
1437	Orlando	1	2023-11-16	6000	bencina_97	1400	debito
1438	Orlando	1	2023-11-16	12000	kerosene	1100	debito
1439	Orlando	1	2023-11-16	16000	bencina_97	1400	debito
1440	Orlando	1	2023-11-16	8000	bencina_97	1400	debito
1441	Orlando	1	2023-11-16	4000	bencina_95	1350	debito
1442	Orlando	1	2023-11-16	6000	bencina_93	1300	debito
1443	Orlando	1	2023-11-16	5000	bencina_95	1350	debito
1444	Orlando	1	2023-11-16	17000	bencina_95	1350	debito
1445	Orlando	1	2023-11-16	8000	bencina_93	1300	debito
1446	Orlando	1	2023-11-16	9000	bencina_95	1350	debito
1447	Orlando	1	2023-11-16	15000	bencina_93	1300	debito
1448	Orlando	1	2023-11-16	8000	bencina_95	1350	debito
1449	Orlando	1	2023-11-16	4000	bencina_93	1300	debito
1450	Orlando	1	2023-11-16	18000	bencina_93	1300	debito
1451	Orlando	1	2023-11-16	2000	bencina_93	1300	debito
452	Jhorman	2	2023-11-21	2000	bencina_93	1300	debito
453	Jhorman	2	2023-11-21	8000	bencina_97	1400	debito
454	Jhorman	2	2023-11-21	17000	bencina_93	1300	debito
455	Jhorman	2	2023-11-21	9000	kerosene	1100	debito
456	Jhorman	2	2023-11-21	10000	bencina_93	1300	debito
457	Jhorman	2	2023-11-21	15000	bencina_93	1300	debito
458	Jhorman	2	2023-11-21	1000	kerosene	1100	debito
459	Jhorman	2	2023-11-21	2000	kerosene	1100	debito
460	Jhorman	2	2023-11-21	11000	bencina_95	1350	debito
461	Jhorman	2	2023-11-21	8000	bencina_93	1300	debito
462	Jhorman	2	2023-11-21	13000	bencina_95	1350	debito
463	Jhorman	2	2023-11-21	9000	bencina_93	1300	debito
464	Jhorman	2	2023-11-21	9000	bencina_95	1350	debito
465	Jhorman	2	2023-11-21	3000	bencina_97	1400	debito
466	Jhorman	2	2023-11-21	19000	bencina_97	1400	debito
467	Jhorman	2	2023-11-21	9000	bencina_95	1350	debito
468	Jhorman	2	2023-11-21	2000	bencina_95	1350	debito
469	Jhorman	2	2023-11-21	20000	bencina_93	1300	debito
470	Jhorman	2	2023-11-21	13000	kerosene	1100	debito
471	Jhorman	2	2023-11-21	2000	bencina_95	1350	debito
472	Jhorman	2	2023-11-21	9000	kerosene	1100	debito
473	Jhorman	2	2023-11-21	6000	bencina_93	1300	debito
474	Jhorman	2	2023-11-21	3000	kerosene	1100	debito
475	Jhorman	2	2023-11-21	13000	bencina_93	1300	debito
476	Jhorman	2	2023-11-21	15000	bencina_95	1350	debito
477	Jhorman	2	2023-11-21	16000	kerosene	1100	debito
478	Jhorman	2	2023-11-21	20000	bencina_97	1400	debito
479	Jhorman	2	2023-11-21	17000	bencina_93	1300	debito
480	Jhorman	2	2023-11-21	19000	bencina_93	1300	debito
481	Jhorman	2	2023-11-21	5000	bencina_95	1350	debito
482	Jhorman	2	2023-11-21	19000	bencina_93	1300	debito
483	Jhorman	2	2023-11-21	18000	kerosene	1100	debito
484	Jhorman	2	2023-11-21	20000	kerosene	1100	debito
485	Jhorman	2	2023-11-21	2000	kerosene	1100	debito
486	Jhorman	2	2023-11-21	3000	bencina_97	1400	debito
487	Jhorman	2	2023-11-21	8000	bencina_95	1350	debito
488	Jhorman	2	2023-11-21	5000	bencina_95	1350	debito
489	Jhorman	2	2023-11-21	12000	kerosene	1100	debito
490	Jhorman	2	2023-11-21	10000	bencina_95	1350	debito
491	Jhorman	2	2023-11-21	3000	bencina_97	1400	debito
492	Jhorman	2	2023-11-21	2000	bencina_93	1300	debito
493	Jhorman	2	2023-11-21	11000	bencina_95	1350	debito
494	Jhorman	2	2023-11-21	13000	kerosene	1100	debito
495	Jhorman	2	2023-11-21	9000	bencina_93	1300	debito
496	Jhorman	2	2023-11-21	2000	bencina_95	1350	debito
497	Jhorman	2	2023-11-21	2000	bencina_93	1300	debito
498	Jhorman	2	2023-11-21	15000	kerosene	1100	debito
499	Jhorman	2	2023-11-21	5000	kerosene	1100	debito
500	Jhorman	2	2023-11-21	16000	bencina_97	1400	debito
501	Jhorman	2	2023-11-21	7000	bencina_97	1400	debito
502	Gerardo	1	2023-11-19	14000	bencina_97	1400	debito
503	Gerardo	1	2023-11-19	13000	bencina_97	1400	debito
504	Gerardo	1	2023-11-19	9000	kerosene	1100	debito
505	Gerardo	1	2023-11-19	9000	bencina_95	1350	debito
506	Gerardo	1	2023-11-19	7000	bencina_93	1300	debito
507	Gerardo	1	2023-11-19	16000	bencina_95	1350	debito
508	Gerardo	1	2023-11-19	1000	bencina_97	1400	debito
509	Gerardo	1	2023-11-19	4000	bencina_93	1300	debito
510	Gerardo	1	2023-11-19	6000	bencina_95	1350	debito
511	Gerardo	1	2023-11-19	6000	bencina_97	1400	debito
512	Gerardo	1	2023-11-19	4000	kerosene	1100	debito
513	Gerardo	1	2023-11-19	3000	bencina_95	1350	debito
514	Gerardo	1	2023-11-19	17000	kerosene	1100	debito
515	Gerardo	1	2023-11-19	15000	bencina_93	1300	debito
516	Gerardo	1	2023-11-19	17000	bencina_95	1350	debito
517	Gerardo	1	2023-11-19	7000	kerosene	1100	debito
518	Gerardo	1	2023-11-19	13000	bencina_95	1350	debito
519	Gerardo	1	2023-11-19	14000	bencina_95	1350	debito
520	Gerardo	1	2023-11-19	5000	kerosene	1100	debito
521	Gerardo	1	2023-11-19	13000	bencina_93	1300	debito
522	Gerardo	1	2023-11-19	7000	bencina_93	1300	debito
523	Gerardo	1	2023-11-19	9000	kerosene	1100	debito
524	Gerardo	1	2023-11-19	7000	bencina_95	1350	debito
525	Gerardo	1	2023-11-19	19000	bencina_97	1400	debito
526	Gerardo	1	2023-11-19	4000	bencina_93	1300	debito
527	Gerardo	1	2023-11-19	9000	kerosene	1100	debito
528	Gerardo	1	2023-11-19	13000	bencina_95	1350	debito
529	Gerardo	1	2023-11-19	12000	bencina_95	1350	debito
530	Gerardo	1	2023-11-19	16000	bencina_97	1400	debito
531	Gerardo	1	2023-11-19	14000	kerosene	1100	debito
532	Gerardo	1	2023-11-19	3000	bencina_97	1400	debito
533	Gerardo	1	2023-11-19	4000	bencina_97	1400	debito
534	Gerardo	1	2023-11-19	5000	kerosene	1100	debito
535	Gerardo	1	2023-11-19	4000	bencina_93	1300	debito
536	Gerardo	1	2023-11-19	13000	bencina_93	1300	debito
537	Gerardo	1	2023-11-19	2000	kerosene	1100	debito
538	Gerardo	1	2023-11-19	10000	bencina_93	1300	debito
539	Gerardo	1	2023-11-19	7000	bencina_93	1300	debito
540	Gerardo	1	2023-11-19	19000	bencina_95	1350	debito
541	Gerardo	1	2023-11-19	2000	kerosene	1100	debito
542	Gerardo	1	2023-11-19	2000	kerosene	1100	debito
543	Gerardo	1	2023-11-19	5000	bencina_95	1350	debito
544	Gerardo	1	2023-11-19	7000	bencina_93	1300	debito
545	Gerardo	1	2023-11-19	7000	bencina_93	1300	debito
546	Gerardo	1	2023-11-19	19000	kerosene	1100	debito
547	Gerardo	1	2023-11-19	9000	kerosene	1100	debito
548	Gerardo	1	2023-11-19	11000	kerosene	1100	debito
549	Gerardo	1	2023-11-19	6000	bencina_97	1400	debito
550	Gerardo	1	2023-11-19	1000	bencina_97	1400	debito
551	Gerardo	1	2023-11-19	2000	bencina_97	1400	debito
552	Gerardo	1	2023-11-19	14000	bencina_93	1300	debito
553	Gerardo	1	2023-11-19	5000	bencina_93	1300	debito
554	Gerardo	1	2023-11-19	6000	bencina_93	1300	debito
555	Gerardo	1	2023-11-19	12000	bencina_97	1400	debito
556	Gerardo	1	2023-11-19	14000	kerosene	1100	debito
557	Gerardo	1	2023-11-19	12000	bencina_97	1400	debito
558	Gerardo	1	2023-11-19	9000	bencina_97	1400	debito
559	Gerardo	1	2023-11-19	11000	bencina_97	1400	debito
560	Gerardo	1	2023-11-19	16000	kerosene	1100	debito
561	Gerardo	1	2023-11-19	6000	kerosene	1100	debito
562	Gerardo	1	2023-11-19	14000	bencina_97	1400	debito
563	Gerardo	1	2023-11-19	18000	kerosene	1100	debito
564	Gerardo	1	2023-11-19	15000	bencina_97	1400	debito
565	Gerardo	1	2023-11-19	18000	kerosene	1100	debito
566	Gerardo	1	2023-11-19	17000	kerosene	1100	debito
567	Gerardo	1	2023-11-19	18000	kerosene	1100	debito
568	Gerardo	1	2023-11-19	2000	bencina_93	1300	debito
569	Gerardo	1	2023-11-19	8000	bencina_93	1300	debito
570	Gerardo	1	2023-11-19	4000	bencina_95	1350	debito
571	Gerardo	1	2023-11-19	17000	bencina_97	1400	debito
572	Gerardo	1	2023-11-19	19000	bencina_97	1400	debito
573	Gerardo	1	2023-11-19	8000	bencina_97	1400	debito
574	Gerardo	1	2023-11-19	15000	bencina_97	1400	debito
575	Gerardo	1	2023-11-19	13000	bencina_95	1350	debito
576	Gerardo	1	2023-11-19	8000	bencina_95	1350	debito
577	Gerardo	1	2023-11-19	12000	bencina_93	1300	debito
578	Gerardo	1	2023-11-19	17000	bencina_95	1350	debito
579	Gerardo	1	2023-11-19	10000	bencina_97	1400	debito
580	Gerardo	1	2023-11-19	19000	kerosene	1100	debito
581	Gerardo	1	2023-11-19	16000	bencina_95	1350	debito
582	Gerardo	1	2023-11-19	17000	bencina_95	1350	debito
583	Gerardo	1	2023-11-19	12000	kerosene	1100	debito
584	Gerardo	1	2023-11-19	9000	bencina_95	1350	debito
585	Gerardo	1	2023-11-19	8000	bencina_93	1300	debito
586	Gerardo	1	2023-11-19	4000	bencina_93	1300	debito
587	Gerardo	1	2023-11-19	19000	bencina_93	1300	debito
588	Gerardo	1	2023-11-19	3000	kerosene	1100	debito
589	Gerardo	1	2023-11-19	17000	bencina_97	1400	debito
590	Gerardo	1	2023-11-19	5000	bencina_93	1300	debito
591	Gerardo	1	2023-11-19	18000	bencina_95	1350	debito
592	Gerardo	1	2023-11-19	14000	bencina_97	1400	debito
593	Gerardo	1	2023-11-19	19000	kerosene	1100	debito
594	Gerardo	1	2023-11-19	14000	kerosene	1100	debito
595	Gerardo	1	2023-11-19	18000	kerosene	1100	debito
596	Gerardo	1	2023-11-19	7000	kerosene	1100	debito
597	Gerardo	1	2023-11-19	3000	bencina_97	1400	debito
598	Gerardo	1	2023-11-19	18000	bencina_93	1300	debito
599	Gerardo	1	2023-11-19	15000	bencina_93	1300	debito
600	Gerardo	1	2023-11-19	12000	kerosene	1100	debito
601	Gerardo	1	2023-11-19	1000	bencina_97	1400	debito
602	Orlando	2	2023-11-19	9000	bencina_95	1350	debito
603	Orlando	2	2023-11-19	16000	bencina_95	1350	debito
604	Orlando	2	2023-11-19	3000	bencina_95	1350	debito
605	Orlando	2	2023-11-19	7000	bencina_97	1400	debito
606	Orlando	2	2023-11-19	7000	bencina_93	1300	debito
607	Orlando	2	2023-11-19	12000	bencina_97	1400	debito
608	Orlando	2	2023-11-19	17000	bencina_97	1400	debito
609	Orlando	2	2023-11-19	17000	bencina_95	1350	debito
610	Orlando	2	2023-11-19	2000	bencina_93	1300	debito
611	Orlando	2	2023-11-19	16000	bencina_93	1300	debito
612	Orlando	2	2023-11-19	10000	bencina_97	1400	debito
613	Orlando	2	2023-11-19	9000	bencina_97	1400	debito
614	Orlando	2	2023-11-19	12000	kerosene	1100	debito
615	Orlando	2	2023-11-19	18000	bencina_95	1350	debito
616	Orlando	2	2023-11-19	9000	kerosene	1100	debito
617	Orlando	2	2023-11-19	20000	bencina_97	1400	debito
618	Orlando	2	2023-11-19	10000	bencina_95	1350	debito
619	Orlando	2	2023-11-19	18000	bencina_95	1350	debito
620	Orlando	2	2023-11-19	16000	bencina_95	1350	debito
621	Orlando	2	2023-11-19	17000	bencina_95	1350	debito
622	Orlando	2	2023-11-19	7000	bencina_97	1400	debito
623	Orlando	2	2023-11-19	5000	bencina_93	1300	debito
624	Orlando	2	2023-11-19	18000	kerosene	1100	debito
625	Orlando	2	2023-11-19	5000	bencina_97	1400	debito
626	Orlando	2	2023-11-19	20000	bencina_97	1400	debito
627	Orlando	2	2023-11-19	10000	bencina_93	1300	debito
628	Orlando	2	2023-11-19	14000	kerosene	1100	debito
629	Orlando	2	2023-11-19	14000	bencina_95	1350	debito
630	Orlando	2	2023-11-19	11000	bencina_97	1400	debito
631	Orlando	2	2023-11-19	4000	bencina_97	1400	debito
632	Orlando	2	2023-11-19	7000	bencina_93	1300	debito
633	Orlando	2	2023-11-19	3000	bencina_97	1400	debito
634	Orlando	2	2023-11-19	18000	bencina_95	1350	debito
635	Orlando	2	2023-11-19	1000	kerosene	1100	debito
636	Orlando	2	2023-11-19	2000	kerosene	1100	debito
637	Orlando	2	2023-11-19	12000	bencina_97	1400	debito
638	Orlando	2	2023-11-19	20000	kerosene	1100	debito
639	Orlando	2	2023-11-19	6000	bencina_95	1350	debito
640	Orlando	2	2023-11-19	8000	bencina_97	1400	debito
641	Orlando	2	2023-11-19	20000	bencina_95	1350	debito
642	Orlando	2	2023-11-19	13000	bencina_93	1300	debito
643	Orlando	2	2023-11-19	18000	bencina_97	1400	debito
644	Orlando	2	2023-11-19	9000	kerosene	1100	debito
645	Orlando	2	2023-11-19	6000	kerosene	1100	debito
646	Orlando	2	2023-11-19	10000	bencina_97	1400	debito
647	Orlando	2	2023-11-19	15000	bencina_93	1300	debito
648	Orlando	2	2023-11-19	4000	bencina_93	1300	debito
649	Orlando	2	2023-11-19	9000	bencina_93	1300	debito
650	Orlando	2	2023-11-19	3000	kerosene	1100	debito
651	Orlando	2	2023-11-19	12000	bencina_97	1400	debito
652	Orlando	2	2023-11-19	2000	bencina_97	1400	debito
653	Orlando	2	2023-11-19	12000	bencina_93	1300	debito
654	Orlando	2	2023-11-19	3000	kerosene	1100	debito
655	Orlando	2	2023-11-19	3000	bencina_93	1300	debito
656	Orlando	2	2023-11-19	8000	bencina_93	1300	debito
657	Orlando	2	2023-11-19	13000	kerosene	1100	debito
658	Orlando	2	2023-11-19	2000	bencina_97	1400	debito
659	Orlando	2	2023-11-19	1000	bencina_95	1350	debito
660	Orlando	2	2023-11-19	8000	bencina_95	1350	debito
661	Orlando	2	2023-11-19	9000	bencina_97	1400	debito
662	Orlando	2	2023-11-19	13000	bencina_93	1300	debito
663	Orlando	2	2023-11-19	9000	kerosene	1100	debito
664	Orlando	2	2023-11-19	10000	bencina_95	1350	debito
665	Orlando	2	2023-11-19	17000	bencina_95	1350	debito
666	Orlando	2	2023-11-19	4000	bencina_93	1300	debito
667	Orlando	2	2023-11-19	1000	kerosene	1100	debito
668	Orlando	2	2023-11-19	16000	bencina_95	1350	debito
669	Orlando	2	2023-11-19	19000	bencina_93	1300	debito
670	Orlando	2	2023-11-19	17000	bencina_97	1400	debito
671	Orlando	2	2023-11-19	19000	kerosene	1100	debito
672	Orlando	2	2023-11-19	1000	bencina_97	1400	debito
673	Orlando	2	2023-11-19	1000	bencina_95	1350	debito
674	Orlando	2	2023-11-19	5000	bencina_95	1350	debito
675	Orlando	2	2023-11-19	11000	bencina_95	1350	debito
676	Orlando	2	2023-11-19	1000	bencina_93	1300	debito
677	Orlando	2	2023-11-19	15000	kerosene	1100	debito
678	Orlando	2	2023-11-19	1000	bencina_95	1350	debito
679	Orlando	2	2023-11-19	16000	bencina_95	1350	debito
680	Orlando	2	2023-11-19	2000	bencina_95	1350	debito
681	Orlando	2	2023-11-19	6000	kerosene	1100	debito
682	Orlando	2	2023-11-19	15000	bencina_97	1400	debito
683	Orlando	2	2023-11-19	18000	bencina_95	1350	debito
684	Orlando	2	2023-11-19	4000	bencina_97	1400	debito
685	Orlando	2	2023-11-19	5000	bencina_93	1300	debito
686	Orlando	2	2023-11-19	11000	kerosene	1100	debito
687	Orlando	2	2023-11-19	15000	kerosene	1100	debito
688	Orlando	2	2023-11-19	18000	bencina_95	1350	debito
689	Orlando	2	2023-11-19	18000	kerosene	1100	debito
690	Orlando	2	2023-11-19	8000	bencina_95	1350	debito
691	Orlando	2	2023-11-19	19000	bencina_95	1350	debito
692	Orlando	2	2023-11-19	5000	bencina_95	1350	debito
693	Orlando	2	2023-11-19	13000	bencina_97	1400	debito
694	Orlando	2	2023-11-19	6000	bencina_95	1350	debito
695	Orlando	2	2023-11-19	3000	bencina_93	1300	debito
696	Orlando	2	2023-11-19	9000	bencina_93	1300	debito
697	Orlando	2	2023-11-19	11000	bencina_97	1400	debito
698	Orlando	2	2023-11-19	18000	bencina_93	1300	debito
699	Orlando	2	2023-11-19	7000	bencina_97	1400	debito
700	Orlando	2	2023-11-19	18000	kerosene	1100	debito
701	Orlando	2	2023-11-19	1000	kerosene	1100	debito
702	Tapia	3	2023-11-19	19000	bencina_97	1400	debito
703	Tapia	3	2023-11-19	2000	bencina_93	1300	debito
704	Tapia	3	2023-11-19	17000	kerosene	1100	debito
705	Tapia	3	2023-11-19	6000	kerosene	1100	debito
706	Tapia	3	2023-11-19	18000	bencina_97	1400	debito
707	Tapia	3	2023-11-19	4000	bencina_93	1300	debito
708	Tapia	3	2023-11-19	14000	kerosene	1100	debito
709	Tapia	3	2023-11-19	15000	bencina_95	1350	debito
710	Tapia	3	2023-11-19	12000	bencina_93	1300	debito
711	Tapia	3	2023-11-19	5000	kerosene	1100	debito
712	Tapia	3	2023-11-19	1000	bencina_93	1300	debito
713	Tapia	3	2023-11-19	9000	bencina_95	1350	debito
714	Tapia	3	2023-11-19	1000	bencina_97	1400	debito
715	Tapia	3	2023-11-19	13000	bencina_93	1300	debito
716	Tapia	3	2023-11-19	19000	bencina_95	1350	debito
717	Tapia	3	2023-11-19	19000	bencina_95	1350	debito
718	Tapia	3	2023-11-19	7000	bencina_97	1400	debito
719	Tapia	3	2023-11-19	1000	bencina_95	1350	debito
720	Tapia	3	2023-11-19	19000	bencina_95	1350	debito
721	Tapia	3	2023-11-19	9000	kerosene	1100	debito
722	Tapia	3	2023-11-19	7000	kerosene	1100	debito
723	Tapia	3	2023-11-19	10000	bencina_93	1300	debito
724	Tapia	3	2023-11-19	11000	bencina_95	1350	debito
725	Tapia	3	2023-11-19	2000	bencina_95	1350	debito
726	Tapia	3	2023-11-19	8000	bencina_97	1400	debito
727	Tapia	3	2023-11-19	4000	bencina_93	1300	debito
728	Tapia	3	2023-11-19	12000	kerosene	1100	debito
729	Tapia	3	2023-11-19	6000	bencina_97	1400	debito
730	Tapia	3	2023-11-19	7000	bencina_95	1350	debito
731	Tapia	3	2023-11-19	2000	bencina_97	1400	debito
732	Tapia	3	2023-11-19	17000	kerosene	1100	debito
733	Tapia	3	2023-11-19	3000	kerosene	1100	debito
734	Tapia	3	2023-11-19	7000	bencina_97	1400	debito
735	Tapia	3	2023-11-19	2000	bencina_95	1350	debito
736	Tapia	3	2023-11-19	1000	bencina_95	1350	debito
737	Tapia	3	2023-11-19	11000	kerosene	1100	debito
738	Tapia	3	2023-11-19	7000	bencina_93	1300	debito
739	Tapia	3	2023-11-19	7000	bencina_97	1400	debito
740	Tapia	3	2023-11-19	16000	bencina_95	1350	debito
741	Tapia	3	2023-11-19	3000	bencina_95	1350	debito
742	Tapia	3	2023-11-19	4000	bencina_95	1350	debito
743	Tapia	3	2023-11-19	13000	bencina_93	1300	debito
744	Tapia	3	2023-11-19	14000	bencina_93	1300	debito
745	Tapia	3	2023-11-19	10000	kerosene	1100	debito
746	Tapia	3	2023-11-19	11000	bencina_97	1400	debito
747	Tapia	3	2023-11-19	11000	kerosene	1100	debito
748	Tapia	3	2023-11-19	11000	bencina_93	1300	debito
749	Tapia	3	2023-11-19	11000	bencina_95	1350	debito
750	Tapia	3	2023-11-19	18000	bencina_97	1400	debito
751	Tapia	3	2023-11-19	11000	bencina_97	1400	debito
752	Tapia	3	2023-11-19	3000	bencina_93	1300	debito
753	Tapia	3	2023-11-19	15000	bencina_97	1400	debito
754	Tapia	3	2023-11-19	16000	bencina_97	1400	debito
755	Tapia	3	2023-11-19	8000	bencina_97	1400	debito
756	Tapia	3	2023-11-19	9000	bencina_95	1350	debito
757	Tapia	3	2023-11-19	19000	bencina_93	1300	debito
758	Tapia	3	2023-11-19	9000	bencina_93	1300	debito
759	Tapia	3	2023-11-19	11000	bencina_97	1400	debito
760	Tapia	3	2023-11-19	5000	bencina_93	1300	debito
761	Tapia	3	2023-11-19	18000	bencina_97	1400	debito
762	Tapia	3	2023-11-19	13000	bencina_95	1350	debito
763	Tapia	3	2023-11-19	19000	bencina_93	1300	debito
764	Tapia	3	2023-11-19	8000	bencina_93	1300	debito
765	Tapia	3	2023-11-19	12000	kerosene	1100	debito
766	Tapia	3	2023-11-19	5000	bencina_95	1350	debito
767	Tapia	3	2023-11-19	4000	bencina_93	1300	debito
768	Tapia	3	2023-11-19	9000	bencina_95	1350	debito
769	Tapia	3	2023-11-19	5000	bencina_97	1400	debito
770	Tapia	3	2023-11-19	20000	bencina_97	1400	debito
771	Tapia	3	2023-11-19	14000	bencina_93	1300	debito
772	Tapia	3	2023-11-19	18000	bencina_93	1300	debito
773	Tapia	3	2023-11-19	1000	bencina_95	1350	debito
774	Tapia	3	2023-11-19	6000	bencina_97	1400	debito
775	Tapia	3	2023-11-19	7000	bencina_95	1350	debito
776	Tapia	3	2023-11-19	18000	bencina_93	1300	debito
777	Tapia	3	2023-11-19	9000	bencina_95	1350	debito
778	Tapia	3	2023-11-19	7000	bencina_93	1300	debito
779	Tapia	3	2023-11-19	8000	kerosene	1100	debito
780	Tapia	3	2023-11-19	19000	bencina_93	1300	debito
781	Tapia	3	2023-11-19	12000	bencina_95	1350	debito
782	Tapia	3	2023-11-19	20000	bencina_95	1350	debito
783	Tapia	3	2023-11-19	4000	bencina_97	1400	debito
784	Tapia	3	2023-11-19	19000	kerosene	1100	debito
785	Tapia	3	2023-11-19	7000	kerosene	1100	debito
786	Tapia	3	2023-11-19	10000	bencina_95	1350	debito
787	Tapia	3	2023-11-19	17000	bencina_97	1400	debito
788	Tapia	3	2023-11-19	2000	bencina_95	1350	debito
789	Tapia	3	2023-11-19	1000	bencina_95	1350	debito
790	Tapia	3	2023-11-19	19000	kerosene	1100	debito
791	Tapia	3	2023-11-19	4000	bencina_93	1300	debito
792	Tapia	3	2023-11-19	10000	bencina_93	1300	debito
793	Tapia	3	2023-11-19	15000	bencina_93	1300	debito
794	Tapia	3	2023-11-19	20000	bencina_93	1300	debito
795	Tapia	3	2023-11-19	15000	kerosene	1100	debito
796	Tapia	3	2023-11-19	19000	kerosene	1100	debito
797	Tapia	3	2023-11-19	15000	kerosene	1100	debito
798	Tapia	3	2023-11-19	14000	bencina_93	1300	debito
799	Tapia	3	2023-11-19	11000	bencina_93	1300	debito
800	Tapia	3	2023-11-19	13000	bencina_97	1400	debito
801	Tapia	3	2023-11-19	15000	bencina_93	1300	debito
802	Victor	1	2023-11-18	5000	bencina_93	1300	debito
803	Victor	1	2023-11-18	17000	bencina_97	1400	debito
804	Victor	1	2023-11-18	15000	bencina_95	1350	debito
805	Victor	1	2023-11-18	6000	bencina_97	1400	debito
806	Victor	1	2023-11-18	10000	bencina_93	1300	debito
807	Victor	1	2023-11-18	5000	bencina_95	1350	debito
808	Victor	1	2023-11-18	4000	bencina_93	1300	debito
809	Victor	1	2023-11-18	8000	kerosene	1100	debito
810	Victor	1	2023-11-18	17000	bencina_95	1350	debito
811	Victor	1	2023-11-18	12000	bencina_97	1400	debito
812	Victor	1	2023-11-18	14000	kerosene	1100	debito
813	Victor	1	2023-11-18	17000	kerosene	1100	debito
814	Victor	1	2023-11-18	8000	bencina_97	1400	debito
815	Victor	1	2023-11-18	1000	bencina_97	1400	debito
816	Victor	1	2023-11-18	20000	bencina_95	1350	debito
817	Victor	1	2023-11-18	9000	bencina_95	1350	debito
818	Victor	1	2023-11-18	14000	kerosene	1100	debito
819	Victor	1	2023-11-18	12000	bencina_93	1300	debito
820	Victor	1	2023-11-18	8000	bencina_95	1350	debito
821	Victor	1	2023-11-18	11000	bencina_97	1400	debito
822	Victor	1	2023-11-18	14000	kerosene	1100	debito
823	Victor	1	2023-11-18	1000	bencina_97	1400	debito
824	Victor	1	2023-11-18	17000	kerosene	1100	debito
825	Victor	1	2023-11-18	13000	bencina_97	1400	debito
826	Victor	1	2023-11-18	5000	bencina_95	1350	debito
827	Victor	1	2023-11-18	12000	bencina_97	1400	debito
828	Victor	1	2023-11-18	9000	kerosene	1100	debito
829	Victor	1	2023-11-18	20000	kerosene	1100	debito
830	Victor	1	2023-11-18	11000	bencina_97	1400	debito
831	Victor	1	2023-11-18	10000	kerosene	1100	debito
832	Victor	1	2023-11-18	15000	bencina_97	1400	debito
833	Victor	1	2023-11-18	18000	bencina_95	1350	debito
834	Victor	1	2023-11-18	19000	bencina_97	1400	debito
835	Victor	1	2023-11-18	10000	bencina_93	1300	debito
836	Victor	1	2023-11-18	2000	bencina_93	1300	debito
837	Victor	1	2023-11-18	18000	bencina_97	1400	debito
838	Victor	1	2023-11-18	12000	bencina_95	1350	debito
839	Victor	1	2023-11-18	3000	bencina_97	1400	debito
840	Victor	1	2023-11-18	20000	bencina_93	1300	debito
841	Victor	1	2023-11-18	5000	bencina_93	1300	debito
842	Victor	1	2023-11-18	7000	bencina_97	1400	debito
843	Victor	1	2023-11-18	15000	kerosene	1100	debito
844	Victor	1	2023-11-18	5000	kerosene	1100	debito
845	Victor	1	2023-11-18	17000	bencina_93	1300	debito
846	Victor	1	2023-11-18	5000	bencina_97	1400	debito
847	Victor	1	2023-11-18	15000	bencina_97	1400	debito
848	Victor	1	2023-11-18	4000	bencina_93	1300	debito
849	Victor	1	2023-11-18	7000	bencina_95	1350	debito
850	Victor	1	2023-11-18	15000	bencina_95	1350	debito
851	Victor	1	2023-11-18	9000	kerosene	1100	debito
852	Victor	1	2023-11-18	9000	bencina_95	1350	debito
853	Victor	1	2023-11-18	15000	bencina_93	1300	debito
854	Victor	1	2023-11-18	8000	bencina_97	1400	debito
855	Victor	1	2023-11-18	12000	bencina_95	1350	debito
856	Victor	1	2023-11-18	17000	bencina_95	1350	debito
857	Victor	1	2023-11-18	20000	bencina_97	1400	debito
858	Victor	1	2023-11-18	9000	bencina_95	1350	debito
859	Victor	1	2023-11-18	3000	bencina_93	1300	debito
860	Victor	1	2023-11-18	5000	bencina_97	1400	debito
861	Victor	1	2023-11-18	11000	bencina_93	1300	debito
862	Victor	1	2023-11-18	15000	bencina_97	1400	debito
863	Victor	1	2023-11-18	14000	bencina_95	1350	debito
864	Victor	1	2023-11-18	10000	bencina_97	1400	debito
865	Victor	1	2023-11-18	4000	bencina_95	1350	debito
866	Victor	1	2023-11-18	15000	bencina_93	1300	debito
867	Victor	1	2023-11-18	8000	bencina_93	1300	debito
868	Victor	1	2023-11-18	14000	bencina_93	1300	debito
869	Victor	1	2023-11-18	18000	bencina_95	1350	debito
870	Victor	1	2023-11-18	5000	bencina_93	1300	debito
871	Victor	1	2023-11-18	14000	bencina_93	1300	debito
872	Victor	1	2023-11-18	20000	bencina_97	1400	debito
873	Victor	1	2023-11-18	19000	bencina_93	1300	debito
874	Victor	1	2023-11-18	9000	bencina_95	1350	debito
875	Victor	1	2023-11-18	11000	kerosene	1100	debito
876	Victor	1	2023-11-18	8000	bencina_95	1350	debito
877	Victor	1	2023-11-18	13000	kerosene	1100	debito
878	Victor	1	2023-11-18	5000	kerosene	1100	debito
879	Victor	1	2023-11-18	10000	bencina_95	1350	debito
880	Victor	1	2023-11-18	15000	bencina_95	1350	debito
881	Victor	1	2023-11-18	6000	bencina_93	1300	debito
882	Victor	1	2023-11-18	9000	bencina_95	1350	debito
883	Victor	1	2023-11-18	2000	bencina_93	1300	debito
884	Victor	1	2023-11-18	12000	bencina_97	1400	debito
885	Victor	1	2023-11-18	12000	kerosene	1100	debito
886	Victor	1	2023-11-18	1000	bencina_97	1400	debito
887	Victor	1	2023-11-18	1000	bencina_97	1400	debito
888	Victor	1	2023-11-18	20000	bencina_95	1350	debito
889	Victor	1	2023-11-18	11000	kerosene	1100	debito
890	Victor	1	2023-11-18	5000	bencina_93	1300	debito
891	Victor	1	2023-11-18	10000	bencina_97	1400	debito
892	Victor	1	2023-11-18	17000	bencina_95	1350	debito
893	Victor	1	2023-11-18	9000	bencina_95	1350	debito
894	Victor	1	2023-11-18	10000	kerosene	1100	debito
895	Victor	1	2023-11-18	17000	bencina_95	1350	debito
896	Victor	1	2023-11-18	12000	bencina_95	1350	debito
897	Victor	1	2023-11-18	5000	bencina_97	1400	debito
898	Victor	1	2023-11-18	18000	bencina_97	1400	debito
899	Victor	1	2023-11-18	4000	kerosene	1100	debito
900	Victor	1	2023-11-18	16000	bencina_97	1400	debito
901	Victor	1	2023-11-18	17000	bencina_97	1400	debito
902	Yorman	2	2023-11-18	5000	bencina_93	1300	debito
903	Yorman	2	2023-11-18	5000	kerosene	1100	debito
904	Yorman	2	2023-11-18	8000	bencina_93	1300	debito
905	Yorman	2	2023-11-18	6000	kerosene	1100	debito
906	Yorman	2	2023-11-18	2000	bencina_93	1300	debito
907	Yorman	2	2023-11-18	4000	kerosene	1100	debito
908	Yorman	2	2023-11-18	7000	bencina_97	1400	debito
909	Yorman	2	2023-11-18	10000	bencina_95	1350	debito
910	Yorman	2	2023-11-18	5000	kerosene	1100	debito
911	Yorman	2	2023-11-18	13000	kerosene	1100	debito
912	Yorman	2	2023-11-18	4000	bencina_93	1300	debito
913	Yorman	2	2023-11-18	4000	bencina_95	1350	debito
914	Yorman	2	2023-11-18	1000	bencina_95	1350	debito
915	Yorman	2	2023-11-18	13000	bencina_93	1300	debito
916	Yorman	2	2023-11-18	13000	bencina_93	1300	debito
917	Yorman	2	2023-11-18	1000	bencina_95	1350	debito
918	Yorman	2	2023-11-18	15000	kerosene	1100	debito
919	Yorman	2	2023-11-18	17000	kerosene	1100	debito
920	Yorman	2	2023-11-18	17000	kerosene	1100	debito
921	Yorman	2	2023-11-18	19000	bencina_97	1400	debito
922	Yorman	2	2023-11-18	3000	kerosene	1100	debito
923	Yorman	2	2023-11-18	11000	kerosene	1100	debito
924	Yorman	2	2023-11-18	2000	bencina_95	1350	debito
925	Yorman	2	2023-11-18	19000	bencina_97	1400	debito
926	Yorman	2	2023-11-18	2000	bencina_95	1350	debito
927	Yorman	2	2023-11-18	6000	bencina_95	1350	debito
928	Yorman	2	2023-11-18	20000	bencina_97	1400	debito
929	Yorman	2	2023-11-18	17000	bencina_95	1350	debito
930	Yorman	2	2023-11-18	2000	kerosene	1100	debito
931	Yorman	2	2023-11-18	11000	bencina_95	1350	debito
932	Yorman	2	2023-11-18	18000	bencina_93	1300	debito
933	Yorman	2	2023-11-18	5000	bencina_93	1300	debito
934	Yorman	2	2023-11-18	14000	bencina_95	1350	debito
935	Yorman	2	2023-11-18	11000	bencina_93	1300	debito
936	Yorman	2	2023-11-18	8000	bencina_97	1400	debito
937	Yorman	2	2023-11-18	20000	kerosene	1100	debito
938	Yorman	2	2023-11-18	6000	bencina_95	1350	debito
939	Yorman	2	2023-11-18	14000	bencina_97	1400	debito
940	Yorman	2	2023-11-18	20000	bencina_97	1400	debito
941	Yorman	2	2023-11-18	9000	kerosene	1100	debito
942	Yorman	2	2023-11-18	16000	bencina_95	1350	debito
943	Yorman	2	2023-11-18	19000	bencina_93	1300	debito
944	Yorman	2	2023-11-18	2000	kerosene	1100	debito
945	Yorman	2	2023-11-18	18000	bencina_97	1400	debito
946	Yorman	2	2023-11-18	8000	bencina_93	1300	debito
947	Yorman	2	2023-11-18	2000	bencina_93	1300	debito
948	Yorman	2	2023-11-18	11000	bencina_97	1400	debito
949	Yorman	2	2023-11-18	19000	bencina_95	1350	debito
950	Yorman	2	2023-11-18	17000	bencina_93	1300	debito
951	Yorman	2	2023-11-18	9000	bencina_95	1350	debito
952	Yorman	2	2023-11-18	13000	bencina_93	1300	debito
953	Yorman	2	2023-11-18	11000	kerosene	1100	debito
954	Yorman	2	2023-11-18	6000	kerosene	1100	debito
955	Yorman	2	2023-11-18	10000	bencina_95	1350	debito
956	Yorman	2	2023-11-18	12000	bencina_97	1400	debito
957	Yorman	2	2023-11-18	18000	kerosene	1100	debito
958	Yorman	2	2023-11-18	6000	kerosene	1100	debito
959	Yorman	2	2023-11-18	15000	bencina_93	1300	debito
960	Yorman	2	2023-11-18	12000	kerosene	1100	debito
961	Yorman	2	2023-11-18	4000	kerosene	1100	debito
962	Yorman	2	2023-11-18	2000	bencina_97	1400	debito
963	Yorman	2	2023-11-18	20000	kerosene	1100	debito
964	Yorman	2	2023-11-18	16000	kerosene	1100	debito
965	Yorman	2	2023-11-18	7000	bencina_97	1400	debito
966	Yorman	2	2023-11-18	2000	bencina_93	1300	debito
967	Yorman	2	2023-11-18	11000	bencina_93	1300	debito
968	Yorman	2	2023-11-18	5000	bencina_93	1300	debito
969	Yorman	2	2023-11-18	5000	bencina_95	1350	debito
970	Yorman	2	2023-11-18	1000	bencina_93	1300	debito
971	Yorman	2	2023-11-18	19000	bencina_93	1300	debito
972	Yorman	2	2023-11-18	10000	bencina_97	1400	debito
973	Yorman	2	2023-11-18	12000	bencina_93	1300	debito
974	Yorman	2	2023-11-18	6000	kerosene	1100	debito
975	Yorman	2	2023-11-18	18000	bencina_95	1350	debito
976	Yorman	2	2023-11-18	18000	bencina_95	1350	debito
977	Yorman	2	2023-11-18	16000	kerosene	1100	debito
978	Yorman	2	2023-11-18	17000	kerosene	1100	debito
979	Yorman	2	2023-11-18	10000	bencina_95	1350	debito
980	Yorman	2	2023-11-18	3000	bencina_93	1300	debito
981	Yorman	2	2023-11-18	1000	bencina_93	1300	debito
982	Yorman	2	2023-11-18	6000	bencina_93	1300	debito
983	Yorman	2	2023-11-18	19000	bencina_97	1400	debito
984	Yorman	2	2023-11-18	20000	kerosene	1100	debito
985	Yorman	2	2023-11-18	5000	bencina_95	1350	debito
986	Yorman	2	2023-11-18	4000	bencina_95	1350	debito
987	Yorman	2	2023-11-18	15000	bencina_93	1300	debito
988	Yorman	2	2023-11-18	3000	kerosene	1100	debito
989	Yorman	2	2023-11-18	14000	bencina_95	1350	debito
990	Yorman	2	2023-11-18	14000	bencina_97	1400	debito
991	Yorman	2	2023-11-18	14000	bencina_97	1400	debito
992	Yorman	2	2023-11-18	9000	bencina_97	1400	debito
993	Yorman	2	2023-11-18	12000	bencina_95	1350	debito
994	Yorman	2	2023-11-18	19000	kerosene	1100	debito
995	Yorman	2	2023-11-18	12000	kerosene	1100	debito
996	Yorman	2	2023-11-18	13000	kerosene	1100	debito
997	Yorman	2	2023-11-18	14000	bencina_93	1300	debito
998	Yorman	2	2023-11-18	6000	bencina_95	1350	debito
999	Yorman	2	2023-11-18	3000	bencina_95	1350	debito
1000	Yorman	2	2023-11-18	4000	bencina_93	1300	debito
1001	Yorman	2	2023-11-18	9000	bencina_93	1300	debito
1002	Edward	3	2023-11-18	15000	bencina_93	1300	debito
1003	Edward	3	2023-11-18	15000	kerosene	1100	debito
1004	Edward	3	2023-11-18	16000	bencina_95	1350	debito
1005	Edward	3	2023-11-18	14000	bencina_97	1400	debito
1006	Edward	3	2023-11-18	2000	kerosene	1100	debito
1007	Edward	3	2023-11-18	6000	bencina_97	1400	debito
1008	Edward	3	2023-11-18	12000	bencina_97	1400	debito
1009	Edward	3	2023-11-18	7000	kerosene	1100	debito
1010	Edward	3	2023-11-18	11000	bencina_93	1300	debito
1011	Edward	3	2023-11-18	3000	bencina_95	1350	debito
1012	Edward	3	2023-11-18	13000	bencina_93	1300	debito
1013	Edward	3	2023-11-18	5000	bencina_97	1400	debito
1014	Edward	3	2023-11-18	14000	bencina_97	1400	debito
1015	Edward	3	2023-11-18	1000	bencina_95	1350	debito
1016	Edward	3	2023-11-18	3000	bencina_95	1350	debito
1017	Edward	3	2023-11-18	13000	bencina_97	1400	debito
1018	Edward	3	2023-11-18	17000	bencina_95	1350	debito
1019	Edward	3	2023-11-18	19000	bencina_95	1350	debito
1020	Edward	3	2023-11-18	14000	bencina_95	1350	debito
1021	Edward	3	2023-11-18	6000	kerosene	1100	debito
1022	Edward	3	2023-11-18	20000	kerosene	1100	debito
1023	Edward	3	2023-11-18	19000	bencina_93	1300	debito
1024	Edward	3	2023-11-18	8000	bencina_95	1350	debito
1025	Edward	3	2023-11-18	20000	kerosene	1100	debito
1026	Edward	3	2023-11-18	19000	bencina_97	1400	debito
1027	Edward	3	2023-11-18	4000	kerosene	1100	debito
1028	Edward	3	2023-11-18	7000	bencina_95	1350	debito
1029	Edward	3	2023-11-18	20000	kerosene	1100	debito
1030	Edward	3	2023-11-18	18000	bencina_97	1400	debito
1031	Edward	3	2023-11-18	9000	bencina_97	1400	debito
1032	Edward	3	2023-11-18	14000	kerosene	1100	debito
1033	Edward	3	2023-11-18	15000	bencina_93	1300	debito
1034	Edward	3	2023-11-18	4000	bencina_97	1400	debito
1035	Edward	3	2023-11-18	7000	bencina_95	1350	debito
1036	Edward	3	2023-11-18	17000	kerosene	1100	debito
1037	Edward	3	2023-11-18	3000	bencina_97	1400	debito
1038	Edward	3	2023-11-18	7000	bencina_93	1300	debito
1039	Edward	3	2023-11-18	17000	kerosene	1100	debito
1040	Edward	3	2023-11-18	9000	bencina_97	1400	debito
1041	Edward	3	2023-11-18	1000	bencina_93	1300	debito
1042	Edward	3	2023-11-18	7000	kerosene	1100	debito
1043	Edward	3	2023-11-18	6000	bencina_95	1350	debito
1044	Edward	3	2023-11-18	20000	bencina_95	1350	debito
1045	Edward	3	2023-11-18	5000	bencina_97	1400	debito
1046	Edward	3	2023-11-18	9000	bencina_97	1400	debito
1047	Edward	3	2023-11-18	4000	bencina_93	1300	debito
1048	Edward	3	2023-11-18	19000	bencina_97	1400	debito
1049	Edward	3	2023-11-18	11000	bencina_97	1400	debito
1050	Edward	3	2023-11-18	18000	bencina_93	1300	debito
1051	Edward	3	2023-11-18	18000	bencina_97	1400	debito
1052	Edward	3	2023-11-18	7000	bencina_93	1300	debito
1053	Edward	3	2023-11-18	16000	bencina_97	1400	debito
1054	Edward	3	2023-11-18	9000	kerosene	1100	debito
1055	Edward	3	2023-11-18	7000	kerosene	1100	debito
1056	Edward	3	2023-11-18	17000	bencina_95	1350	debito
1057	Edward	3	2023-11-18	5000	kerosene	1100	debito
1058	Edward	3	2023-11-18	1000	bencina_95	1350	debito
1059	Edward	3	2023-11-18	2000	bencina_93	1300	debito
1060	Edward	3	2023-11-18	19000	bencina_97	1400	debito
1061	Edward	3	2023-11-18	6000	bencina_97	1400	debito
1062	Edward	3	2023-11-18	8000	bencina_93	1300	debito
1063	Edward	3	2023-11-18	11000	bencina_93	1300	debito
1064	Edward	3	2023-11-18	13000	kerosene	1100	debito
1065	Edward	3	2023-11-18	16000	bencina_95	1350	debito
1066	Edward	3	2023-11-18	9000	bencina_97	1400	debito
1067	Edward	3	2023-11-18	2000	bencina_95	1350	debito
1068	Edward	3	2023-11-18	10000	bencina_95	1350	debito
1069	Edward	3	2023-11-18	18000	kerosene	1100	debito
1070	Edward	3	2023-11-18	8000	bencina_93	1300	debito
1071	Edward	3	2023-11-18	19000	bencina_93	1300	debito
1072	Edward	3	2023-11-18	15000	bencina_93	1300	debito
1073	Edward	3	2023-11-18	9000	kerosene	1100	debito
1074	Edward	3	2023-11-18	4000	kerosene	1100	debito
1075	Edward	3	2023-11-18	1000	bencina_93	1300	debito
1076	Edward	3	2023-11-18	19000	bencina_97	1400	debito
1077	Edward	3	2023-11-18	3000	bencina_93	1300	debito
1078	Edward	3	2023-11-18	7000	bencina_93	1300	debito
1079	Edward	3	2023-11-18	9000	bencina_93	1300	debito
1080	Edward	3	2023-11-18	8000	kerosene	1100	debito
1081	Edward	3	2023-11-18	10000	bencina_97	1400	debito
1082	Edward	3	2023-11-18	13000	kerosene	1100	debito
1083	Edward	3	2023-11-18	17000	bencina_93	1300	debito
1084	Edward	3	2023-11-18	10000	bencina_93	1300	debito
1085	Edward	3	2023-11-18	11000	bencina_93	1300	debito
1086	Edward	3	2023-11-18	2000	bencina_95	1350	debito
1087	Edward	3	2023-11-18	10000	bencina_95	1350	debito
1088	Edward	3	2023-11-18	15000	bencina_95	1350	debito
1089	Edward	3	2023-11-18	16000	bencina_93	1300	debito
1090	Edward	3	2023-11-18	2000	bencina_95	1350	debito
1091	Edward	3	2023-11-18	14000	bencina_93	1300	debito
1092	Edward	3	2023-11-18	9000	kerosene	1100	debito
1093	Edward	3	2023-11-18	2000	bencina_93	1300	debito
1094	Edward	3	2023-11-18	1000	bencina_93	1300	debito
1095	Edward	3	2023-11-18	6000	bencina_95	1350	debito
1096	Edward	3	2023-11-18	4000	bencina_97	1400	debito
1097	Edward	3	2023-11-18	10000	bencina_95	1350	debito
1098	Edward	3	2023-11-18	16000	bencina_97	1400	debito
1099	Edward	3	2023-11-18	5000	bencina_93	1300	debito
1100	Edward	3	2023-11-18	2000	kerosene	1100	debito
1101	Edward	3	2023-11-18	1000	bencina_93	1300	debito
1102	Gerardo	1	2023-11-17	16000	kerosene	1100	debito
1103	Gerardo	1	2023-11-17	20000	bencina_95	1350	debito
1104	Gerardo	1	2023-11-17	11000	kerosene	1100	debito
1105	Gerardo	1	2023-11-17	9000	bencina_95	1350	debito
1106	Gerardo	1	2023-11-17	2000	bencina_95	1350	debito
1107	Gerardo	1	2023-11-17	20000	bencina_97	1400	debito
1108	Gerardo	1	2023-11-17	2000	bencina_97	1400	debito
1109	Gerardo	1	2023-11-17	5000	bencina_93	1300	debito
1110	Gerardo	1	2023-11-17	15000	bencina_95	1350	debito
1111	Gerardo	1	2023-11-17	4000	bencina_95	1350	debito
1112	Gerardo	1	2023-11-17	5000	bencina_95	1350	debito
1113	Gerardo	1	2023-11-17	2000	bencina_93	1300	debito
1114	Gerardo	1	2023-11-17	19000	bencina_97	1400	debito
1115	Gerardo	1	2023-11-17	1000	bencina_97	1400	debito
1116	Gerardo	1	2023-11-17	3000	kerosene	1100	debito
1117	Gerardo	1	2023-11-17	18000	bencina_95	1350	debito
1118	Gerardo	1	2023-11-17	11000	kerosene	1100	debito
1119	Gerardo	1	2023-11-17	1000	bencina_97	1400	debito
1120	Gerardo	1	2023-11-17	16000	bencina_95	1350	debito
1121	Gerardo	1	2023-11-17	14000	kerosene	1100	debito
1122	Gerardo	1	2023-11-17	11000	bencina_97	1400	debito
1123	Gerardo	1	2023-11-17	4000	bencina_97	1400	debito
1124	Gerardo	1	2023-11-17	6000	bencina_93	1300	debito
1125	Gerardo	1	2023-11-17	4000	bencina_97	1400	debito
1126	Gerardo	1	2023-11-17	2000	bencina_97	1400	debito
1127	Gerardo	1	2023-11-17	4000	kerosene	1100	debito
1128	Gerardo	1	2023-11-17	3000	bencina_97	1400	debito
1129	Gerardo	1	2023-11-17	10000	bencina_97	1400	debito
1130	Gerardo	1	2023-11-17	7000	bencina_93	1300	debito
1131	Gerardo	1	2023-11-17	13000	bencina_93	1300	debito
1132	Gerardo	1	2023-11-17	6000	bencina_97	1400	debito
1133	Gerardo	1	2023-11-17	4000	bencina_97	1400	debito
1134	Gerardo	1	2023-11-17	15000	bencina_93	1300	debito
1135	Gerardo	1	2023-11-17	1000	bencina_95	1350	debito
1136	Gerardo	1	2023-11-17	14000	bencina_95	1350	debito
1137	Gerardo	1	2023-11-17	18000	bencina_97	1400	debito
1138	Gerardo	1	2023-11-17	16000	bencina_93	1300	debito
1139	Gerardo	1	2023-11-17	12000	bencina_97	1400	debito
1140	Gerardo	1	2023-11-17	2000	bencina_93	1300	debito
1141	Gerardo	1	2023-11-17	6000	bencina_93	1300	debito
1142	Gerardo	1	2023-11-17	17000	bencina_97	1400	debito
1143	Gerardo	1	2023-11-17	7000	bencina_97	1400	debito
1144	Gerardo	1	2023-11-17	7000	kerosene	1100	debito
1145	Gerardo	1	2023-11-17	15000	bencina_93	1300	debito
1146	Gerardo	1	2023-11-17	19000	kerosene	1100	debito
1147	Gerardo	1	2023-11-17	11000	bencina_97	1400	debito
1148	Gerardo	1	2023-11-17	12000	bencina_93	1300	debito
1149	Gerardo	1	2023-11-17	1000	bencina_95	1350	debito
1150	Gerardo	1	2023-11-17	8000	bencina_95	1350	debito
1151	Gerardo	1	2023-11-17	17000	kerosene	1100	debito
1152	Gerardo	1	2023-11-17	5000	bencina_95	1350	debito
1153	Gerardo	1	2023-11-17	2000	bencina_95	1350	debito
1154	Gerardo	1	2023-11-17	5000	bencina_97	1400	debito
1155	Gerardo	1	2023-11-17	13000	kerosene	1100	debito
1156	Gerardo	1	2023-11-17	6000	kerosene	1100	debito
1157	Gerardo	1	2023-11-17	16000	kerosene	1100	debito
1158	Gerardo	1	2023-11-17	11000	bencina_93	1300	debito
1159	Gerardo	1	2023-11-17	4000	bencina_95	1350	debito
1160	Gerardo	1	2023-11-17	1000	bencina_95	1350	debito
1161	Gerardo	1	2023-11-17	9000	kerosene	1100	debito
1162	Gerardo	1	2023-11-17	7000	kerosene	1100	debito
1163	Gerardo	1	2023-11-17	19000	bencina_93	1300	debito
1164	Gerardo	1	2023-11-17	5000	bencina_97	1400	debito
1165	Gerardo	1	2023-11-17	8000	bencina_97	1400	debito
1166	Gerardo	1	2023-11-17	4000	bencina_97	1400	debito
1167	Gerardo	1	2023-11-17	8000	kerosene	1100	debito
1168	Gerardo	1	2023-11-17	10000	bencina_97	1400	debito
1169	Gerardo	1	2023-11-17	12000	bencina_95	1350	debito
1170	Gerardo	1	2023-11-17	8000	bencina_97	1400	debito
1171	Gerardo	1	2023-11-17	17000	kerosene	1100	debito
1172	Gerardo	1	2023-11-17	14000	bencina_93	1300	debito
1173	Gerardo	1	2023-11-17	12000	bencina_97	1400	debito
1174	Gerardo	1	2023-11-17	18000	bencina_95	1350	debito
1175	Gerardo	1	2023-11-17	18000	kerosene	1100	debito
1176	Gerardo	1	2023-11-17	1000	bencina_95	1350	debito
1177	Gerardo	1	2023-11-17	8000	bencina_95	1350	debito
1178	Gerardo	1	2023-11-17	2000	kerosene	1100	debito
1179	Gerardo	1	2023-11-17	5000	bencina_95	1350	debito
1180	Gerardo	1	2023-11-17	13000	bencina_95	1350	debito
1181	Gerardo	1	2023-11-17	3000	bencina_95	1350	debito
1182	Gerardo	1	2023-11-17	20000	bencina_97	1400	debito
1183	Gerardo	1	2023-11-17	16000	bencina_95	1350	debito
1184	Gerardo	1	2023-11-17	17000	bencina_95	1350	debito
1185	Gerardo	1	2023-11-17	18000	kerosene	1100	debito
1186	Gerardo	1	2023-11-17	17000	kerosene	1100	debito
1187	Gerardo	1	2023-11-17	16000	kerosene	1100	debito
1188	Gerardo	1	2023-11-17	18000	bencina_97	1400	debito
1189	Gerardo	1	2023-11-17	3000	bencina_95	1350	debito
1190	Gerardo	1	2023-11-17	14000	bencina_97	1400	debito
1191	Gerardo	1	2023-11-17	14000	kerosene	1100	debito
1192	Gerardo	1	2023-11-17	20000	bencina_97	1400	debito
1193	Gerardo	1	2023-11-17	17000	bencina_95	1350	debito
1194	Gerardo	1	2023-11-17	15000	bencina_95	1350	debito
1195	Gerardo	1	2023-11-17	18000	kerosene	1100	debito
1196	Gerardo	1	2023-11-17	18000	bencina_95	1350	debito
1197	Gerardo	1	2023-11-17	7000	bencina_97	1400	debito
1198	Gerardo	1	2023-11-17	9000	bencina_95	1350	debito
1199	Gerardo	1	2023-11-17	12000	kerosene	1100	debito
1200	Gerardo	1	2023-11-17	10000	bencina_97	1400	debito
1201	Gerardo	1	2023-11-17	14000	bencina_95	1350	debito
1202	Jhorman	2	2023-11-17	2000	kerosene	1100	debito
1203	Jhorman	2	2023-11-17	13000	bencina_93	1300	debito
1204	Jhorman	2	2023-11-17	11000	kerosene	1100	debito
1205	Jhorman	2	2023-11-17	3000	kerosene	1100	debito
1206	Jhorman	2	2023-11-17	10000	bencina_95	1350	debito
1207	Jhorman	2	2023-11-17	9000	bencina_97	1400	debito
1208	Jhorman	2	2023-11-17	14000	bencina_93	1300	debito
1209	Jhorman	2	2023-11-17	6000	bencina_97	1400	debito
1210	Jhorman	2	2023-11-17	2000	bencina_93	1300	debito
1211	Jhorman	2	2023-11-17	11000	bencina_93	1300	debito
1212	Jhorman	2	2023-11-17	4000	bencina_95	1350	debito
1213	Jhorman	2	2023-11-17	3000	bencina_95	1350	debito
1214	Jhorman	2	2023-11-17	13000	bencina_93	1300	debito
1215	Jhorman	2	2023-11-17	19000	kerosene	1100	debito
1216	Jhorman	2	2023-11-17	12000	bencina_95	1350	debito
1217	Jhorman	2	2023-11-17	20000	kerosene	1100	debito
1218	Jhorman	2	2023-11-17	13000	kerosene	1100	debito
1219	Jhorman	2	2023-11-17	10000	bencina_95	1350	debito
1220	Jhorman	2	2023-11-17	2000	bencina_97	1400	debito
1221	Jhorman	2	2023-11-17	1000	bencina_93	1300	debito
1222	Jhorman	2	2023-11-17	2000	bencina_95	1350	debito
1223	Jhorman	2	2023-11-17	14000	bencina_93	1300	debito
1224	Jhorman	2	2023-11-17	13000	bencina_93	1300	debito
1225	Jhorman	2	2023-11-17	11000	kerosene	1100	debito
1226	Jhorman	2	2023-11-17	14000	bencina_97	1400	debito
1227	Jhorman	2	2023-11-17	7000	bencina_95	1350	debito
1228	Jhorman	2	2023-11-17	11000	bencina_93	1300	debito
1229	Jhorman	2	2023-11-17	4000	bencina_93	1300	debito
1230	Jhorman	2	2023-11-17	14000	bencina_93	1300	debito
1231	Jhorman	2	2023-11-17	11000	bencina_93	1300	debito
1232	Jhorman	2	2023-11-17	18000	bencina_97	1400	debito
1233	Jhorman	2	2023-11-17	19000	bencina_93	1300	debito
1234	Jhorman	2	2023-11-17	14000	bencina_97	1400	debito
1235	Jhorman	2	2023-11-17	14000	bencina_97	1400	debito
1236	Jhorman	2	2023-11-17	9000	bencina_97	1400	debito
1237	Jhorman	2	2023-11-17	15000	kerosene	1100	debito
1238	Jhorman	2	2023-11-17	1000	kerosene	1100	debito
1239	Jhorman	2	2023-11-17	2000	bencina_93	1300	debito
1240	Jhorman	2	2023-11-17	20000	kerosene	1100	debito
1241	Jhorman	2	2023-11-17	8000	kerosene	1100	debito
1242	Jhorman	2	2023-11-17	17000	kerosene	1100	debito
1243	Jhorman	2	2023-11-17	15000	bencina_97	1400	debito
1244	Jhorman	2	2023-11-17	7000	kerosene	1100	debito
1245	Jhorman	2	2023-11-17	3000	bencina_95	1350	debito
1246	Jhorman	2	2023-11-17	9000	bencina_97	1400	debito
1247	Jhorman	2	2023-11-17	10000	bencina_95	1350	debito
1248	Jhorman	2	2023-11-17	5000	bencina_97	1400	debito
1249	Jhorman	2	2023-11-17	20000	kerosene	1100	debito
1250	Jhorman	2	2023-11-17	18000	bencina_93	1300	debito
1251	Jhorman	2	2023-11-17	1000	bencina_93	1300	debito
1252	Jhorman	2	2023-11-17	4000	bencina_93	1300	debito
1253	Jhorman	2	2023-11-17	11000	bencina_95	1350	debito
1254	Jhorman	2	2023-11-17	14000	bencina_95	1350	debito
1255	Jhorman	2	2023-11-17	3000	bencina_95	1350	debito
1256	Jhorman	2	2023-11-17	13000	bencina_97	1400	debito
1257	Jhorman	2	2023-11-17	12000	bencina_93	1300	debito
1258	Jhorman	2	2023-11-17	7000	bencina_93	1300	debito
1259	Jhorman	2	2023-11-17	8000	kerosene	1100	debito
1260	Jhorman	2	2023-11-17	14000	kerosene	1100	debito
1261	Jhorman	2	2023-11-17	16000	bencina_95	1350	debito
1262	Jhorman	2	2023-11-17	17000	bencina_97	1400	debito
1263	Jhorman	2	2023-11-17	13000	kerosene	1100	debito
1264	Jhorman	2	2023-11-17	9000	bencina_97	1400	debito
1265	Jhorman	2	2023-11-17	15000	bencina_97	1400	debito
1266	Jhorman	2	2023-11-17	4000	kerosene	1100	debito
1267	Jhorman	2	2023-11-17	13000	kerosene	1100	debito
1268	Jhorman	2	2023-11-17	18000	bencina_97	1400	debito
1269	Jhorman	2	2023-11-17	14000	bencina_93	1300	debito
1270	Jhorman	2	2023-11-17	1000	kerosene	1100	debito
1271	Jhorman	2	2023-11-17	5000	kerosene	1100	debito
1272	Jhorman	2	2023-11-17	11000	bencina_97	1400	debito
1273	Jhorman	2	2023-11-17	1000	bencina_97	1400	debito
1274	Jhorman	2	2023-11-17	14000	bencina_97	1400	debito
1275	Jhorman	2	2023-11-17	16000	kerosene	1100	debito
1276	Jhorman	2	2023-11-17	6000	bencina_97	1400	debito
1277	Jhorman	2	2023-11-17	3000	bencina_95	1350	debito
1278	Jhorman	2	2023-11-17	17000	bencina_95	1350	debito
1279	Jhorman	2	2023-11-17	12000	kerosene	1100	debito
1280	Jhorman	2	2023-11-17	2000	bencina_95	1350	debito
1281	Jhorman	2	2023-11-17	15000	bencina_93	1300	debito
1282	Jhorman	2	2023-11-17	14000	bencina_97	1400	debito
1283	Jhorman	2	2023-11-17	16000	kerosene	1100	debito
1284	Jhorman	2	2023-11-17	9000	bencina_93	1300	debito
1285	Jhorman	2	2023-11-17	16000	bencina_97	1400	debito
1286	Jhorman	2	2023-11-17	5000	bencina_95	1350	debito
1287	Jhorman	2	2023-11-17	11000	kerosene	1100	debito
1288	Jhorman	2	2023-11-17	1000	bencina_93	1300	debito
1289	Jhorman	2	2023-11-17	13000	kerosene	1100	debito
1290	Jhorman	2	2023-11-17	20000	bencina_93	1300	debito
1291	Jhorman	2	2023-11-17	19000	bencina_95	1350	debito
1292	Jhorman	2	2023-11-17	5000	bencina_95	1350	debito
1293	Jhorman	2	2023-11-17	9000	kerosene	1100	debito
1294	Jhorman	2	2023-11-17	4000	bencina_93	1300	debito
1295	Jhorman	2	2023-11-17	10000	bencina_97	1400	debito
1296	Jhorman	2	2023-11-17	11000	bencina_95	1350	debito
1297	Jhorman	2	2023-11-17	8000	bencina_97	1400	debito
1298	Jhorman	2	2023-11-17	7000	kerosene	1100	debito
1299	Jhorman	2	2023-11-17	5000	bencina_95	1350	debito
1300	Jhorman	2	2023-11-17	1000	bencina_95	1350	debito
1301	Jhorman	2	2023-11-17	16000	bencina_97	1400	debito
1302	Mendoza	3	2023-11-17	6000	bencina_93	1300	debito
1303	Mendoza	3	2023-11-17	7000	bencina_97	1400	debito
1304	Mendoza	3	2023-11-17	2000	bencina_97	1400	debito
1305	Mendoza	3	2023-11-17	14000	kerosene	1100	debito
1306	Mendoza	3	2023-11-17	2000	kerosene	1100	debito
1307	Mendoza	3	2023-11-17	15000	bencina_95	1350	debito
1308	Mendoza	3	2023-11-17	14000	kerosene	1100	debito
1309	Mendoza	3	2023-11-17	8000	bencina_93	1300	debito
1310	Mendoza	3	2023-11-17	16000	bencina_95	1350	debito
1311	Mendoza	3	2023-11-17	18000	bencina_93	1300	debito
1312	Mendoza	3	2023-11-17	3000	bencina_97	1400	debito
1313	Mendoza	3	2023-11-17	12000	kerosene	1100	debito
1314	Mendoza	3	2023-11-17	19000	bencina_97	1400	debito
1315	Mendoza	3	2023-11-17	7000	bencina_95	1350	debito
1316	Mendoza	3	2023-11-17	2000	bencina_93	1300	debito
1317	Mendoza	3	2023-11-17	19000	bencina_97	1400	debito
1318	Mendoza	3	2023-11-17	12000	bencina_93	1300	debito
1319	Mendoza	3	2023-11-17	10000	bencina_95	1350	debito
1320	Mendoza	3	2023-11-17	13000	bencina_95	1350	debito
1321	Mendoza	3	2023-11-17	13000	kerosene	1100	debito
1322	Mendoza	3	2023-11-17	11000	bencina_97	1400	debito
1323	Mendoza	3	2023-11-17	3000	bencina_97	1400	debito
1324	Mendoza	3	2023-11-17	8000	bencina_95	1350	debito
1325	Mendoza	3	2023-11-17	6000	kerosene	1100	debito
1326	Mendoza	3	2023-11-17	17000	bencina_97	1400	debito
1327	Mendoza	3	2023-11-17	9000	bencina_97	1400	debito
1328	Mendoza	3	2023-11-17	20000	bencina_93	1300	debito
1329	Mendoza	3	2023-11-17	10000	kerosene	1100	debito
1330	Mendoza	3	2023-11-17	2000	bencina_93	1300	debito
1331	Mendoza	3	2023-11-17	3000	bencina_97	1400	debito
1332	Mendoza	3	2023-11-17	1000	bencina_95	1350	debito
1333	Mendoza	3	2023-11-17	18000	kerosene	1100	debito
1334	Mendoza	3	2023-11-17	5000	bencina_97	1400	debito
1335	Mendoza	3	2023-11-17	7000	bencina_93	1300	debito
1336	Mendoza	3	2023-11-17	6000	kerosene	1100	debito
1337	Mendoza	3	2023-11-17	5000	bencina_93	1300	debito
1338	Mendoza	3	2023-11-17	6000	bencina_95	1350	debito
1339	Mendoza	3	2023-11-17	4000	bencina_95	1350	debito
1340	Mendoza	3	2023-11-17	13000	bencina_95	1350	debito
1341	Mendoza	3	2023-11-17	17000	bencina_95	1350	debito
1342	Mendoza	3	2023-11-17	13000	bencina_97	1400	debito
1343	Mendoza	3	2023-11-17	4000	kerosene	1100	debito
1344	Mendoza	3	2023-11-17	5000	bencina_95	1350	debito
1345	Mendoza	3	2023-11-17	4000	bencina_95	1350	debito
1346	Mendoza	3	2023-11-17	11000	bencina_93	1300	debito
1347	Mendoza	3	2023-11-17	9000	bencina_95	1350	debito
1348	Mendoza	3	2023-11-17	16000	bencina_97	1400	debito
1349	Mendoza	3	2023-11-17	12000	bencina_95	1350	debito
1350	Mendoza	3	2023-11-17	3000	bencina_95	1350	debito
1351	Mendoza	3	2023-11-17	9000	bencina_95	1350	debito
1352	Mendoza	3	2023-11-17	14000	bencina_93	1300	debito
1353	Mendoza	3	2023-11-17	3000	bencina_93	1300	debito
1354	Mendoza	3	2023-11-17	13000	bencina_95	1350	debito
1355	Mendoza	3	2023-11-17	15000	bencina_93	1300	debito
1356	Mendoza	3	2023-11-17	16000	kerosene	1100	debito
1357	Mendoza	3	2023-11-17	14000	kerosene	1100	debito
1358	Mendoza	3	2023-11-17	11000	kerosene	1100	debito
1359	Mendoza	3	2023-11-17	4000	bencina_97	1400	debito
1360	Mendoza	3	2023-11-17	14000	bencina_93	1300	debito
1361	Mendoza	3	2023-11-17	17000	kerosene	1100	debito
1362	Mendoza	3	2023-11-17	2000	bencina_95	1350	debito
1363	Mendoza	3	2023-11-17	12000	bencina_93	1300	debito
1364	Mendoza	3	2023-11-17	19000	bencina_97	1400	debito
1365	Mendoza	3	2023-11-17	14000	bencina_97	1400	debito
1366	Mendoza	3	2023-11-17	13000	bencina_97	1400	debito
1367	Mendoza	3	2023-11-17	17000	bencina_93	1300	debito
1368	Mendoza	3	2023-11-17	14000	kerosene	1100	debito
1369	Mendoza	3	2023-11-17	6000	kerosene	1100	debito
1370	Mendoza	3	2023-11-17	4000	bencina_97	1400	debito
1371	Mendoza	3	2023-11-17	3000	bencina_95	1350	debito
1372	Mendoza	3	2023-11-17	10000	bencina_97	1400	debito
1373	Mendoza	3	2023-11-17	2000	bencina_95	1350	debito
1374	Mendoza	3	2023-11-17	16000	kerosene	1100	debito
1375	Mendoza	3	2023-11-17	15000	kerosene	1100	debito
1376	Mendoza	3	2023-11-17	6000	kerosene	1100	debito
1377	Mendoza	3	2023-11-17	6000	bencina_97	1400	debito
1378	Mendoza	3	2023-11-17	8000	bencina_95	1350	debito
1379	Mendoza	3	2023-11-17	1000	bencina_97	1400	debito
1380	Mendoza	3	2023-11-17	3000	bencina_95	1350	debito
1381	Mendoza	3	2023-11-17	4000	bencina_93	1300	debito
1382	Mendoza	3	2023-11-17	13000	bencina_93	1300	debito
1383	Mendoza	3	2023-11-17	13000	bencina_97	1400	debito
1384	Mendoza	3	2023-11-17	10000	bencina_95	1350	debito
1385	Mendoza	3	2023-11-17	14000	kerosene	1100	debito
1386	Mendoza	3	2023-11-17	5000	bencina_97	1400	debito
1387	Mendoza	3	2023-11-17	8000	bencina_95	1350	debito
1388	Mendoza	3	2023-11-17	10000	bencina_97	1400	debito
1389	Mendoza	3	2023-11-17	11000	bencina_95	1350	debito
1390	Mendoza	3	2023-11-17	2000	bencina_97	1400	debito
1391	Mendoza	3	2023-11-17	15000	kerosene	1100	debito
1392	Mendoza	3	2023-11-17	19000	bencina_93	1300	debito
1393	Mendoza	3	2023-11-17	8000	bencina_93	1300	debito
1394	Mendoza	3	2023-11-17	15000	bencina_93	1300	debito
1395	Mendoza	3	2023-11-17	9000	kerosene	1100	debito
1396	Mendoza	3	2023-11-17	6000	kerosene	1100	debito
1397	Mendoza	3	2023-11-17	1000	bencina_95	1350	debito
1398	Mendoza	3	2023-11-17	11000	bencina_95	1350	debito
1399	Mendoza	3	2023-11-17	20000	bencina_97	1400	debito
1400	Mendoza	3	2023-11-17	2000	kerosene	1100	debito
1401	Mendoza	3	2023-11-17	3000	bencina_95	1350	debito
1452	Orlando	1	2023-11-16	18000	bencina_97	1400	debito
1453	Orlando	1	2023-11-16	17000	bencina_97	1400	debito
1454	Orlando	1	2023-11-16	12000	kerosene	1100	debito
1455	Orlando	1	2023-11-16	9000	bencina_93	1300	debito
1456	Orlando	1	2023-11-16	6000	bencina_95	1350	debito
1457	Orlando	1	2023-11-16	6000	bencina_93	1300	debito
1458	Orlando	1	2023-11-16	19000	bencina_95	1350	debito
1459	Orlando	1	2023-11-16	12000	bencina_95	1350	debito
1460	Orlando	1	2023-11-16	9000	bencina_95	1350	debito
1461	Orlando	1	2023-11-16	19000	kerosene	1100	debito
1462	Orlando	1	2023-11-16	19000	bencina_93	1300	debito
1463	Orlando	1	2023-11-16	6000	bencina_97	1400	debito
1464	Orlando	1	2023-11-16	1000	kerosene	1100	debito
1465	Orlando	1	2023-11-16	19000	bencina_97	1400	debito
1466	Orlando	1	2023-11-16	9000	bencina_97	1400	debito
1467	Orlando	1	2023-11-16	13000	kerosene	1100	debito
1468	Orlando	1	2023-11-16	6000	bencina_97	1400	debito
1469	Orlando	1	2023-11-16	11000	kerosene	1100	debito
1470	Orlando	1	2023-11-16	13000	bencina_97	1400	debito
1471	Orlando	1	2023-11-16	17000	bencina_95	1350	debito
1472	Orlando	1	2023-11-16	18000	kerosene	1100	debito
1473	Orlando	1	2023-11-16	11000	bencina_95	1350	debito
1474	Orlando	1	2023-11-16	4000	kerosene	1100	debito
1475	Orlando	1	2023-11-16	18000	bencina_97	1400	debito
1476	Orlando	1	2023-11-16	12000	bencina_93	1300	debito
1477	Orlando	1	2023-11-16	6000	kerosene	1100	debito
1478	Orlando	1	2023-11-16	20000	bencina_97	1400	debito
1479	Orlando	1	2023-11-16	8000	bencina_93	1300	debito
1480	Orlando	1	2023-11-16	12000	bencina_97	1400	debito
1481	Orlando	1	2023-11-16	7000	kerosene	1100	debito
1482	Orlando	1	2023-11-16	13000	bencina_93	1300	debito
1483	Orlando	1	2023-11-16	18000	bencina_93	1300	debito
1484	Orlando	1	2023-11-16	3000	bencina_93	1300	debito
1485	Orlando	1	2023-11-16	10000	bencina_95	1350	debito
1486	Orlando	1	2023-11-16	14000	kerosene	1100	debito
1487	Orlando	1	2023-11-16	9000	kerosene	1100	debito
1488	Orlando	1	2023-11-16	6000	bencina_95	1350	debito
1489	Orlando	1	2023-11-16	13000	kerosene	1100	debito
1490	Orlando	1	2023-11-16	8000	bencina_97	1400	debito
1491	Orlando	1	2023-11-16	19000	bencina_97	1400	debito
1492	Orlando	1	2023-11-16	2000	bencina_95	1350	debito
1493	Orlando	1	2023-11-16	12000	kerosene	1100	debito
1494	Orlando	1	2023-11-16	16000	kerosene	1100	debito
1495	Orlando	1	2023-11-16	16000	bencina_95	1350	debito
1496	Orlando	1	2023-11-16	5000	kerosene	1100	debito
1497	Orlando	1	2023-11-16	12000	bencina_95	1350	debito
1498	Orlando	1	2023-11-16	11000	bencina_95	1350	debito
1499	Orlando	1	2023-11-16	11000	bencina_97	1400	debito
1500	Orlando	1	2023-11-16	15000	bencina_95	1350	debito
1501	Orlando	1	2023-11-16	17000	kerosene	1100	debito
1502	Tapia	2	2023-11-16	9000	bencina_97	1400	debito
1503	Tapia	2	2023-11-16	20000	bencina_93	1300	debito
1504	Tapia	2	2023-11-16	12000	bencina_95	1350	debito
1505	Tapia	2	2023-11-16	10000	kerosene	1100	debito
1506	Tapia	2	2023-11-16	5000	bencina_95	1350	debito
1507	Tapia	2	2023-11-16	4000	bencina_93	1300	debito
1508	Tapia	2	2023-11-16	18000	bencina_95	1350	debito
1509	Tapia	2	2023-11-16	19000	bencina_93	1300	debito
1510	Tapia	2	2023-11-16	3000	bencina_97	1400	debito
1511	Tapia	2	2023-11-16	3000	bencina_97	1400	debito
1512	Tapia	2	2023-11-16	20000	bencina_97	1400	debito
1513	Tapia	2	2023-11-16	17000	bencina_93	1300	debito
1514	Tapia	2	2023-11-16	4000	bencina_97	1400	debito
1515	Tapia	2	2023-11-16	12000	bencina_97	1400	debito
1516	Tapia	2	2023-11-16	18000	bencina_95	1350	debito
1517	Tapia	2	2023-11-16	1000	bencina_95	1350	debito
1518	Tapia	2	2023-11-16	2000	bencina_97	1400	debito
1519	Tapia	2	2023-11-16	14000	bencina_97	1400	debito
1520	Tapia	2	2023-11-16	19000	bencina_95	1350	debito
1521	Tapia	2	2023-11-16	10000	kerosene	1100	debito
1522	Tapia	2	2023-11-16	4000	bencina_93	1300	debito
1523	Tapia	2	2023-11-16	15000	bencina_97	1400	debito
1524	Tapia	2	2023-11-16	9000	kerosene	1100	debito
1525	Tapia	2	2023-11-16	7000	bencina_97	1400	debito
1526	Tapia	2	2023-11-16	12000	kerosene	1100	debito
1527	Tapia	2	2023-11-16	8000	bencina_97	1400	debito
1528	Tapia	2	2023-11-16	3000	kerosene	1100	debito
1529	Tapia	2	2023-11-16	17000	bencina_95	1350	debito
1530	Tapia	2	2023-11-16	6000	bencina_97	1400	debito
1531	Tapia	2	2023-11-16	16000	bencina_97	1400	debito
1532	Tapia	2	2023-11-16	4000	bencina_95	1350	debito
1533	Tapia	2	2023-11-16	12000	bencina_97	1400	debito
1534	Tapia	2	2023-11-16	16000	bencina_95	1350	debito
1535	Tapia	2	2023-11-16	6000	kerosene	1100	debito
1536	Tapia	2	2023-11-16	20000	bencina_93	1300	debito
1537	Tapia	2	2023-11-16	2000	bencina_97	1400	debito
1538	Tapia	2	2023-11-16	18000	bencina_93	1300	debito
1539	Tapia	2	2023-11-16	17000	bencina_95	1350	debito
1540	Tapia	2	2023-11-16	9000	bencina_95	1350	debito
1541	Tapia	2	2023-11-16	7000	kerosene	1100	debito
1542	Tapia	2	2023-11-16	14000	bencina_95	1350	debito
1543	Tapia	2	2023-11-16	16000	bencina_97	1400	debito
1544	Tapia	2	2023-11-16	3000	bencina_95	1350	debito
1545	Tapia	2	2023-11-16	4000	kerosene	1100	debito
1546	Tapia	2	2023-11-16	17000	bencina_97	1400	debito
1547	Tapia	2	2023-11-16	16000	bencina_95	1350	debito
1548	Tapia	2	2023-11-16	16000	bencina_93	1300	debito
1549	Tapia	2	2023-11-16	1000	bencina_97	1400	debito
1550	Tapia	2	2023-11-16	14000	bencina_95	1350	debito
1551	Tapia	2	2023-11-16	2000	bencina_97	1400	debito
1552	Tapia	2	2023-11-16	18000	bencina_93	1300	debito
1553	Tapia	2	2023-11-16	18000	bencina_95	1350	debito
1554	Tapia	2	2023-11-16	15000	bencina_93	1300	debito
1555	Tapia	2	2023-11-16	9000	bencina_95	1350	debito
1556	Tapia	2	2023-11-16	1000	bencina_95	1350	debito
1557	Tapia	2	2023-11-16	18000	kerosene	1100	debito
1558	Tapia	2	2023-11-16	11000	bencina_93	1300	debito
1559	Tapia	2	2023-11-16	18000	bencina_97	1400	debito
1560	Tapia	2	2023-11-16	12000	bencina_93	1300	debito
1561	Tapia	2	2023-11-16	18000	bencina_93	1300	debito
1562	Tapia	2	2023-11-16	9000	bencina_97	1400	debito
1563	Tapia	2	2023-11-16	6000	bencina_95	1350	debito
1564	Tapia	2	2023-11-16	10000	bencina_93	1300	debito
1565	Tapia	2	2023-11-16	4000	bencina_95	1350	debito
1566	Tapia	2	2023-11-16	13000	bencina_93	1300	debito
1567	Tapia	2	2023-11-16	12000	kerosene	1100	debito
1568	Tapia	2	2023-11-16	16000	bencina_95	1350	debito
1569	Tapia	2	2023-11-16	1000	bencina_97	1400	debito
1570	Tapia	2	2023-11-16	18000	kerosene	1100	debito
1571	Tapia	2	2023-11-16	14000	bencina_97	1400	debito
1572	Tapia	2	2023-11-16	15000	bencina_95	1350	debito
1573	Tapia	2	2023-11-16	8000	bencina_97	1400	debito
1574	Tapia	2	2023-11-16	16000	bencina_95	1350	debito
1575	Tapia	2	2023-11-16	6000	bencina_93	1300	debito
1576	Tapia	2	2023-11-16	13000	bencina_97	1400	debito
1577	Tapia	2	2023-11-16	1000	bencina_93	1300	debito
1578	Tapia	2	2023-11-16	9000	bencina_97	1400	debito
1579	Tapia	2	2023-11-16	1000	bencina_97	1400	debito
1580	Tapia	2	2023-11-16	15000	kerosene	1100	debito
1581	Tapia	2	2023-11-16	5000	bencina_97	1400	debito
1582	Tapia	2	2023-11-16	13000	bencina_95	1350	debito
1583	Tapia	2	2023-11-16	8000	bencina_95	1350	debito
1584	Tapia	2	2023-11-16	20000	bencina_93	1300	debito
1585	Tapia	2	2023-11-16	10000	bencina_95	1350	debito
1586	Tapia	2	2023-11-16	13000	bencina_95	1350	debito
1587	Tapia	2	2023-11-16	1000	bencina_93	1300	debito
1588	Tapia	2	2023-11-16	17000	bencina_95	1350	debito
1589	Tapia	2	2023-11-16	13000	kerosene	1100	debito
1590	Tapia	2	2023-11-16	9000	bencina_95	1350	debito
1591	Tapia	2	2023-11-16	20000	bencina_93	1300	debito
1592	Tapia	2	2023-11-16	6000	kerosene	1100	debito
1593	Tapia	2	2023-11-16	15000	bencina_93	1300	debito
1594	Tapia	2	2023-11-16	20000	bencina_97	1400	debito
1595	Tapia	2	2023-11-16	17000	bencina_95	1350	debito
1596	Tapia	2	2023-11-16	15000	kerosene	1100	debito
1597	Tapia	2	2023-11-16	8000	bencina_95	1350	debito
1598	Tapia	2	2023-11-16	8000	bencina_93	1300	debito
1599	Tapia	2	2023-11-16	19000	bencina_97	1400	debito
1600	Tapia	2	2023-11-16	14000	bencina_95	1350	debito
1601	Tapia	2	2023-11-16	19000	bencina_95	1350	debito
1602	Victor	3	2023-11-16	19000	bencina_93	1300	debito
1603	Victor	3	2023-11-16	11000	bencina_95	1350	debito
1604	Victor	3	2023-11-16	13000	kerosene	1100	debito
1605	Victor	3	2023-11-16	13000	kerosene	1100	debito
1606	Victor	3	2023-11-16	12000	bencina_95	1350	debito
1607	Victor	3	2023-11-16	12000	kerosene	1100	debito
1608	Victor	3	2023-11-16	12000	bencina_93	1300	debito
1609	Victor	3	2023-11-16	17000	bencina_95	1350	debito
1610	Victor	3	2023-11-16	7000	bencina_93	1300	debito
1611	Victor	3	2023-11-16	18000	kerosene	1100	debito
1612	Victor	3	2023-11-16	15000	bencina_97	1400	debito
1613	Victor	3	2023-11-16	13000	bencina_97	1400	debito
1614	Victor	3	2023-11-16	20000	kerosene	1100	debito
1615	Victor	3	2023-11-16	7000	bencina_93	1300	debito
1616	Victor	3	2023-11-16	16000	kerosene	1100	debito
1617	Victor	3	2023-11-16	12000	bencina_95	1350	debito
1618	Victor	3	2023-11-16	17000	bencina_95	1350	debito
1619	Victor	3	2023-11-16	4000	bencina_93	1300	debito
1620	Victor	3	2023-11-16	10000	bencina_95	1350	debito
1621	Victor	3	2023-11-16	14000	kerosene	1100	debito
1622	Victor	3	2023-11-16	14000	bencina_93	1300	debito
1623	Victor	3	2023-11-16	17000	bencina_95	1350	debito
1624	Victor	3	2023-11-16	8000	kerosene	1100	debito
1625	Victor	3	2023-11-16	15000	kerosene	1100	debito
1626	Victor	3	2023-11-16	17000	bencina_97	1400	debito
1627	Victor	3	2023-11-16	10000	bencina_95	1350	debito
1628	Victor	3	2023-11-16	8000	bencina_97	1400	debito
1629	Victor	3	2023-11-16	20000	kerosene	1100	debito
1630	Victor	3	2023-11-16	16000	bencina_95	1350	debito
1631	Victor	3	2023-11-16	17000	bencina_93	1300	debito
1632	Victor	3	2023-11-16	16000	bencina_95	1350	debito
1633	Victor	3	2023-11-16	12000	bencina_93	1300	debito
1634	Victor	3	2023-11-16	4000	kerosene	1100	debito
1635	Victor	3	2023-11-16	2000	kerosene	1100	debito
1636	Victor	3	2023-11-16	18000	bencina_97	1400	debito
1637	Victor	3	2023-11-16	17000	bencina_97	1400	debito
1638	Victor	3	2023-11-16	13000	kerosene	1100	debito
1639	Victor	3	2023-11-16	3000	bencina_95	1350	debito
1640	Victor	3	2023-11-16	13000	bencina_95	1350	debito
1641	Victor	3	2023-11-16	7000	bencina_97	1400	debito
1642	Victor	3	2023-11-16	8000	bencina_93	1300	debito
1643	Victor	3	2023-11-16	3000	kerosene	1100	debito
1644	Victor	3	2023-11-16	8000	bencina_93	1300	debito
1645	Victor	3	2023-11-16	19000	bencina_97	1400	debito
1646	Victor	3	2023-11-16	6000	bencina_97	1400	debito
1647	Victor	3	2023-11-16	9000	kerosene	1100	debito
1648	Victor	3	2023-11-16	19000	bencina_95	1350	debito
1649	Victor	3	2023-11-16	5000	kerosene	1100	debito
1650	Victor	3	2023-11-16	10000	kerosene	1100	debito
1651	Victor	3	2023-11-16	19000	kerosene	1100	debito
1652	Victor	3	2023-11-16	17000	bencina_97	1400	debito
1653	Victor	3	2023-11-16	12000	kerosene	1100	debito
1654	Victor	3	2023-11-16	13000	bencina_93	1300	debito
1655	Victor	3	2023-11-16	12000	kerosene	1100	debito
1656	Victor	3	2023-11-16	8000	bencina_97	1400	debito
1657	Victor	3	2023-11-16	1000	bencina_93	1300	debito
1658	Victor	3	2023-11-16	17000	kerosene	1100	debito
1659	Victor	3	2023-11-16	9000	kerosene	1100	debito
1660	Victor	3	2023-11-16	2000	bencina_97	1400	debito
1661	Victor	3	2023-11-16	15000	kerosene	1100	debito
1662	Victor	3	2023-11-16	19000	kerosene	1100	debito
1663	Victor	3	2023-11-16	9000	bencina_93	1300	debito
1664	Victor	3	2023-11-16	9000	kerosene	1100	debito
1665	Victor	3	2023-11-16	1000	bencina_95	1350	debito
1666	Victor	3	2023-11-16	5000	bencina_93	1300	debito
1667	Victor	3	2023-11-16	4000	bencina_95	1350	debito
1668	Victor	3	2023-11-16	2000	bencina_95	1350	debito
1669	Victor	3	2023-11-16	6000	bencina_97	1400	debito
1670	Victor	3	2023-11-16	2000	bencina_95	1350	debito
1671	Victor	3	2023-11-16	15000	kerosene	1100	debito
1672	Victor	3	2023-11-16	7000	bencina_95	1350	debito
1673	Victor	3	2023-11-16	10000	bencina_95	1350	debito
1674	Victor	3	2023-11-16	16000	bencina_93	1300	debito
1675	Victor	3	2023-11-16	4000	kerosene	1100	debito
1676	Victor	3	2023-11-16	18000	kerosene	1100	debito
1677	Victor	3	2023-11-16	16000	bencina_93	1300	debito
1678	Victor	3	2023-11-16	12000	bencina_95	1350	debito
1679	Victor	3	2023-11-16	20000	bencina_95	1350	debito
1680	Victor	3	2023-11-16	7000	bencina_95	1350	debito
1681	Victor	3	2023-11-16	5000	kerosene	1100	debito
1682	Victor	3	2023-11-16	11000	bencina_97	1400	debito
1683	Victor	3	2023-11-16	18000	kerosene	1100	debito
1684	Victor	3	2023-11-16	2000	bencina_97	1400	debito
1685	Victor	3	2023-11-16	7000	bencina_93	1300	debito
1686	Victor	3	2023-11-16	18000	kerosene	1100	debito
1687	Victor	3	2023-11-16	8000	bencina_97	1400	debito
1688	Victor	3	2023-11-16	13000	bencina_97	1400	debito
1689	Victor	3	2023-11-16	15000	bencina_93	1300	debito
1690	Victor	3	2023-11-16	15000	kerosene	1100	debito
1691	Victor	3	2023-11-16	10000	bencina_95	1350	debito
1692	Victor	3	2023-11-16	4000	kerosene	1100	debito
1693	Victor	3	2023-11-16	17000	bencina_97	1400	debito
1694	Victor	3	2023-11-16	13000	bencina_97	1400	debito
1695	Victor	3	2023-11-16	9000	bencina_95	1350	debito
1696	Victor	3	2023-11-16	17000	bencina_93	1300	debito
1697	Victor	3	2023-11-16	9000	kerosene	1100	debito
1698	Victor	3	2023-11-16	13000	kerosene	1100	debito
1699	Victor	3	2023-11-16	17000	kerosene	1100	debito
1700	Victor	3	2023-11-16	12000	bencina_95	1350	debito
1701	Victor	3	2023-11-16	18000	bencina_95	1350	debito
1702	Yorman	1	2023-11-15	1000	kerosene	1100	debito
1703	Yorman	1	2023-11-15	17000	bencina_93	1300	debito
1704	Yorman	1	2023-11-15	6000	kerosene	1100	debito
1705	Yorman	1	2023-11-15	14000	bencina_95	1350	debito
1706	Yorman	1	2023-11-15	12000	bencina_93	1300	debito
1707	Yorman	1	2023-11-15	15000	bencina_97	1400	debito
1708	Yorman	1	2023-11-15	9000	bencina_95	1350	debito
1709	Yorman	1	2023-11-15	1000	kerosene	1100	debito
1710	Yorman	1	2023-11-15	1000	bencina_93	1300	debito
1711	Yorman	1	2023-11-15	4000	bencina_95	1350	debito
1712	Yorman	1	2023-11-15	11000	bencina_95	1350	debito
1713	Yorman	1	2023-11-15	15000	kerosene	1100	debito
1714	Yorman	1	2023-11-15	20000	kerosene	1100	debito
1715	Yorman	1	2023-11-15	3000	bencina_95	1350	debito
1716	Yorman	1	2023-11-15	1000	bencina_97	1400	debito
1717	Yorman	1	2023-11-15	18000	kerosene	1100	debito
1718	Yorman	1	2023-11-15	15000	bencina_95	1350	debito
1719	Yorman	1	2023-11-15	1000	bencina_93	1300	debito
1720	Yorman	1	2023-11-15	1000	bencina_95	1350	debito
1721	Yorman	1	2023-11-15	11000	bencina_95	1350	debito
1722	Yorman	1	2023-11-15	5000	bencina_93	1300	debito
1723	Yorman	1	2023-11-15	19000	kerosene	1100	debito
1724	Yorman	1	2023-11-15	19000	kerosene	1100	debito
1725	Yorman	1	2023-11-15	13000	kerosene	1100	debito
1726	Yorman	1	2023-11-15	7000	kerosene	1100	debito
1727	Yorman	1	2023-11-15	13000	bencina_97	1400	debito
1728	Yorman	1	2023-11-15	20000	bencina_95	1350	debito
1729	Yorman	1	2023-11-15	2000	bencina_95	1350	debito
1730	Yorman	1	2023-11-15	5000	bencina_97	1400	debito
1731	Yorman	1	2023-11-15	15000	bencina_93	1300	debito
1732	Yorman	1	2023-11-15	11000	kerosene	1100	debito
1733	Yorman	1	2023-11-15	5000	bencina_97	1400	debito
1734	Yorman	1	2023-11-15	14000	bencina_97	1400	debito
1735	Yorman	1	2023-11-15	9000	kerosene	1100	debito
1736	Yorman	1	2023-11-15	19000	kerosene	1100	debito
1737	Yorman	1	2023-11-15	12000	kerosene	1100	debito
1738	Yorman	1	2023-11-15	17000	bencina_95	1350	debito
1739	Yorman	1	2023-11-15	7000	bencina_95	1350	debito
1740	Yorman	1	2023-11-15	11000	bencina_93	1300	debito
1741	Yorman	1	2023-11-15	20000	bencina_93	1300	debito
1742	Yorman	1	2023-11-15	19000	bencina_97	1400	debito
1743	Yorman	1	2023-11-15	6000	bencina_93	1300	debito
1744	Yorman	1	2023-11-15	14000	kerosene	1100	debito
1745	Yorman	1	2023-11-15	13000	bencina_97	1400	debito
1746	Yorman	1	2023-11-15	14000	bencina_97	1400	debito
1747	Yorman	1	2023-11-15	6000	kerosene	1100	debito
1748	Yorman	1	2023-11-15	10000	kerosene	1100	debito
1749	Yorman	1	2023-11-15	1000	kerosene	1100	debito
1750	Yorman	1	2023-11-15	15000	bencina_93	1300	debito
1751	Yorman	1	2023-11-15	3000	bencina_97	1400	debito
1752	Yorman	1	2023-11-15	15000	bencina_97	1400	debito
1753	Yorman	1	2023-11-15	11000	bencina_95	1350	debito
1754	Yorman	1	2023-11-15	11000	bencina_93	1300	debito
1755	Yorman	1	2023-11-15	3000	bencina_97	1400	debito
1756	Yorman	1	2023-11-15	18000	bencina_97	1400	debito
1757	Yorman	1	2023-11-15	1000	bencina_93	1300	debito
1758	Yorman	1	2023-11-15	15000	bencina_93	1300	debito
1759	Yorman	1	2023-11-15	17000	kerosene	1100	debito
1760	Yorman	1	2023-11-15	1000	bencina_93	1300	debito
1761	Yorman	1	2023-11-15	19000	kerosene	1100	debito
1762	Yorman	1	2023-11-15	5000	bencina_93	1300	debito
1763	Yorman	1	2023-11-15	4000	kerosene	1100	debito
1764	Yorman	1	2023-11-15	1000	bencina_97	1400	debito
1765	Yorman	1	2023-11-15	4000	bencina_97	1400	debito
1766	Yorman	1	2023-11-15	7000	kerosene	1100	debito
1767	Yorman	1	2023-11-15	3000	bencina_95	1350	debito
1768	Yorman	1	2023-11-15	13000	bencina_97	1400	debito
1769	Yorman	1	2023-11-15	12000	bencina_95	1350	debito
1770	Yorman	1	2023-11-15	7000	kerosene	1100	debito
1771	Yorman	1	2023-11-15	2000	bencina_93	1300	debito
1772	Yorman	1	2023-11-15	7000	bencina_97	1400	debito
1773	Yorman	1	2023-11-15	20000	kerosene	1100	debito
1774	Yorman	1	2023-11-15	3000	bencina_93	1300	debito
1775	Yorman	1	2023-11-15	4000	bencina_95	1350	debito
1776	Yorman	1	2023-11-15	15000	bencina_95	1350	debito
1777	Yorman	1	2023-11-15	19000	bencina_95	1350	debito
1778	Yorman	1	2023-11-15	8000	kerosene	1100	debito
1779	Yorman	1	2023-11-15	10000	bencina_97	1400	debito
1780	Yorman	1	2023-11-15	17000	kerosene	1100	debito
1781	Yorman	1	2023-11-15	11000	kerosene	1100	debito
1782	Yorman	1	2023-11-15	16000	bencina_95	1350	debito
1783	Yorman	1	2023-11-15	18000	kerosene	1100	debito
1784	Yorman	1	2023-11-15	20000	bencina_97	1400	debito
1785	Yorman	1	2023-11-15	18000	bencina_97	1400	debito
1786	Yorman	1	2023-11-15	17000	bencina_97	1400	debito
1787	Yorman	1	2023-11-15	16000	bencina_97	1400	debito
1788	Yorman	1	2023-11-15	5000	kerosene	1100	debito
1789	Yorman	1	2023-11-15	8000	kerosene	1100	debito
1790	Yorman	1	2023-11-15	4000	bencina_95	1350	debito
1791	Yorman	1	2023-11-15	7000	bencina_97	1400	debito
1792	Yorman	1	2023-11-15	9000	kerosene	1100	debito
1793	Yorman	1	2023-11-15	19000	kerosene	1100	debito
1794	Yorman	1	2023-11-15	5000	kerosene	1100	debito
1795	Yorman	1	2023-11-15	19000	bencina_95	1350	debito
1796	Yorman	1	2023-11-15	11000	kerosene	1100	debito
1797	Yorman	1	2023-11-15	18000	bencina_95	1350	debito
1798	Yorman	1	2023-11-15	9000	bencina_95	1350	debito
1799	Yorman	1	2023-11-15	20000	bencina_97	1400	debito
1800	Yorman	1	2023-11-15	15000	bencina_95	1350	debito
1801	Yorman	1	2023-11-15	4000	kerosene	1100	debito
1802	Edward	2	2023-11-15	13000	bencina_97	1400	debito
1803	Edward	2	2023-11-15	7000	bencina_95	1350	debito
1804	Edward	2	2023-11-15	18000	bencina_93	1300	debito
1805	Edward	2	2023-11-15	9000	kerosene	1100	debito
1806	Edward	2	2023-11-15	9000	kerosene	1100	debito
1807	Edward	2	2023-11-15	12000	bencina_93	1300	debito
1808	Edward	2	2023-11-15	11000	bencina_95	1350	debito
1809	Edward	2	2023-11-15	5000	bencina_97	1400	debito
1810	Edward	2	2023-11-15	19000	kerosene	1100	debito
1811	Edward	2	2023-11-15	13000	bencina_95	1350	debito
1812	Edward	2	2023-11-15	11000	bencina_97	1400	debito
1813	Edward	2	2023-11-15	10000	bencina_93	1300	debito
1814	Edward	2	2023-11-15	12000	bencina_95	1350	debito
1815	Edward	2	2023-11-15	19000	bencina_93	1300	debito
1816	Edward	2	2023-11-15	16000	bencina_97	1400	debito
1817	Edward	2	2023-11-15	16000	bencina_95	1350	debito
1818	Edward	2	2023-11-15	10000	kerosene	1100	debito
1819	Edward	2	2023-11-15	9000	bencina_95	1350	debito
1820	Edward	2	2023-11-15	15000	kerosene	1100	debito
1821	Edward	2	2023-11-15	9000	kerosene	1100	debito
1822	Edward	2	2023-11-15	9000	bencina_97	1400	debito
1823	Edward	2	2023-11-15	8000	bencina_97	1400	debito
1824	Edward	2	2023-11-15	19000	bencina_97	1400	debito
1825	Edward	2	2023-11-15	1000	bencina_95	1350	debito
1826	Edward	2	2023-11-15	19000	kerosene	1100	debito
1827	Edward	2	2023-11-15	9000	bencina_93	1300	debito
1828	Edward	2	2023-11-15	19000	bencina_97	1400	debito
1829	Edward	2	2023-11-15	5000	bencina_93	1300	debito
1830	Edward	2	2023-11-15	13000	bencina_93	1300	debito
1831	Edward	2	2023-11-15	1000	bencina_97	1400	debito
1832	Edward	2	2023-11-15	19000	kerosene	1100	debito
1833	Edward	2	2023-11-15	18000	kerosene	1100	debito
1834	Edward	2	2023-11-15	18000	bencina_95	1350	debito
1835	Edward	2	2023-11-15	20000	bencina_95	1350	debito
1836	Edward	2	2023-11-15	7000	bencina_93	1300	debito
1837	Edward	2	2023-11-15	19000	kerosene	1100	debito
1838	Edward	2	2023-11-15	13000	bencina_97	1400	debito
1839	Edward	2	2023-11-15	3000	bencina_95	1350	debito
1840	Edward	2	2023-11-15	5000	bencina_93	1300	debito
1841	Edward	2	2023-11-15	3000	bencina_93	1300	debito
1842	Edward	2	2023-11-15	11000	kerosene	1100	debito
1843	Edward	2	2023-11-15	19000	bencina_97	1400	debito
1844	Edward	2	2023-11-15	3000	bencina_97	1400	debito
1845	Edward	2	2023-11-15	14000	kerosene	1100	debito
1846	Edward	2	2023-11-15	9000	bencina_93	1300	debito
1847	Edward	2	2023-11-15	4000	kerosene	1100	debito
1848	Edward	2	2023-11-15	15000	kerosene	1100	debito
1849	Edward	2	2023-11-15	20000	bencina_93	1300	debito
1850	Edward	2	2023-11-15	19000	bencina_93	1300	debito
1851	Edward	2	2023-11-15	8000	bencina_97	1400	debito
1852	Edward	2	2023-11-15	6000	bencina_97	1400	debito
1853	Edward	2	2023-11-15	1000	bencina_95	1350	debito
1854	Edward	2	2023-11-15	15000	bencina_97	1400	debito
1855	Edward	2	2023-11-15	18000	kerosene	1100	debito
1856	Edward	2	2023-11-15	11000	kerosene	1100	debito
1857	Edward	2	2023-11-15	15000	bencina_93	1300	debito
1858	Edward	2	2023-11-15	17000	kerosene	1100	debito
1859	Edward	2	2023-11-15	4000	bencina_95	1350	debito
1860	Edward	2	2023-11-15	3000	bencina_95	1350	debito
1861	Edward	2	2023-11-15	17000	bencina_95	1350	debito
1862	Edward	2	2023-11-15	10000	bencina_97	1400	debito
1863	Edward	2	2023-11-15	19000	kerosene	1100	debito
1864	Edward	2	2023-11-15	4000	bencina_97	1400	debito
1865	Edward	2	2023-11-15	12000	bencina_97	1400	debito
1866	Edward	2	2023-11-15	13000	kerosene	1100	debito
1867	Edward	2	2023-11-15	7000	kerosene	1100	debito
1868	Edward	2	2023-11-15	19000	bencina_95	1350	debito
1869	Edward	2	2023-11-15	20000	bencina_93	1300	debito
1870	Edward	2	2023-11-15	10000	bencina_93	1300	debito
1871	Edward	2	2023-11-15	10000	kerosene	1100	debito
1872	Edward	2	2023-11-15	2000	bencina_93	1300	debito
1873	Edward	2	2023-11-15	18000	bencina_95	1350	debito
1874	Edward	2	2023-11-15	3000	bencina_97	1400	debito
1875	Edward	2	2023-11-15	7000	bencina_95	1350	debito
1876	Edward	2	2023-11-15	3000	bencina_97	1400	debito
1877	Edward	2	2023-11-15	13000	bencina_95	1350	debito
1878	Edward	2	2023-11-15	14000	bencina_95	1350	debito
1879	Edward	2	2023-11-15	16000	kerosene	1100	debito
1880	Edward	2	2023-11-15	19000	bencina_95	1350	debito
1881	Edward	2	2023-11-15	8000	bencina_93	1300	debito
1882	Edward	2	2023-11-15	19000	kerosene	1100	debito
1883	Edward	2	2023-11-15	9000	kerosene	1100	debito
1884	Edward	2	2023-11-15	16000	bencina_95	1350	debito
1885	Edward	2	2023-11-15	1000	bencina_93	1300	debito
1886	Edward	2	2023-11-15	14000	kerosene	1100	debito
1887	Edward	2	2023-11-15	10000	bencina_97	1400	debito
1888	Edward	2	2023-11-15	19000	bencina_93	1300	debito
1889	Edward	2	2023-11-15	5000	bencina_95	1350	debito
1890	Edward	2	2023-11-15	1000	kerosene	1100	debito
1891	Edward	2	2023-11-15	20000	kerosene	1100	debito
1892	Edward	2	2023-11-15	2000	bencina_95	1350	debito
1893	Edward	2	2023-11-15	2000	bencina_95	1350	debito
1894	Edward	2	2023-11-15	10000	bencina_93	1300	debito
1895	Edward	2	2023-11-15	6000	bencina_93	1300	debito
1896	Edward	2	2023-11-15	13000	bencina_95	1350	debito
1897	Edward	2	2023-11-15	11000	kerosene	1100	debito
1898	Edward	2	2023-11-15	4000	bencina_97	1400	debito
1899	Edward	2	2023-11-15	10000	kerosene	1100	debito
1900	Edward	2	2023-11-15	3000	bencina_97	1400	debito
1901	Edward	2	2023-11-15	13000	bencina_93	1300	debito
1902	Gerardo	3	2023-11-15	20000	kerosene	1100	debito
1903	Gerardo	3	2023-11-15	15000	bencina_97	1400	debito
1904	Gerardo	3	2023-11-15	12000	kerosene	1100	debito
1905	Gerardo	3	2023-11-15	12000	kerosene	1100	debito
1906	Gerardo	3	2023-11-15	13000	bencina_95	1350	debito
1907	Gerardo	3	2023-11-15	3000	bencina_93	1300	debito
1908	Gerardo	3	2023-11-15	12000	bencina_97	1400	debito
1909	Gerardo	3	2023-11-15	14000	kerosene	1100	debito
1910	Gerardo	3	2023-11-15	17000	bencina_97	1400	debito
1911	Gerardo	3	2023-11-15	19000	bencina_93	1300	debito
1912	Gerardo	3	2023-11-15	14000	bencina_95	1350	debito
1913	Gerardo	3	2023-11-15	11000	bencina_97	1400	debito
1914	Gerardo	3	2023-11-15	13000	bencina_93	1300	debito
1915	Gerardo	3	2023-11-15	1000	kerosene	1100	debito
1916	Gerardo	3	2023-11-15	17000	bencina_93	1300	debito
1917	Gerardo	3	2023-11-15	10000	kerosene	1100	debito
1918	Gerardo	3	2023-11-15	14000	bencina_97	1400	debito
1919	Gerardo	3	2023-11-15	6000	bencina_93	1300	debito
1920	Gerardo	3	2023-11-15	10000	bencina_97	1400	debito
1921	Gerardo	3	2023-11-15	18000	bencina_97	1400	debito
1922	Gerardo	3	2023-11-15	4000	bencina_95	1350	debito
1923	Gerardo	3	2023-11-15	6000	bencina_97	1400	debito
1924	Gerardo	3	2023-11-15	14000	bencina_93	1300	debito
1925	Gerardo	3	2023-11-15	10000	bencina_97	1400	debito
1926	Gerardo	3	2023-11-15	6000	kerosene	1100	debito
1927	Gerardo	3	2023-11-15	14000	bencina_95	1350	debito
1928	Gerardo	3	2023-11-15	20000	bencina_97	1400	debito
1929	Gerardo	3	2023-11-15	11000	kerosene	1100	debito
1930	Gerardo	3	2023-11-15	16000	bencina_93	1300	debito
1931	Gerardo	3	2023-11-15	14000	kerosene	1100	debito
1932	Gerardo	3	2023-11-15	2000	bencina_97	1400	debito
1933	Gerardo	3	2023-11-15	20000	bencina_95	1350	debito
1934	Gerardo	3	2023-11-15	6000	bencina_95	1350	debito
1935	Gerardo	3	2023-11-15	9000	bencina_93	1300	debito
1936	Gerardo	3	2023-11-15	15000	bencina_93	1300	debito
1937	Gerardo	3	2023-11-15	4000	bencina_97	1400	debito
1938	Gerardo	3	2023-11-15	6000	kerosene	1100	debito
1939	Gerardo	3	2023-11-15	10000	bencina_93	1300	debito
1940	Gerardo	3	2023-11-15	6000	bencina_95	1350	debito
1941	Gerardo	3	2023-11-15	8000	bencina_93	1300	debito
1942	Gerardo	3	2023-11-15	18000	kerosene	1100	debito
1943	Gerardo	3	2023-11-15	6000	bencina_95	1350	debito
1944	Gerardo	3	2023-11-15	5000	bencina_95	1350	debito
1945	Gerardo	3	2023-11-15	4000	bencina_97	1400	debito
1946	Gerardo	3	2023-11-15	8000	bencina_93	1300	debito
1947	Gerardo	3	2023-11-15	10000	bencina_95	1350	debito
1948	Gerardo	3	2023-11-15	5000	bencina_93	1300	debito
1949	Gerardo	3	2023-11-15	14000	bencina_95	1350	debito
1950	Gerardo	3	2023-11-15	15000	bencina_97	1400	debito
1951	Gerardo	3	2023-11-15	7000	bencina_97	1400	debito
1952	Gerardo	3	2023-11-15	14000	kerosene	1100	debito
1953	Gerardo	3	2023-11-15	4000	bencina_97	1400	debito
1954	Gerardo	3	2023-11-15	15000	bencina_95	1350	debito
1955	Gerardo	3	2023-11-15	4000	bencina_95	1350	debito
1956	Gerardo	3	2023-11-15	20000	kerosene	1100	debito
1957	Gerardo	3	2023-11-15	12000	bencina_97	1400	debito
1958	Gerardo	3	2023-11-15	16000	bencina_93	1300	debito
1959	Gerardo	3	2023-11-15	9000	bencina_97	1400	debito
1960	Gerardo	3	2023-11-15	16000	kerosene	1100	debito
1961	Gerardo	3	2023-11-15	3000	kerosene	1100	debito
1962	Gerardo	3	2023-11-15	2000	bencina_95	1350	debito
1963	Gerardo	3	2023-11-15	8000	kerosene	1100	debito
1964	Gerardo	3	2023-11-15	19000	bencina_95	1350	debito
1965	Gerardo	3	2023-11-15	6000	kerosene	1100	debito
1966	Gerardo	3	2023-11-15	9000	bencina_97	1400	debito
1967	Gerardo	3	2023-11-15	3000	bencina_97	1400	debito
1968	Gerardo	3	2023-11-15	13000	kerosene	1100	debito
1969	Gerardo	3	2023-11-15	14000	kerosene	1100	debito
1970	Gerardo	3	2023-11-15	12000	bencina_97	1400	debito
1971	Gerardo	3	2023-11-15	19000	bencina_95	1350	debito
1972	Gerardo	3	2023-11-15	5000	bencina_93	1300	debito
1973	Gerardo	3	2023-11-15	7000	bencina_95	1350	debito
1974	Gerardo	3	2023-11-15	16000	bencina_93	1300	debito
1975	Gerardo	3	2023-11-15	19000	bencina_97	1400	debito
1976	Gerardo	3	2023-11-15	7000	bencina_93	1300	debito
1977	Gerardo	3	2023-11-15	12000	kerosene	1100	debito
1978	Gerardo	3	2023-11-15	4000	bencina_97	1400	debito
1979	Gerardo	3	2023-11-15	9000	bencina_97	1400	debito
1980	Gerardo	3	2023-11-15	18000	bencina_97	1400	debito
1981	Gerardo	3	2023-11-15	4000	kerosene	1100	debito
1982	Gerardo	3	2023-11-15	7000	bencina_97	1400	debito
1983	Gerardo	3	2023-11-15	6000	bencina_97	1400	debito
1984	Gerardo	3	2023-11-15	6000	bencina_93	1300	debito
1985	Gerardo	3	2023-11-15	11000	bencina_95	1350	debito
1986	Gerardo	3	2023-11-15	10000	bencina_93	1300	debito
1987	Gerardo	3	2023-11-15	13000	kerosene	1100	debito
1988	Gerardo	3	2023-11-15	2000	bencina_93	1300	debito
1989	Gerardo	3	2023-11-15	18000	bencina_97	1400	debito
1990	Gerardo	3	2023-11-15	16000	bencina_97	1400	debito
1991	Gerardo	3	2023-11-15	18000	bencina_95	1350	debito
1992	Gerardo	3	2023-11-15	19000	bencina_93	1300	debito
1993	Gerardo	3	2023-11-15	6000	bencina_93	1300	debito
1994	Gerardo	3	2023-11-15	13000	bencina_93	1300	debito
1995	Gerardo	3	2023-11-15	18000	kerosene	1100	debito
1996	Gerardo	3	2023-11-15	2000	bencina_95	1350	debito
1997	Gerardo	3	2023-11-15	6000	bencina_97	1400	debito
1998	Gerardo	3	2023-11-15	20000	kerosene	1100	debito
1999	Gerardo	3	2023-11-15	14000	bencina_95	1350	debito
2000	Gerardo	3	2023-11-15	6000	kerosene	1100	debito
2001	Gerardo	3	2023-11-15	12000	kerosene	1100	debito
2002	Jhorman	1	2023-11-14	12000	bencina_93	1300	debito
2003	Jhorman	1	2023-11-14	12000	bencina_95	1350	debito
2004	Jhorman	1	2023-11-14	5000	bencina_93	1300	debito
2005	Jhorman	1	2023-11-14	13000	bencina_93	1300	debito
2006	Jhorman	1	2023-11-14	9000	bencina_95	1350	debito
2007	Jhorman	1	2023-11-14	10000	bencina_97	1400	debito
2008	Jhorman	1	2023-11-14	1000	bencina_93	1300	debito
2009	Jhorman	1	2023-11-14	16000	bencina_95	1350	debito
2010	Jhorman	1	2023-11-14	3000	bencina_95	1350	debito
2011	Jhorman	1	2023-11-14	12000	bencina_95	1350	debito
2012	Jhorman	1	2023-11-14	5000	bencina_93	1300	debito
2013	Jhorman	1	2023-11-14	9000	bencina_95	1350	debito
2014	Jhorman	1	2023-11-14	4000	bencina_97	1400	debito
2015	Jhorman	1	2023-11-14	3000	bencina_93	1300	debito
2016	Jhorman	1	2023-11-14	16000	bencina_95	1350	debito
2017	Jhorman	1	2023-11-14	20000	bencina_95	1350	debito
2018	Jhorman	1	2023-11-14	2000	bencina_95	1350	debito
2019	Jhorman	1	2023-11-14	3000	bencina_97	1400	debito
2020	Jhorman	1	2023-11-14	4000	bencina_97	1400	debito
2021	Jhorman	1	2023-11-14	13000	bencina_97	1400	debito
2022	Jhorman	1	2023-11-14	10000	kerosene	1100	debito
2023	Jhorman	1	2023-11-14	11000	bencina_97	1400	debito
2024	Jhorman	1	2023-11-14	5000	bencina_95	1350	debito
2025	Jhorman	1	2023-11-14	1000	bencina_93	1300	debito
2026	Jhorman	1	2023-11-14	7000	bencina_95	1350	debito
2027	Jhorman	1	2023-11-14	4000	bencina_93	1300	debito
2028	Jhorman	1	2023-11-14	15000	bencina_97	1400	debito
2029	Jhorman	1	2023-11-14	4000	kerosene	1100	debito
2030	Jhorman	1	2023-11-14	16000	kerosene	1100	debito
2031	Jhorman	1	2023-11-14	1000	bencina_93	1300	debito
2032	Jhorman	1	2023-11-14	3000	kerosene	1100	debito
2033	Jhorman	1	2023-11-14	20000	bencina_95	1350	debito
2034	Jhorman	1	2023-11-14	1000	bencina_97	1400	debito
2035	Jhorman	1	2023-11-14	18000	bencina_93	1300	debito
2036	Jhorman	1	2023-11-14	10000	bencina_93	1300	debito
2037	Jhorman	1	2023-11-14	10000	bencina_97	1400	debito
2038	Jhorman	1	2023-11-14	11000	bencina_95	1350	debito
2039	Jhorman	1	2023-11-14	15000	bencina_95	1350	debito
2040	Jhorman	1	2023-11-14	4000	kerosene	1100	debito
2041	Jhorman	1	2023-11-14	20000	bencina_97	1400	debito
2042	Jhorman	1	2023-11-14	16000	bencina_97	1400	debito
2043	Jhorman	1	2023-11-14	7000	kerosene	1100	debito
2044	Jhorman	1	2023-11-14	2000	kerosene	1100	debito
2045	Jhorman	1	2023-11-14	2000	bencina_95	1350	debito
2046	Jhorman	1	2023-11-14	15000	bencina_95	1350	debito
2047	Jhorman	1	2023-11-14	4000	bencina_95	1350	debito
2048	Jhorman	1	2023-11-14	13000	bencina_93	1300	debito
2049	Jhorman	1	2023-11-14	17000	bencina_97	1400	debito
2050	Jhorman	1	2023-11-14	12000	bencina_97	1400	debito
2051	Jhorman	1	2023-11-14	13000	bencina_97	1400	debito
2052	Jhorman	1	2023-11-14	18000	bencina_97	1400	debito
2053	Jhorman	1	2023-11-14	11000	kerosene	1100	debito
2054	Jhorman	1	2023-11-14	2000	bencina_93	1300	debito
2055	Jhorman	1	2023-11-14	5000	bencina_95	1350	debito
2056	Jhorman	1	2023-11-14	6000	bencina_95	1350	debito
2057	Jhorman	1	2023-11-14	19000	kerosene	1100	debito
2058	Jhorman	1	2023-11-14	14000	bencina_95	1350	debito
2059	Jhorman	1	2023-11-14	17000	bencina_93	1300	debito
2060	Jhorman	1	2023-11-14	6000	kerosene	1100	debito
2061	Jhorman	1	2023-11-14	14000	bencina_97	1400	debito
2062	Jhorman	1	2023-11-14	20000	bencina_95	1350	debito
2063	Jhorman	1	2023-11-14	8000	bencina_95	1350	debito
2064	Jhorman	1	2023-11-14	2000	kerosene	1100	debito
2065	Jhorman	1	2023-11-14	11000	bencina_95	1350	debito
2066	Jhorman	1	2023-11-14	8000	bencina_93	1300	debito
2067	Jhorman	1	2023-11-14	18000	kerosene	1100	debito
2068	Jhorman	1	2023-11-14	2000	bencina_97	1400	debito
2069	Jhorman	1	2023-11-14	9000	kerosene	1100	debito
2070	Jhorman	1	2023-11-14	7000	bencina_95	1350	debito
2071	Jhorman	1	2023-11-14	9000	bencina_97	1400	debito
2072	Jhorman	1	2023-11-14	7000	bencina_93	1300	debito
2073	Jhorman	1	2023-11-14	15000	bencina_97	1400	debito
2074	Jhorman	1	2023-11-14	20000	bencina_97	1400	debito
2075	Jhorman	1	2023-11-14	7000	bencina_93	1300	debito
2076	Jhorman	1	2023-11-14	18000	bencina_93	1300	debito
2077	Jhorman	1	2023-11-14	4000	kerosene	1100	debito
2078	Jhorman	1	2023-11-14	5000	bencina_95	1350	debito
2079	Jhorman	1	2023-11-14	6000	bencina_97	1400	debito
2080	Jhorman	1	2023-11-14	18000	kerosene	1100	debito
2081	Jhorman	1	2023-11-14	9000	bencina_97	1400	debito
2082	Jhorman	1	2023-11-14	12000	kerosene	1100	debito
2083	Jhorman	1	2023-11-14	1000	bencina_97	1400	debito
2084	Jhorman	1	2023-11-14	2000	kerosene	1100	debito
2085	Jhorman	1	2023-11-14	18000	bencina_97	1400	debito
2086	Jhorman	1	2023-11-14	3000	bencina_93	1300	debito
2087	Jhorman	1	2023-11-14	6000	bencina_95	1350	debito
2088	Jhorman	1	2023-11-14	20000	kerosene	1100	debito
2089	Jhorman	1	2023-11-14	11000	kerosene	1100	debito
2090	Jhorman	1	2023-11-14	10000	bencina_95	1350	debito
2091	Jhorman	1	2023-11-14	20000	bencina_93	1300	debito
2092	Jhorman	1	2023-11-14	6000	bencina_93	1300	debito
2093	Jhorman	1	2023-11-14	13000	bencina_93	1300	debito
2094	Jhorman	1	2023-11-14	17000	bencina_95	1350	debito
2095	Jhorman	1	2023-11-14	11000	bencina_93	1300	debito
2096	Jhorman	1	2023-11-14	6000	bencina_93	1300	debito
2097	Jhorman	1	2023-11-14	18000	bencina_97	1400	debito
2098	Jhorman	1	2023-11-14	6000	kerosene	1100	debito
2099	Jhorman	1	2023-11-14	3000	kerosene	1100	debito
2100	Jhorman	1	2023-11-14	10000	kerosene	1100	debito
2101	Jhorman	1	2023-11-14	16000	kerosene	1100	debito
2102	Mendoza	2	2023-11-14	7000	bencina_93	1300	debito
2103	Mendoza	2	2023-11-14	19000	bencina_97	1400	debito
2104	Mendoza	2	2023-11-14	6000	bencina_93	1300	debito
2105	Mendoza	2	2023-11-14	5000	bencina_95	1350	debito
2106	Mendoza	2	2023-11-14	7000	kerosene	1100	debito
2107	Mendoza	2	2023-11-14	4000	bencina_97	1400	debito
2108	Mendoza	2	2023-11-14	2000	kerosene	1100	debito
2109	Mendoza	2	2023-11-14	12000	kerosene	1100	debito
2110	Mendoza	2	2023-11-14	12000	bencina_97	1400	debito
2111	Mendoza	2	2023-11-14	17000	bencina_95	1350	debito
2112	Mendoza	2	2023-11-14	15000	bencina_97	1400	debito
2113	Mendoza	2	2023-11-14	18000	bencina_93	1300	debito
2114	Mendoza	2	2023-11-14	11000	bencina_93	1300	debito
2115	Mendoza	2	2023-11-14	8000	bencina_95	1350	debito
2116	Mendoza	2	2023-11-14	6000	bencina_95	1350	debito
2117	Mendoza	2	2023-11-14	9000	bencina_97	1400	debito
2118	Mendoza	2	2023-11-14	10000	bencina_97	1400	debito
2119	Mendoza	2	2023-11-14	8000	kerosene	1100	debito
2120	Mendoza	2	2023-11-14	8000	bencina_93	1300	debito
2121	Mendoza	2	2023-11-14	12000	bencina_95	1350	debito
2122	Mendoza	2	2023-11-14	12000	bencina_93	1300	debito
2123	Mendoza	2	2023-11-14	1000	kerosene	1100	debito
2124	Mendoza	2	2023-11-14	7000	bencina_95	1350	debito
2125	Mendoza	2	2023-11-14	13000	bencina_95	1350	debito
2126	Mendoza	2	2023-11-14	19000	bencina_97	1400	debito
2127	Mendoza	2	2023-11-14	16000	bencina_95	1350	debito
2128	Mendoza	2	2023-11-14	1000	bencina_97	1400	debito
2129	Mendoza	2	2023-11-14	2000	kerosene	1100	debito
2130	Mendoza	2	2023-11-14	1000	bencina_93	1300	debito
2131	Mendoza	2	2023-11-14	20000	kerosene	1100	debito
2132	Mendoza	2	2023-11-14	18000	kerosene	1100	debito
2133	Mendoza	2	2023-11-14	19000	bencina_97	1400	debito
2134	Mendoza	2	2023-11-14	13000	kerosene	1100	debito
2135	Mendoza	2	2023-11-14	16000	bencina_95	1350	debito
2136	Mendoza	2	2023-11-14	1000	kerosene	1100	debito
2137	Mendoza	2	2023-11-14	15000	bencina_93	1300	debito
2138	Mendoza	2	2023-11-14	2000	bencina_97	1400	debito
2139	Mendoza	2	2023-11-14	13000	bencina_97	1400	debito
2140	Mendoza	2	2023-11-14	20000	bencina_93	1300	debito
2141	Mendoza	2	2023-11-14	12000	bencina_95	1350	debito
2142	Mendoza	2	2023-11-14	18000	bencina_95	1350	debito
2143	Mendoza	2	2023-11-14	15000	bencina_95	1350	debito
2144	Mendoza	2	2023-11-14	6000	bencina_93	1300	debito
2145	Mendoza	2	2023-11-14	18000	bencina_93	1300	debito
2146	Mendoza	2	2023-11-14	7000	bencina_97	1400	debito
2147	Mendoza	2	2023-11-14	15000	bencina_97	1400	debito
2148	Mendoza	2	2023-11-14	9000	bencina_93	1300	debito
2149	Mendoza	2	2023-11-14	17000	bencina_95	1350	debito
2150	Mendoza	2	2023-11-14	7000	bencina_93	1300	debito
2151	Mendoza	2	2023-11-14	6000	bencina_95	1350	debito
2152	Mendoza	2	2023-11-14	6000	bencina_93	1300	debito
2153	Mendoza	2	2023-11-14	17000	bencina_97	1400	debito
2154	Mendoza	2	2023-11-14	12000	kerosene	1100	debito
2155	Mendoza	2	2023-11-14	14000	bencina_93	1300	debito
2156	Mendoza	2	2023-11-14	6000	bencina_93	1300	debito
2157	Mendoza	2	2023-11-14	1000	kerosene	1100	debito
2158	Mendoza	2	2023-11-14	19000	bencina_97	1400	debito
2159	Mendoza	2	2023-11-14	13000	bencina_97	1400	debito
2160	Mendoza	2	2023-11-14	15000	kerosene	1100	debito
2161	Mendoza	2	2023-11-14	8000	bencina_93	1300	debito
2162	Mendoza	2	2023-11-14	13000	bencina_95	1350	debito
2163	Mendoza	2	2023-11-14	17000	bencina_97	1400	debito
2164	Mendoza	2	2023-11-14	4000	bencina_95	1350	debito
2165	Mendoza	2	2023-11-14	1000	kerosene	1100	debito
2166	Mendoza	2	2023-11-14	12000	bencina_95	1350	debito
2167	Mendoza	2	2023-11-14	19000	bencina_93	1300	debito
2168	Mendoza	2	2023-11-14	19000	kerosene	1100	debito
2169	Mendoza	2	2023-11-14	10000	bencina_95	1350	debito
2170	Mendoza	2	2023-11-14	9000	bencina_97	1400	debito
2171	Mendoza	2	2023-11-14	7000	bencina_95	1350	debito
2172	Mendoza	2	2023-11-14	12000	bencina_95	1350	debito
2173	Mendoza	2	2023-11-14	1000	bencina_97	1400	debito
2174	Mendoza	2	2023-11-14	13000	bencina_97	1400	debito
2175	Mendoza	2	2023-11-14	10000	bencina_97	1400	debito
2176	Mendoza	2	2023-11-14	10000	kerosene	1100	debito
2177	Mendoza	2	2023-11-14	2000	kerosene	1100	debito
2178	Mendoza	2	2023-11-14	2000	bencina_93	1300	debito
2179	Mendoza	2	2023-11-14	12000	bencina_95	1350	debito
2180	Mendoza	2	2023-11-14	5000	bencina_97	1400	debito
2181	Mendoza	2	2023-11-14	9000	bencina_95	1350	debito
2182	Mendoza	2	2023-11-14	2000	bencina_95	1350	debito
2183	Mendoza	2	2023-11-14	14000	bencina_93	1300	debito
2184	Mendoza	2	2023-11-14	17000	bencina_93	1300	debito
2185	Mendoza	2	2023-11-14	6000	kerosene	1100	debito
2186	Mendoza	2	2023-11-14	17000	bencina_97	1400	debito
2187	Mendoza	2	2023-11-14	8000	bencina_97	1400	debito
2188	Mendoza	2	2023-11-14	8000	bencina_97	1400	debito
2189	Mendoza	2	2023-11-14	9000	bencina_93	1300	debito
2190	Mendoza	2	2023-11-14	12000	kerosene	1100	debito
2191	Mendoza	2	2023-11-14	19000	bencina_97	1400	debito
2192	Mendoza	2	2023-11-14	13000	bencina_95	1350	debito
2193	Mendoza	2	2023-11-14	8000	bencina_93	1300	debito
2194	Mendoza	2	2023-11-14	4000	bencina_95	1350	debito
2195	Mendoza	2	2023-11-14	19000	bencina_95	1350	debito
2196	Mendoza	2	2023-11-14	13000	bencina_95	1350	debito
2197	Mendoza	2	2023-11-14	11000	kerosene	1100	debito
2198	Mendoza	2	2023-11-14	2000	kerosene	1100	debito
2199	Mendoza	2	2023-11-14	13000	bencina_93	1300	debito
2200	Mendoza	2	2023-11-14	14000	bencina_95	1350	debito
2201	Mendoza	2	2023-11-14	17000	bencina_95	1350	debito
2202	Orlando	3	2023-11-14	16000	bencina_93	1300	debito
2203	Orlando	3	2023-11-14	16000	kerosene	1100	debito
2204	Orlando	3	2023-11-14	7000	bencina_93	1300	debito
2205	Orlando	3	2023-11-14	20000	bencina_93	1300	debito
2206	Orlando	3	2023-11-14	8000	bencina_97	1400	debito
2207	Orlando	3	2023-11-14	8000	bencina_97	1400	debito
2208	Orlando	3	2023-11-14	2000	kerosene	1100	debito
2209	Orlando	3	2023-11-14	6000	bencina_97	1400	debito
2210	Orlando	3	2023-11-14	6000	bencina_97	1400	debito
2211	Orlando	3	2023-11-14	20000	kerosene	1100	debito
2212	Orlando	3	2023-11-14	19000	bencina_97	1400	debito
2213	Orlando	3	2023-11-14	8000	bencina_97	1400	debito
2214	Orlando	3	2023-11-14	8000	bencina_93	1300	debito
2215	Orlando	3	2023-11-14	4000	bencina_93	1300	debito
2216	Orlando	3	2023-11-14	1000	bencina_95	1350	debito
2217	Orlando	3	2023-11-14	19000	bencina_95	1350	debito
2218	Orlando	3	2023-11-14	5000	bencina_97	1400	debito
2219	Orlando	3	2023-11-14	6000	bencina_97	1400	debito
2220	Orlando	3	2023-11-14	7000	bencina_97	1400	debito
2221	Orlando	3	2023-11-14	13000	bencina_95	1350	debito
2222	Orlando	3	2023-11-14	18000	bencina_97	1400	debito
2223	Orlando	3	2023-11-14	17000	kerosene	1100	debito
2224	Orlando	3	2023-11-14	11000	bencina_97	1400	debito
2225	Orlando	3	2023-11-14	13000	bencina_93	1300	debito
2226	Orlando	3	2023-11-14	4000	bencina_97	1400	debito
2227	Orlando	3	2023-11-14	16000	bencina_97	1400	debito
2228	Orlando	3	2023-11-14	12000	bencina_93	1300	debito
2229	Orlando	3	2023-11-14	1000	kerosene	1100	debito
2230	Orlando	3	2023-11-14	14000	kerosene	1100	debito
2231	Orlando	3	2023-11-14	3000	bencina_95	1350	debito
2232	Orlando	3	2023-11-14	20000	bencina_97	1400	debito
2233	Orlando	3	2023-11-14	5000	bencina_93	1300	debito
2234	Orlando	3	2023-11-14	14000	bencina_93	1300	debito
2235	Orlando	3	2023-11-14	5000	bencina_97	1400	debito
2236	Orlando	3	2023-11-14	8000	bencina_93	1300	debito
2237	Orlando	3	2023-11-14	5000	kerosene	1100	debito
2238	Orlando	3	2023-11-14	20000	bencina_93	1300	debito
2239	Orlando	3	2023-11-14	10000	bencina_97	1400	debito
2240	Orlando	3	2023-11-14	18000	bencina_95	1350	debito
2241	Orlando	3	2023-11-14	12000	bencina_93	1300	debito
2242	Orlando	3	2023-11-14	20000	bencina_97	1400	debito
2243	Orlando	3	2023-11-14	5000	bencina_97	1400	debito
2244	Orlando	3	2023-11-14	13000	bencina_97	1400	debito
2245	Orlando	3	2023-11-14	7000	bencina_95	1350	debito
2246	Orlando	3	2023-11-14	5000	kerosene	1100	debito
2247	Orlando	3	2023-11-14	11000	bencina_93	1300	debito
2248	Orlando	3	2023-11-14	8000	kerosene	1100	debito
2249	Orlando	3	2023-11-14	8000	bencina_95	1350	debito
2250	Orlando	3	2023-11-14	2000	kerosene	1100	debito
2251	Orlando	3	2023-11-14	15000	bencina_93	1300	debito
2252	Orlando	3	2023-11-14	16000	bencina_97	1400	debito
2253	Orlando	3	2023-11-14	3000	bencina_95	1350	debito
2254	Orlando	3	2023-11-14	6000	kerosene	1100	debito
2255	Orlando	3	2023-11-14	14000	bencina_93	1300	debito
2256	Orlando	3	2023-11-14	12000	bencina_93	1300	debito
2257	Orlando	3	2023-11-14	12000	bencina_97	1400	debito
2258	Orlando	3	2023-11-14	1000	bencina_93	1300	debito
2259	Orlando	3	2023-11-14	10000	kerosene	1100	debito
2260	Orlando	3	2023-11-14	9000	kerosene	1100	debito
2261	Orlando	3	2023-11-14	15000	bencina_95	1350	debito
2262	Orlando	3	2023-11-14	19000	bencina_93	1300	debito
2263	Orlando	3	2023-11-14	13000	bencina_95	1350	debito
2264	Orlando	3	2023-11-14	11000	bencina_97	1400	debito
2265	Orlando	3	2023-11-14	15000	bencina_95	1350	debito
2266	Orlando	3	2023-11-14	18000	kerosene	1100	debito
2267	Orlando	3	2023-11-14	11000	bencina_93	1300	debito
2268	Orlando	3	2023-11-14	6000	bencina_93	1300	debito
2269	Orlando	3	2023-11-14	13000	bencina_95	1350	debito
2270	Orlando	3	2023-11-14	2000	kerosene	1100	debito
2271	Orlando	3	2023-11-14	6000	bencina_93	1300	debito
2272	Orlando	3	2023-11-14	16000	bencina_95	1350	debito
2273	Orlando	3	2023-11-14	19000	kerosene	1100	debito
2274	Orlando	3	2023-11-14	7000	kerosene	1100	debito
2275	Orlando	3	2023-11-14	6000	bencina_93	1300	debito
2276	Orlando	3	2023-11-14	19000	bencina_97	1400	debito
2277	Orlando	3	2023-11-14	14000	kerosene	1100	debito
2278	Orlando	3	2023-11-14	5000	bencina_97	1400	debito
2279	Orlando	3	2023-11-14	3000	bencina_93	1300	debito
2280	Orlando	3	2023-11-14	7000	bencina_95	1350	debito
2281	Orlando	3	2023-11-14	13000	kerosene	1100	debito
2282	Orlando	3	2023-11-14	13000	kerosene	1100	debito
2283	Orlando	3	2023-11-14	4000	bencina_95	1350	debito
2284	Orlando	3	2023-11-14	11000	bencina_95	1350	debito
2285	Orlando	3	2023-11-14	5000	bencina_95	1350	debito
2286	Orlando	3	2023-11-14	11000	kerosene	1100	debito
2287	Orlando	3	2023-11-14	16000	kerosene	1100	debito
2288	Orlando	3	2023-11-14	7000	bencina_97	1400	debito
2289	Orlando	3	2023-11-14	18000	kerosene	1100	debito
2290	Orlando	3	2023-11-14	9000	bencina_93	1300	debito
2291	Orlando	3	2023-11-14	10000	kerosene	1100	debito
2292	Orlando	3	2023-11-14	5000	kerosene	1100	debito
2293	Orlando	3	2023-11-14	8000	bencina_95	1350	debito
2294	Orlando	3	2023-11-14	7000	bencina_95	1350	debito
2295	Orlando	3	2023-11-14	16000	bencina_95	1350	debito
2296	Orlando	3	2023-11-14	18000	bencina_93	1300	debito
2297	Orlando	3	2023-11-14	15000	bencina_95	1350	debito
2298	Orlando	3	2023-11-14	11000	bencina_97	1400	debito
2299	Orlando	3	2023-11-14	12000	kerosene	1100	debito
2300	Orlando	3	2023-11-14	15000	bencina_95	1350	debito
2301	Orlando	3	2023-11-14	16000	bencina_95	1350	debito
\.


--
-- TOC entry 3371 (class 0 OID 16443)
-- Dependencies: 217
-- Data for Name: ventas_prod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas_prod (cod_planilla, nombre_prod, cantidad, modnto, pk) FROM stdin;
\.


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 221
-- Name: listaCod_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."listaCod_pk_seq"', 4, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 219
-- Name: planillaProd_primaryKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."planillaProd_primaryKey_seq"', 65, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 222
-- Name: ventadBen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ventadBen_id_seq"', 2301, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 220
-- Name: ventasProd_primaryKey_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ventasProd_primaryKey_seq"', 1, false);


--
-- TOC entry 3207 (class 2606 OID 16426)
-- Name: bodega bodega_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bodega
    ADD CONSTRAINT bodega_pkey PRIMARY KEY (nombre_prod);


--
-- TOC entry 3209 (class 2606 OID 16534)
-- Name: lista_cod pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_cod
    ADD CONSTRAINT pk PRIMARY KEY (pk);


--
-- TOC entry 3217 (class 2606 OID 16504)
-- Name: planilla_prod planillaProd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planilla_prod
    ADD CONSTRAINT "planillaProd_pkey" PRIMARY KEY (pk);


--
-- TOC entry 3221 (class 2606 OID 16558)
-- Name: precio_bencinas precio_bencinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.precio_bencinas
    ADD CONSTRAINT precio_bencinas_pkey PRIMARY KEY (fecha);


--
-- TOC entry 3211 (class 2606 OID 16516)
-- Name: lista_cod unique1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_cod
    ADD CONSTRAINT unique1 UNIQUE (cod);


--
-- TOC entry 3205 (class 2606 OID 16419)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (nombre_usr);


--
-- TOC entry 3219 (class 2606 OID 16553)
-- Name: ventas_ben ventadBen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_ben
    ADD CONSTRAINT "ventadBen_pkey" PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 16491)
-- Name: ventas_prod ventasProd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_prod
    ADD CONSTRAINT "ventasProd_pkey" PRIMARY KEY (pk);


--
-- TOC entry 3214 (class 1259 OID 16570)
-- Name: fki_link_cod_cod; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_link_cod_cod ON public.planilla_prod USING btree (codigo);


--
-- TOC entry 3215 (class 1259 OID 16564)
-- Name: fki_link_usr_usr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_link_usr_usr ON public.planilla_prod USING btree (nombre_usr);


--
-- TOC entry 3223 (class 2606 OID 16565)
-- Name: planilla_prod link_cod_cod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planilla_prod
    ADD CONSTRAINT link_cod_cod FOREIGN KEY (codigo) REFERENCES public.lista_cod(cod) NOT VALID;


--
-- TOC entry 3224 (class 2606 OID 16559)
-- Name: planilla_prod link_usr_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planilla_prod
    ADD CONSTRAINT link_usr_usr FOREIGN KEY (nombre_usr) REFERENCES public.usuarios(nombre_usr) NOT VALID;


--
-- TOC entry 3225 (class 2606 OID 16571)
-- Name: ventas_ben link_usr_usr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_ben
    ADD CONSTRAINT link_usr_usr FOREIGN KEY (nombre_usr) REFERENCES public.usuarios(nombre_usr) NOT VALID;


--
-- TOC entry 3222 (class 2606 OID 16540)
-- Name: ventas_prod linkcod-cod2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas_prod
    ADD CONSTRAINT "linkcod-cod2" FOREIGN KEY (cod_planilla) REFERENCES public.lista_cod(cod) NOT VALID;


-- Completed on 2023-12-13 12:01:19

--
-- PostgreSQL database dump complete
--

