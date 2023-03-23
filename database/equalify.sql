--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2 (Homebrew)

-- Started on 2023-03-23 19:25:36 EDT

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

--
-- TOC entry 6 (class 2615 OID 39606)
-- Name: meta; Type: SCHEMA; Schema: -; Owner: bhensel_admin
--

CREATE SCHEMA meta;


ALTER SCHEMA meta OWNER TO bhensel_admin;

--
-- TOC entry 7 (class 2615 OID 39607)
-- Name: results; Type: SCHEMA; Schema: -; Owner: bhensel_admin
--

CREATE SCHEMA results;


ALTER SCHEMA results OWNER TO bhensel_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 39659)
-- Name: domains; Type: TABLE; Schema: meta; Owner: bhensel_admin
--

CREATE TABLE meta.domains (
    id character varying NOT NULL,
    domain character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    org_id integer
);


ALTER TABLE meta.domains OWNER TO bhensel_admin;

--
-- TOC entry 226 (class 1259 OID 39676)
-- Name: org_types; Type: TABLE; Schema: meta; Owner: bhensel_admin
--

CREATE TABLE meta.org_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    examples character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE meta.org_types OWNER TO bhensel_admin;

--
-- TOC entry 225 (class 1259 OID 39675)
-- Name: org_types_id_seq; Type: SEQUENCE; Schema: meta; Owner: bhensel_admin
--

CREATE SEQUENCE meta.org_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meta.org_types_id_seq OWNER TO bhensel_admin;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 225
-- Name: org_types_id_seq; Type: SEQUENCE OWNED BY; Schema: meta; Owner: bhensel_admin
--

ALTER SEQUENCE meta.org_types_id_seq OWNED BY meta.org_types.id;


--
-- TOC entry 223 (class 1259 OID 39646)
-- Name: orgs; Type: TABLE; Schema: meta; Owner: bhensel_admin
--

CREATE TABLE meta.orgs (
    id integer NOT NULL,
    name character varying NOT NULL,
    abbr character varying,
    parent_org_id integer,
    description character varying,
    type_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE meta.orgs OWNER TO bhensel_admin;

--
-- TOC entry 222 (class 1259 OID 39645)
-- Name: orgs_id_seq; Type: SEQUENCE; Schema: meta; Owner: bhensel_admin
--

CREATE SEQUENCE meta.orgs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meta.orgs_id_seq OWNER TO bhensel_admin;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 222
-- Name: orgs_id_seq; Type: SEQUENCE OWNED BY; Schema: meta; Owner: bhensel_admin
--

ALTER SEQUENCE meta.orgs_id_seq OWNED BY meta.orgs.id;


--
-- TOC entry 219 (class 1259 OID 39618)
-- Name: items; Type: TABLE; Schema: results; Owner: bhensel_admin
--

CREATE TABLE results.items (
    id integer NOT NULL,
    scan_id integer NOT NULL,
    type character varying,
    description character varying,
    help character varying,
    help_url character varying,
    area character varying NOT NULL,
    impact character varying,
    tags text[]
);


ALTER TABLE results.items OWNER TO bhensel_admin;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN items.area; Type: COMMENT; Schema: results; Owner: bhensel_admin
--

COMMENT ON COLUMN results.items.area IS 'Known as id from Axe';


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN items.impact; Type: COMMENT; Schema: results; Owner: bhensel_admin
--

COMMENT ON COLUMN results.items.impact IS 'Engine defined impact';


--
-- TOC entry 218 (class 1259 OID 39617)
-- Name: items_id_seq; Type: SEQUENCE; Schema: results; Owner: bhensel_admin
--

CREATE SEQUENCE results.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results.items_id_seq OWNER TO bhensel_admin;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 218
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: results; Owner: bhensel_admin
--

ALTER SEQUENCE results.items_id_seq OWNED BY results.items.id;


--
-- TOC entry 221 (class 1259 OID 39632)
-- Name: nodes; Type: TABLE; Schema: results; Owner: bhensel_admin
--

CREATE TABLE results.nodes (
    id integer NOT NULL,
    item_id integer NOT NULL,
    html character varying,
    impact character varying,
    target text[],
    "any" text[],
    "all" text[],
    "none" text[]
);


ALTER TABLE results.nodes OWNER TO bhensel_admin;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN nodes.impact; Type: COMMENT; Schema: results; Owner: bhensel_admin
--

COMMENT ON COLUMN results.nodes.impact IS 'Engine defined impact';


--
-- TOC entry 220 (class 1259 OID 39631)
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: results; Owner: bhensel_admin
--

CREATE SEQUENCE results.nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results.nodes_id_seq OWNER TO bhensel_admin;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 220
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: results; Owner: bhensel_admin
--

ALTER SEQUENCE results.nodes_id_seq OWNED BY results.nodes.id;


--
-- TOC entry 217 (class 1259 OID 39609)
-- Name: scans; Type: TABLE; Schema: results; Owner: bhensel_admin
--

CREATE TABLE results.scans (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    engine_name character varying NOT NULL,
    engine_version character varying NOT NULL,
    env_orientation_angle integer,
    env_orientation_type character varying,
    env_user_agent character varying,
    env_window_height integer,
    env_window_width integer,
    reporter character varying,
    runner_name character varying,
    scanned_at timestamp with time zone,
    url character varying,
    domain character varying
);


ALTER TABLE results.scans OWNER TO bhensel_admin;

--
-- TOC entry 216 (class 1259 OID 39608)
-- Name: scans_id_seq; Type: SEQUENCE; Schema: results; Owner: bhensel_admin
--

CREATE SEQUENCE results.scans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE results.scans_id_seq OWNER TO bhensel_admin;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 216
-- Name: scans_id_seq; Type: SEQUENCE OWNED BY; Schema: results; Owner: bhensel_admin
--

ALTER SEQUENCE results.scans_id_seq OWNED BY results.scans.id;


--
-- TOC entry 3211 (class 2604 OID 39679)
-- Name: org_types id; Type: DEFAULT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.org_types ALTER COLUMN id SET DEFAULT nextval('meta.org_types_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 39649)
-- Name: orgs id; Type: DEFAULT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.orgs ALTER COLUMN id SET DEFAULT nextval('meta.orgs_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 39621)
-- Name: items id; Type: DEFAULT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.items ALTER COLUMN id SET DEFAULT nextval('results.items_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 39635)
-- Name: nodes id; Type: DEFAULT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.nodes ALTER COLUMN id SET DEFAULT nextval('results.nodes_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 39612)
-- Name: scans id; Type: DEFAULT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.scans ALTER COLUMN id SET DEFAULT nextval('results.scans_id_seq'::regclass);


--
-- TOC entry 3389 (class 0 OID 39659)
-- Dependencies: 224
-- Data for Name: domains; Type: TABLE DATA; Schema: meta; Owner: bhensel_admin
--

COPY meta.domains (id, domain, created_at, updated_at, org_id) FROM stdin;
\.


--
-- TOC entry 3391 (class 0 OID 39676)
-- Dependencies: 226
-- Data for Name: org_types; Type: TABLE DATA; Schema: meta; Owner: bhensel_admin
--

COPY meta.org_types (id, name, description, examples, created_at, updated_at) FROM stdin;
34	Federal	Organizations that operate within the national government of a country	Federal Bureau of Investigation (FBI), United States Department of Agriculture (USDA)	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
35	State	Organizations that operate within a state government	California Department of Education, Texas Department of Transportation	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
36	Local	Organizations that operate within a local government, such as a city or county	City of Los Angeles Department of Water and Power, King County Metro Transit	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
37	Tribal	Organizations that operate within a tribal government, representing indigenous populations	Navajo Nation, Cherokee Nation	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
38	International	Organizations that operate across national borders and have global reach	United Nations (UN), World Health Organization (WHO)	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
39	Regional	Organizations that operate within a specific geographic region	African Union in Africa, Regional Environmental Center in Europe, Council of Arab Economic Unity in the Middle East	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
40	NGO	Non-governmental organizations that are usually non-profit and operate independently of governments	Greenpeace, Amnesty International	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
41	Commercial	Organizations that engage in commercial activities to make a profit	Apple Inc., ExxonMobil	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
42	Nonprofit	Organizations that do not operate for the purpose of making a profit and are often focused on social or environmental causes	The Red Cross, Goodwill Industries	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
43	Political	Organizations that are focused on political activities and may engage in lobbying or advocacy	Republican National Committee, Democratic National Committee	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
44	Educational	Organizations that are focused on education and research	Harvard University, National Science Foundation	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
45	Religious	Organizations that are focused on religious activities and beliefs	The Roman Catholic Church, Islamic Relief	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
46	Healthcare	Organizations that are focused on healthcare and medical services	Mayo Clinic, Doctors Without Borders	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
47	Social	Organizations that are focused on social issues and advocacy	American Civil Liberties Union, National Association for the Advancement of Colored People	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
48	Environmental	Organizations that are focused on environmental issues and advocacy	Sierra Club, The Nature Conservancy	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
49	Cultural	Organizations that are focused on cultural activities and heritage	National Museum of African American History and Culture, The Metropolitan Museum of Art	2023-03-23 14:53:14.163003-07	2023-03-23 14:53:14.163003-07
\.


--
-- TOC entry 3388 (class 0 OID 39646)
-- Dependencies: 223
-- Data for Name: orgs; Type: TABLE DATA; Schema: meta; Owner: bhensel_admin
--

COPY meta.orgs (id, name, abbr, parent_org_id, description, type_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3384 (class 0 OID 39618)
-- Dependencies: 219
-- Data for Name: items; Type: TABLE DATA; Schema: results; Owner: bhensel_admin
--

COPY results.items (id, scan_id, type, description, help, help_url, area, impact, tags) FROM stdin;
\.


--
-- TOC entry 3386 (class 0 OID 39632)
-- Dependencies: 221
-- Data for Name: nodes; Type: TABLE DATA; Schema: results; Owner: bhensel_admin
--

COPY results.nodes (id, item_id, html, impact, target, "any", "all", "none") FROM stdin;
\.


--
-- TOC entry 3382 (class 0 OID 39609)
-- Dependencies: 217
-- Data for Name: scans; Type: TABLE DATA; Schema: results; Owner: bhensel_admin
--

COPY results.scans (id, created_at, engine_name, engine_version, env_orientation_angle, env_orientation_type, env_user_agent, env_window_height, env_window_width, reporter, runner_name, scanned_at, url, domain) FROM stdin;
\.


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 225
-- Name: org_types_id_seq; Type: SEQUENCE SET; Schema: meta; Owner: bhensel_admin
--

SELECT pg_catalog.setval('meta.org_types_id_seq', 49, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 222
-- Name: orgs_id_seq; Type: SEQUENCE SET; Schema: meta; Owner: bhensel_admin
--

SELECT pg_catalog.setval('meta.orgs_id_seq', 1, false);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 218
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: results; Owner: bhensel_admin
--

SELECT pg_catalog.setval('results.items_id_seq', 1, false);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 220
-- Name: nodes_id_seq; Type: SEQUENCE SET; Schema: results; Owner: bhensel_admin
--

SELECT pg_catalog.setval('results.nodes_id_seq', 1, false);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 216
-- Name: scans_id_seq; Type: SEQUENCE SET; Schema: results; Owner: bhensel_admin
--

SELECT pg_catalog.setval('results.scans_id_seq', 1, false);


--
-- TOC entry 3223 (class 2606 OID 39667)
-- Name: domains domains_pk; Type: CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.domains
    ADD CONSTRAINT domains_pk PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 39669)
-- Name: domains domains_un; Type: CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.domains
    ADD CONSTRAINT domains_un UNIQUE (domain);


--
-- TOC entry 3227 (class 2606 OID 39685)
-- Name: org_types org_types_name_key; Type: CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.org_types
    ADD CONSTRAINT org_types_name_key UNIQUE (name);


--
-- TOC entry 3229 (class 2606 OID 39683)
-- Name: org_types org_types_pkey; Type: CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.org_types
    ADD CONSTRAINT org_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 39653)
-- Name: orgs orgs_pk; Type: CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.orgs
    ADD CONSTRAINT orgs_pk PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 39625)
-- Name: items items_pk; Type: CONSTRAINT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.items
    ADD CONSTRAINT items_pk PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 39639)
-- Name: nodes nodes_pk; Type: CONSTRAINT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.nodes
    ADD CONSTRAINT nodes_pk PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 39616)
-- Name: scans scans_pk; Type: CONSTRAINT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.scans
    ADD CONSTRAINT scans_pk PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2620 OID 39695)
-- Name: domains update_created_at; Type: TRIGGER; Schema: meta; Owner: bhensel_admin
--

CREATE TRIGGER update_created_at BEFORE UPDATE ON meta.domains FOR EACH ROW EXECUTE FUNCTION public.update_created_at_column();


--
-- TOC entry 3238 (class 2620 OID 39694)
-- Name: org_types update_created_at; Type: TRIGGER; Schema: meta; Owner: bhensel_admin
--

CREATE TRIGGER update_created_at BEFORE UPDATE ON meta.org_types FOR EACH ROW EXECUTE FUNCTION public.update_created_at_column();


--
-- TOC entry 3236 (class 2620 OID 39698)
-- Name: orgs update_created_at; Type: TRIGGER; Schema: meta; Owner: bhensel_admin
--

CREATE TRIGGER update_created_at BEFORE UPDATE ON meta.orgs FOR EACH ROW EXECUTE FUNCTION public.update_created_at_column();


--
-- TOC entry 3235 (class 2606 OID 39670)
-- Name: domains domains_fk; Type: FK CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.domains
    ADD CONSTRAINT domains_fk FOREIGN KEY (org_id) REFERENCES meta.orgs(id);


--
-- TOC entry 3233 (class 2606 OID 39654)
-- Name: orgs orgs_parent_org_id_fkey; Type: FK CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.orgs
    ADD CONSTRAINT orgs_parent_org_id_fkey FOREIGN KEY (parent_org_id) REFERENCES meta.orgs(id);


--
-- TOC entry 3234 (class 2606 OID 39686)
-- Name: orgs orgs_type_id_fkey; Type: FK CONSTRAINT; Schema: meta; Owner: bhensel_admin
--

ALTER TABLE ONLY meta.orgs
    ADD CONSTRAINT orgs_type_id_fkey FOREIGN KEY (type_id) REFERENCES meta.org_types(id);


--
-- TOC entry 3231 (class 2606 OID 39704)
-- Name: items items_fk; Type: FK CONSTRAINT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.items
    ADD CONSTRAINT items_fk FOREIGN KEY (scan_id) REFERENCES results.scans(id);


--
-- TOC entry 3232 (class 2606 OID 39640)
-- Name: nodes nodes_fk; Type: FK CONSTRAINT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.nodes
    ADD CONSTRAINT nodes_fk FOREIGN KEY (item_id) REFERENCES results.items(id);


--
-- TOC entry 3230 (class 2606 OID 39699)
-- Name: scans scans_fk; Type: FK CONSTRAINT; Schema: results; Owner: bhensel_admin
--

ALTER TABLE ONLY results.scans
    ADD CONSTRAINT scans_fk FOREIGN KEY (domain) REFERENCES meta.domains(domain);


-- Completed on 2023-03-23 19:25:41 EDT

--
-- PostgreSQL database dump complete
--

