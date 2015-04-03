--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: distillation; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE distillation (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    ferment_id integer,
    distillation_log_id integer,
    specific_gravity numeric NOT NULL,
    volume numeric NOT NULL,
    unit text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE distillation OWNER TO boozelogger;

--
-- Name: distillation_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE distillation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE distillation_id_seq OWNER TO boozelogger;

--
-- Name: distillation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE distillation_id_seq OWNED BY distillation.id;


--
-- Name: distillation_log; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE distillation_log (
    id integer NOT NULL,
    notes text,
    vessel_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE distillation_log OWNER TO boozelogger;

--
-- Name: distillation_log_entry; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE distillation_log_entry (
    id integer NOT NULL,
    distillation_log_id integer,
    temperature numeric NOT NULL,
    notes text,
    abv numeric NOT NULL,
    volume numeric NOT NULL,
    unit text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE distillation_log_entry OWNER TO boozelogger;

--
-- Name: distillation_log_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE distillation_log_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE distillation_log_entry_id_seq OWNER TO boozelogger;

--
-- Name: distillation_log_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE distillation_log_entry_id_seq OWNED BY distillation_log_entry.id;


--
-- Name: distillation_log_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE distillation_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE distillation_log_id_seq OWNER TO boozelogger;

--
-- Name: distillation_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE distillation_log_id_seq OWNED BY distillation_log.id;


--
-- Name: distillation_vessel; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE distillation_vessel (
    distillation_id integer NOT NULL,
    vessel_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE distillation_vessel OWNER TO boozelogger;

--
-- Name: ferment; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE ferment (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    recipe_id integer,
    ferment_log_id integer,
    original_gravity numeric NOT NULL,
    temperature numeric NOT NULL,
    start_date timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE ferment OWNER TO boozelogger;

--
-- Name: ferment_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE ferment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ferment_id_seq OWNER TO boozelogger;

--
-- Name: ferment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE ferment_id_seq OWNED BY ferment.id;


--
-- Name: ferment_log; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE ferment_log (
    id integer NOT NULL,
    notes text,
    vessel_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE ferment_log OWNER TO boozelogger;

--
-- Name: ferment_log_entry; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE ferment_log_entry (
    id integer NOT NULL,
    ferment_log_id integer,
    temperature numeric NOT NULL,
    notes text,
    specific_gravity numeric NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE ferment_log_entry OWNER TO boozelogger;

--
-- Name: ferment_log_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE ferment_log_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ferment_log_entry_id_seq OWNER TO boozelogger;

--
-- Name: ferment_log_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE ferment_log_entry_id_seq OWNED BY ferment_log_entry.id;


--
-- Name: ferment_log_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE ferment_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ferment_log_id_seq OWNER TO boozelogger;

--
-- Name: ferment_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE ferment_log_id_seq OWNED BY ferment_log.id;


--
-- Name: ferment_vessel; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE ferment_vessel (
    ferment_id integer NOT NULL,
    vessel_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE ferment_vessel OWNER TO boozelogger;

--
-- Name: finish; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE finish (
    id integer NOT NULL,
    name text NOT NULL,
    ferment_id integer NOT NULL,
    distillation_id integer,
    finish_log_id integer,
    description text,
    volume numeric NOT NULL,
    unit text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE finish OWNER TO boozelogger;

--
-- Name: finish_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE finish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE finish_id_seq OWNER TO boozelogger;

--
-- Name: finish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE finish_id_seq OWNED BY finish.id;


--
-- Name: finish_log; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE finish_log (
    id integer NOT NULL,
    notes text,
    vessel_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE finish_log OWNER TO boozelogger;

--
-- Name: finish_log_entry; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE finish_log_entry (
    id integer NOT NULL,
    finish_log_id integer,
    temperature numeric,
    notes text,
    flavor text NOT NULL,
    color text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE finish_log_entry OWNER TO boozelogger;

--
-- Name: finish_log_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE finish_log_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE finish_log_entry_id_seq OWNER TO boozelogger;

--
-- Name: finish_log_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE finish_log_entry_id_seq OWNED BY finish_log_entry.id;


--
-- Name: finish_log_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE finish_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE finish_log_id_seq OWNER TO boozelogger;

--
-- Name: finish_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE finish_log_id_seq OWNED BY finish_log.id;


--
-- Name: finish_vessel; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE finish_vessel (
    finish_id integer NOT NULL,
    vessel_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE finish_vessel OWNER TO boozelogger;

--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE ingredient (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE ingredient OWNER TO boozelogger;

--
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredient_id_seq OWNER TO boozelogger;

--
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE ingredient_id_seq OWNED BY ingredient.id;


--
-- Name: process; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE process (
    id integer NOT NULL,
    name text NOT NULL,
    recipe_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE process OWNER TO boozelogger;

--
-- Name: process_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE process_id_seq OWNER TO boozelogger;

--
-- Name: process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE process_id_seq OWNED BY process.id;


--
-- Name: process_step; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE process_step (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    process_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE process_step OWNER TO boozelogger;

--
-- Name: process_step_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE process_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE process_step_id_seq OWNER TO boozelogger;

--
-- Name: process_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE process_step_id_seq OWNED BY process_step.id;


--
-- Name: recipe; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE recipe (
    id integer NOT NULL,
    name text NOT NULL,
    recipe_type text NOT NULL,
    process_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE recipe OWNER TO boozelogger;

--
-- Name: recipe_component; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE recipe_component (
    id integer NOT NULL,
    recipe_id integer,
    ingredient_id integer NOT NULL,
    amount numeric NOT NULL,
    unit text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE recipe_component OWNER TO boozelogger;

--
-- Name: recipe_component_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE recipe_component_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_component_id_seq OWNER TO boozelogger;

--
-- Name: recipe_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE recipe_component_id_seq OWNED BY recipe_component.id;


--
-- Name: recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_id_seq OWNER TO boozelogger;

--
-- Name: recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE recipe_id_seq OWNED BY recipe.id;


--
-- Name: vessel; Type: TABLE; Schema: public; Owner: boozelogger; Tablespace: 
--

CREATE TABLE vessel (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    volume numeric NOT NULL,
    unit text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE vessel OWNER TO boozelogger;

--
-- Name: vessel_id_seq; Type: SEQUENCE; Schema: public; Owner: boozelogger
--

CREATE SEQUENCE vessel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vessel_id_seq OWNER TO boozelogger;

--
-- Name: vessel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boozelogger
--

ALTER SEQUENCE vessel_id_seq OWNED BY vessel.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation ALTER COLUMN id SET DEFAULT nextval('distillation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation_log ALTER COLUMN id SET DEFAULT nextval('distillation_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation_log_entry ALTER COLUMN id SET DEFAULT nextval('distillation_log_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment ALTER COLUMN id SET DEFAULT nextval('ferment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment_log ALTER COLUMN id SET DEFAULT nextval('ferment_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment_log_entry ALTER COLUMN id SET DEFAULT nextval('ferment_log_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish ALTER COLUMN id SET DEFAULT nextval('finish_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish_log ALTER COLUMN id SET DEFAULT nextval('finish_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish_log_entry ALTER COLUMN id SET DEFAULT nextval('finish_log_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ingredient ALTER COLUMN id SET DEFAULT nextval('ingredient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY process ALTER COLUMN id SET DEFAULT nextval('process_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY process_step ALTER COLUMN id SET DEFAULT nextval('process_step_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY recipe ALTER COLUMN id SET DEFAULT nextval('recipe_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY recipe_component ALTER COLUMN id SET DEFAULT nextval('recipe_component_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY vessel ALTER COLUMN id SET DEFAULT nextval('vessel_id_seq'::regclass);


--
-- Data for Name: distillation; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY distillation (id, name, description, ferment_id, distillation_log_id, specific_gravity, volume, unit, created_at) FROM stdin;
\.


--
-- Name: distillation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('distillation_id_seq', 1, false);


--
-- Data for Name: distillation_log; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY distillation_log (id, notes, vessel_id, created_at) FROM stdin;
\.


--
-- Data for Name: distillation_log_entry; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY distillation_log_entry (id, distillation_log_id, temperature, notes, abv, volume, unit, created_at) FROM stdin;
\.


--
-- Name: distillation_log_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('distillation_log_entry_id_seq', 1, false);


--
-- Name: distillation_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('distillation_log_id_seq', 1, false);


--
-- Data for Name: distillation_vessel; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY distillation_vessel (distillation_id, vessel_id, created_at) FROM stdin;
\.


--
-- Data for Name: ferment; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY ferment (id, name, description, recipe_id, ferment_log_id, original_gravity, temperature, start_date, created_at) FROM stdin;
\.


--
-- Name: ferment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('ferment_id_seq', 1, false);


--
-- Data for Name: ferment_log; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY ferment_log (id, notes, vessel_id, created_at) FROM stdin;
\.


--
-- Data for Name: ferment_log_entry; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY ferment_log_entry (id, ferment_log_id, temperature, notes, specific_gravity, created_at) FROM stdin;
\.


--
-- Name: ferment_log_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('ferment_log_entry_id_seq', 1, false);


--
-- Name: ferment_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('ferment_log_id_seq', 1, false);


--
-- Data for Name: ferment_vessel; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY ferment_vessel (ferment_id, vessel_id, created_at) FROM stdin;
\.


--
-- Data for Name: finish; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY finish (id, name, ferment_id, distillation_id, finish_log_id, description, volume, unit, created_at) FROM stdin;
\.


--
-- Name: finish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('finish_id_seq', 1, false);


--
-- Data for Name: finish_log; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY finish_log (id, notes, vessel_id, created_at) FROM stdin;
\.


--
-- Data for Name: finish_log_entry; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY finish_log_entry (id, finish_log_id, temperature, notes, flavor, color, created_at) FROM stdin;
\.


--
-- Name: finish_log_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('finish_log_entry_id_seq', 1, false);


--
-- Name: finish_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('finish_log_id_seq', 1, false);


--
-- Data for Name: finish_vessel; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY finish_vessel (finish_id, vessel_id, created_at) FROM stdin;
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY ingredient (id, name, created_at) FROM stdin;
1	2-Row Scottish Malt	2015-03-10 10:49:17.142-07
2	Dextrose	2015-03-10 21:04:59.857-07
3	2-Row Organic Malt	2015-03-10 21:10:36.068-07
4	Distiller's Yeast	2015-03-10 21:11:17.623-07
5	Yeast Nutrient	2015-03-10 21:11:29.284-07
6	Organic Cane Sugar	2015-03-10 21:11:39.003-07
7	Organic Golden Raisins	2015-03-10 21:12:47.449-07
8	Water	2015-03-10 21:12:53.919-07
\.


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('ingredient_id_seq', 8, true);


--
-- Data for Name: process; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY process (id, name, recipe_id, created_at) FROM stdin;
1	Scottish Malt Whiskey	\N	2015-03-10 21:37:08.783-07
4	Scottish Malt Whiskey	\N	2015-03-10 21:51:04.144-07
\.


--
-- Name: process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('process_id_seq', 4, true);


--
-- Data for Name: process_step; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY process_step (id, name, description, process_id, created_at) FROM stdin;
1	Heat 4 gallons of water to 160F	\N	4	2015-03-11 22:27:57.18-07
2	Turn off heat	\N	4	2015-03-11 22:28:21.105-07
3	Stir in malt	\N	4	2015-03-11 22:28:49.331-07
4	Let sit, covered, for 90 minutes	Stir every 15 minutes.  Temperature will drop to ~154 during conversion	4	2015-03-11 22:29:46.662-07
5	Strain off malt into a grain bag	\N	4	2015-03-11 22:30:30.267-07
6	Sparge twice with 1 gallon near-boiling water and add back to kettle	\N	4	2015-03-11 22:31:10.011-07
7	Plate-chill wort into primary	It is only necessary to cool the wort to between 80-90F	4	2015-03-11 22:34:28.088-07
8	Measure original gravity	\N	4	2015-03-11 22:34:53.078-07
9	Stir in yeast nutrient	\N	4	2015-03-11 22:35:11.676-07
10	Pitch yeast and seal with airlock	\N	4	2015-03-11 22:35:29.007-07
\.


--
-- Name: process_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('process_step_id_seq', 10, true);


--
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY recipe (id, name, recipe_type, process_id, created_at) FROM stdin;
4	Scottish Malt Whiskey	WHISKEY_WORT	4	2015-03-10 21:51:25.735-07
\.


--
-- Data for Name: recipe_component; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY recipe_component (id, recipe_id, ingredient_id, amount, unit, created_at) FROM stdin;
4	4	5	3	TABLESPOON	2015-03-10 21:29:48.97-07
5	4	8	6	GALLON	2015-03-10 21:30:55.618-07
2	4	4	3	TABLESPOON	2015-03-10 21:24:04.595657-07
1	4	1	14.5	POUND	2015-03-10 21:14:22.71406-07
\.


--
-- Name: recipe_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('recipe_component_id_seq', 5, true);


--
-- Name: recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('recipe_id_seq', 4, true);


--
-- Data for Name: vessel; Type: TABLE DATA; Schema: public; Owner: boozelogger
--

COPY vessel (id, name, description, volume, unit, created_at) FROM stdin;
\.


--
-- Name: vessel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: boozelogger
--

SELECT pg_catalog.setval('vessel_id_seq', 1, false);


--
-- Name: distillation_log_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY distillation_log_entry
    ADD CONSTRAINT distillation_log_entry_pkey PRIMARY KEY (id);


--
-- Name: distillation_log_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY distillation_log
    ADD CONSTRAINT distillation_log_pkey PRIMARY KEY (id);


--
-- Name: distillation_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY distillation
    ADD CONSTRAINT distillation_pkey PRIMARY KEY (id);


--
-- Name: distillation_vessel_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY distillation_vessel
    ADD CONSTRAINT distillation_vessel_pkey PRIMARY KEY (distillation_id, vessel_id);


--
-- Name: ferment_log_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY ferment_log_entry
    ADD CONSTRAINT ferment_log_entry_pkey PRIMARY KEY (id);


--
-- Name: ferment_log_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY ferment_log
    ADD CONSTRAINT ferment_log_pkey PRIMARY KEY (id);


--
-- Name: ferment_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY ferment
    ADD CONSTRAINT ferment_pkey PRIMARY KEY (id);


--
-- Name: ferment_vessel_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY ferment_vessel
    ADD CONSTRAINT ferment_vessel_pkey PRIMARY KEY (ferment_id, vessel_id);


--
-- Name: finish_log_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY finish_log_entry
    ADD CONSTRAINT finish_log_entry_pkey PRIMARY KEY (id);


--
-- Name: finish_log_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY finish_log
    ADD CONSTRAINT finish_log_pkey PRIMARY KEY (id);


--
-- Name: finish_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY finish
    ADD CONSTRAINT finish_pkey PRIMARY KEY (id);


--
-- Name: finish_vessel_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY finish_vessel
    ADD CONSTRAINT finish_vessel_pkey PRIMARY KEY (finish_id, vessel_id);


--
-- Name: ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- Name: process_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY process
    ADD CONSTRAINT process_pkey PRIMARY KEY (id);


--
-- Name: process_step_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY process_step
    ADD CONSTRAINT process_step_pkey PRIMARY KEY (id);


--
-- Name: recipe_component_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY recipe_component
    ADD CONSTRAINT recipe_component_pkey PRIMARY KEY (id);


--
-- Name: recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id);


--
-- Name: vessel_pkey; Type: CONSTRAINT; Schema: public; Owner: boozelogger; Tablespace: 
--

ALTER TABLE ONLY vessel
    ADD CONSTRAINT vessel_pkey PRIMARY KEY (id);


--
-- Name: distillation_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish
    ADD CONSTRAINT distillation_fk FOREIGN KEY (distillation_id) REFERENCES distillation(id);


--
-- Name: distillation_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation_vessel
    ADD CONSTRAINT distillation_fk FOREIGN KEY (distillation_id) REFERENCES distillation(id);


--
-- Name: distillation_log_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation
    ADD CONSTRAINT distillation_log_fk FOREIGN KEY (distillation_log_id) REFERENCES distillation_log(id);


--
-- Name: distillation_log_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation_log_entry
    ADD CONSTRAINT distillation_log_fk FOREIGN KEY (distillation_log_id) REFERENCES distillation_log(id);


--
-- Name: ferment_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation
    ADD CONSTRAINT ferment_fk FOREIGN KEY (ferment_id) REFERENCES ferment(id);


--
-- Name: ferment_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish
    ADD CONSTRAINT ferment_fk FOREIGN KEY (ferment_id) REFERENCES ferment(id);


--
-- Name: ferment_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment_vessel
    ADD CONSTRAINT ferment_fk FOREIGN KEY (ferment_id) REFERENCES ferment(id);


--
-- Name: ferment_log_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment
    ADD CONSTRAINT ferment_log_fk FOREIGN KEY (ferment_log_id) REFERENCES ferment_log(id);


--
-- Name: ferment_log_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment_log_entry
    ADD CONSTRAINT ferment_log_fk FOREIGN KEY (ferment_log_id) REFERENCES ferment_log(id);


--
-- Name: finish_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish_vessel
    ADD CONSTRAINT finish_fk FOREIGN KEY (finish_id) REFERENCES finish(id);


--
-- Name: finish_log_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish
    ADD CONSTRAINT finish_log_fk FOREIGN KEY (finish_log_id) REFERENCES finish_log(id);


--
-- Name: finish_log_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish_log_entry
    ADD CONSTRAINT finish_log_fk FOREIGN KEY (finish_log_id) REFERENCES finish_log(id);


--
-- Name: ingredient_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY recipe_component
    ADD CONSTRAINT ingredient_fk FOREIGN KEY (ingredient_id) REFERENCES ingredient(id);


--
-- Name: process_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY recipe
    ADD CONSTRAINT process_fk FOREIGN KEY (process_id) REFERENCES process(id);


--
-- Name: process_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY process_step
    ADD CONSTRAINT process_fk FOREIGN KEY (process_id) REFERENCES process(id);


--
-- Name: recipe_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY recipe_component
    ADD CONSTRAINT recipe_fk FOREIGN KEY (recipe_id) REFERENCES recipe(id);


--
-- Name: recipe_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY process
    ADD CONSTRAINT recipe_fk FOREIGN KEY (recipe_id) REFERENCES recipe(id);


--
-- Name: recipe_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment
    ADD CONSTRAINT recipe_fk FOREIGN KEY (recipe_id) REFERENCES recipe(id);


--
-- Name: vessel_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment_vessel
    ADD CONSTRAINT vessel_fk FOREIGN KEY (vessel_id) REFERENCES vessel(id);


--
-- Name: vessel_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation_vessel
    ADD CONSTRAINT vessel_fk FOREIGN KEY (vessel_id) REFERENCES vessel(id);


--
-- Name: vessel_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish_vessel
    ADD CONSTRAINT vessel_fk FOREIGN KEY (vessel_id) REFERENCES vessel(id);


--
-- Name: vessel_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY ferment_log
    ADD CONSTRAINT vessel_fk FOREIGN KEY (vessel_id) REFERENCES vessel(id);


--
-- Name: vessel_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY distillation_log
    ADD CONSTRAINT vessel_fk FOREIGN KEY (vessel_id) REFERENCES vessel(id);


--
-- Name: vessel_fk; Type: FK CONSTRAINT; Schema: public; Owner: boozelogger
--

ALTER TABLE ONLY finish_log
    ADD CONSTRAINT vessel_fk FOREIGN KEY (vessel_id) REFERENCES vessel(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: cjohannsen
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM cjohannsen;
GRANT ALL ON SCHEMA public TO cjohannsen;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

