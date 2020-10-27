--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9
-- Dumped by pg_dump version 11.9

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

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.admin OWNER TO main;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO main;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    conference_id integer NOT NULL,
    author character varying(255) NOT NULL,
    text text NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    photo_filename character varying(255) DEFAULT NULL::character varying,
    state character varying(255) NOT NULL
);


ALTER TABLE public.comment OWNER TO main;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO main;

--
-- Name: conference; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.conference (
    id integer NOT NULL,
    city character varying(255) NOT NULL,
    year character varying(4) NOT NULL,
    is_international boolean NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.conference OWNER TO main;

--
-- Name: conference_id_seq; Type: SEQUENCE; Schema: public; Owner: main
--

CREATE SEQUENCE public.conference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conference_id_seq OWNER TO main;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: main
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO main;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.admin (id, username, roles, password) FROM stdin;
1	admin	["ROLE_ADMIN"]	$argon2id$v=19$m=65536,t=4,p=1$nWyOcow27yiQecB8V7jIWg$iWFFXrrBACpJStN9j01mN8XCGU5k+4+wbEYCOz5xrns
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.comment (id, conference_id, author, text, email, created_at, photo_filename, state) FROM stdin;
5	1	fabien	texto fabien	fabien@some.where	2020-10-27 10:09:53	c16f3a1b27e0.jpeg	published
8	1	spam	spam	spam@spam.spam	2020-10-27 10:55:49	\N	rejected
\.


--
-- Data for Name: conference; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.conference (id, city, year, is_international, slug) FROM stdin;
2	Paris	2020	t	paris-2020
1	Amsterdam	2019	f	amsterdam-2019
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: main
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20201020063359	2020-10-27 09:30:34	24
DoctrineMigrations\\Version20201021085532	2020-10-27 09:30:34	3
DoctrineMigrations\\Version20201021092742	2020-10-27 09:30:34	1
DoctrineMigrations\\Version20201022083833	2020-10-27 09:30:34	3
DoctrineMigrations\\Version20201023080235	2020-10-27 09:30:34	1
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, false);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.comment_id_seq', 8, true);


--
-- Name: conference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main
--

SELECT pg_catalog.setval('public.conference_id_seq', 1, false);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: conference conference_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.conference
    ADD CONSTRAINT conference_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: idx_9474526c604b8382; Type: INDEX; Schema: public; Owner: main
--

CREATE INDEX idx_9474526c604b8382 ON public.comment USING btree (conference_id);


--
-- Name: uniq_880e0d76f85e0677; Type: INDEX; Schema: public; Owner: main
--

CREATE UNIQUE INDEX uniq_880e0d76f85e0677 ON public.admin USING btree (username);


--
-- Name: uniq_911533c8989d9b62; Type: INDEX; Schema: public; Owner: main
--

CREATE UNIQUE INDEX uniq_911533c8989d9b62 ON public.conference USING btree (slug);


--
-- Name: comment fk_9474526c604b8382; Type: FK CONSTRAINT; Schema: public; Owner: main
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fk_9474526c604b8382 FOREIGN KEY (conference_id) REFERENCES public.conference(id);


--
-- PostgreSQL database dump complete
--

