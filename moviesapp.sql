--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:MYaeLPbSHHXzBmiCdigpwg==$j5hGXbrX4Xh6GeB0hOOYomhtvAuBv8FPVYW55CNb8mk=:cCPTm/rmHCy0A8M2Z/4nxPOFZQffNdrqVHdnqUExzho=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- PostgreSQL database dump complete
--

--
-- Database "moviesapp" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: moviesapp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE moviesapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';


ALTER DATABASE moviesapp OWNER TO postgres;

\connect moviesapp

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

  NEW.updated_at = NOW();

  RETURN NEW;

END;

$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    u_id integer NOT NULL,
    q_id integer NOT NULL,
    answer character varying(50)
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- Name: quizs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizs (
    qid integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    completed_at timestamp with time zone
);


ALTER TABLE public.quizs OWNER TO postgres;

--
-- Name: quizs_qid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizs_qid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quizs_qid_seq OWNER TO postgres;

--
-- Name: quizs_qid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizs_qid_seq OWNED BY public.quizs.qid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    u_name text,
    password text,
    mail text,
    dob date NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    login timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: watchlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watchlists (
    m_id character varying(30) NOT NULL,
    u_id integer NOT NULL,
    status character varying(30) DEFAULT 'not watched'::character varying NOT NULL,
    fav boolean,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.watchlists OWNER TO postgres;

--
-- Name: quizs qid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizs ALTER COLUMN qid SET DEFAULT nextval('public.quizs_qid_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answers (u_id, q_id, answer) FROM stdin;
10	10	Horror
10	10	Comedy
10	10	Martin Scorcesse
10	10	Hindi
10	10	More than 20
10	10	More than 20
10	10	Comedy
10	10	Martin Scorcesse
10	10	Wes Anderson
10	10	More than 20
10	10	More than 20
1	11	Horror
1	11	Wes Anderson
1	11	Martin Scorcesse
1	11	More than 20
1	11	More than 50
10	10	Comedy
10	10	Wes Anderson
10	10	English
10	10	More than 20
10	10	More than 20
9	12	Comedy
9	12	Quintin Tarrentino
9	12	Wes Anderson
9	12	More than 10
9	12	More than 20
\.


--
-- Data for Name: quizs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quizs (qid, created_at, completed_at) FROM stdin;
1	2021-10-28 09:56:39.953024+05:30	\N
2	2021-10-28 09:58:17.849241+05:30	2021-10-04 17:19:04.996798+05:30
3	2021-10-28 09:58:20.344941+05:30	2021-10-04 17:19:04.996798+05:30
4	2021-10-28 10:17:58.74245+05:30	2021-10-04 17:19:04.996798+05:30
5	2021-10-28 10:21:06.285519+05:30	2021-10-04 17:19:04.996798+05:30
6	2021-10-28 10:22:59.119265+05:30	2021-10-04 17:19:04.996798+05:30
7	2021-10-28 10:26:43.243461+05:30	2021-10-04 17:19:04.996798+05:30
8	2021-10-28 10:31:23.460861+05:30	2021-10-04 17:19:04.996798+05:30
9	2021-10-28 10:34:40.025597+05:30	2021-10-04 17:19:04.996798+05:30
10	2021-10-28 10:36:04.98224+05:30	2021-10-04 17:19:04.996798+05:30
11	2021-10-28 10:41:24.821403+05:30	2021-10-04 17:19:04.996798+05:30
12	2021-10-28 12:41:07.894587+05:30	2021-10-04 17:19:04.996798+05:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, u_name, password, mail, dob, created_at, updated_at, login) FROM stdin;
3	C	1234567890	c@cmail.com	2001-04-02	2021-10-04 17:19:04.996798+05:30	2021-10-04 17:19:04.996798+05:30	2021-10-04 17:19:04.996798+05:30
1	A	12345678	a@amail.com	2001-02-02	2021-10-04 17:19:04.991682+05:30	2021-10-04 17:21:52.841663+05:30	2021-10-04 17:19:04.991682+05:30
2	B	123456789	b@bmail.com	2001-04-02	2021-10-04 17:19:04.995629+05:30	2021-10-04 17:21:52.902888+05:30	2021-10-04 17:19:04.995629+05:30
7	G	1	g@gmail.com	2021-10-20	2021-10-25 12:44:01.488047+05:30	2021-10-25 12:44:01.488047+05:30	2021-10-25 12:44:01.488047+05:30
8	P	1234	p@gmail.com	2021-10-12	2021-10-25 13:41:56.392136+05:30	2021-10-25 13:41:56.392136+05:30	2021-10-25 13:41:56.392136+05:30
9	Siddhesh1610	Jt3nAuifQXsp8iC	puraniksiddesh@gmail.com	2021-10-13	2021-10-25 18:42:35.259236+05:30	2021-10-25 18:42:35.259236+05:30	2021-10-25 18:42:35.259236+05:30
10	Siddhesh16101	9NuEqYY9ZeKTFhc	puraniksiddessh@gmail.com	2021-09-28	2021-10-25 18:51:28.009571+05:30	2021-10-25 18:51:28.009571+05:30	2021-10-25 18:51:28.009571+05:30
11	V	12345@$Aa	V@mail.com	2021-10-20	2021-10-27 17:56:47.029403+05:30	2021-10-27 17:56:47.029403+05:30	2021-10-27 17:56:47.029403+05:30
\.


--
-- Data for Name: watchlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.watchlists (m_id, u_id, status, fav, created_at, updated_at) FROM stdin;
0111161	1	watched	t	2021-10-25 20:44:26.893455+05:30	2021-10-25 20:44:26.893455+05:30
1345836	10	watched	t	2021-10-26 09:22:49.338714+05:30	2021-10-26 09:22:49.338714+05:30
2395427	10	watched	t	2021-10-26 09:29:25.11149+05:30	2021-10-26 09:29:25.11149+05:30
4154756	10	Watched	f	2021-10-26 09:29:41.989156+05:30	2021-10-26 09:29:41.989156+05:30
0111161	9	watched	t	2021-10-26 09:37:37.04921+05:30	2021-10-26 09:37:37.04921+05:30
0167260	9	watched	t	2021-10-26 19:36:19.178681+05:30	2021-10-26 19:36:19.178681+05:30
0120737	9	watched	t	2021-10-26 19:36:24.046018+05:30	2021-10-26 19:36:24.046018+05:30
0068646	9	watched	f	2021-10-26 21:37:38.457389+05:30	2021-10-26 21:37:38.457389+05:30
0071562	9	watched	f	2021-10-26 21:37:40.760435+05:30	2021-10-26 21:37:40.760435+05:30
9376612	9	not watched	f	2021-10-26 21:57:22.129119+05:30	2021-10-26 21:57:22.129119+05:30
1877830	9	watched	f	2021-10-26 21:58:55.260492+05:30	2021-10-26 21:58:55.260492+05:30
0096895	9	watched	f	2021-10-26 21:58:58.424861+05:30	2021-10-26 21:58:58.424861+05:30
1160419	9	not watched	f	2021-10-26 23:16:10.534953+05:30	2021-10-26 23:16:10.534953+05:30
5034838	9	watched	t	2021-10-27 10:05:24.873748+05:30	2021-10-27 10:11:43.506592+05:30
0831387	9	watched	f	2021-10-27 10:17:26.580041+05:30	2021-10-27 10:17:31.314943+05:30
4262980	9	watched	f	2021-10-27 10:17:54.62284+05:30	2021-10-27 10:18:02.103553+05:30
0068646	2	watched	t	2021-10-27 10:56:38.528828+05:30	2021-10-27 10:56:38.528828+05:30
0068646	10	watched	t	2021-10-28 08:13:33.525806+05:30	2021-10-28 08:13:33.525806+05:30
2382320	9	watched	t	2021-10-26 23:18:23.552693+05:30	2021-10-28 10:51:18.877498+05:30
4154796	10	watched	t	2021-10-26 09:29:58.675976+05:30	2021-10-28 10:57:08.769268+05:30
0109830	9	watched	t	2021-10-26 19:36:31.424813+05:30	2021-10-28 11:39:17.113983+05:30
0060196	9	watched	t	2021-10-26 19:36:34.589079+05:30	2021-10-28 11:42:01.092731+05:30
0468569	9	watched	t	2021-10-26 19:36:27.584767+05:30	2021-10-28 12:39:24.120375+05:30
10872600	10	not watched	f	2021-11-11 12:26:13.727005+05:30	2021-11-11 12:26:13.727005+05:30
0145487	10	watched	f	2021-11-11 12:26:27.565413+05:30	2021-11-11 12:26:27.565413+05:30
2250912	10	watched	f	2021-11-11 12:26:16.201284+05:30	2021-11-11 12:30:13.301215+05:30
6320628	10	watched	t	2021-11-11 12:26:17.809275+05:30	2021-11-11 12:31:17.453981+05:30
\.


--
-- Name: quizs_qid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizs_qid_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: quizs quizs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizs
    ADD CONSTRAINT quizs_pkey PRIMARY KEY (qid);


--
-- Name: users users_mail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_mail_key UNIQUE (mail);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_u_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_u_name_key UNIQUE (u_name);


--
-- Name: watchlists watchlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT watchlists_pkey PRIMARY KEY (m_id, u_id);


--
-- Name: users set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- Name: watchlists set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.watchlists FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- Name: answers fk_q_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_q_id FOREIGN KEY (q_id) REFERENCES public.quizs(qid);


--
-- Name: watchlists fk_u_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_u_id FOREIGN KEY (u_id) REFERENCES public.users(id);


--
-- Name: answers fk_u_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_u_id FOREIGN KEY (u_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

