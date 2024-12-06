--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

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
-- Name: activity_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_logs_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_logs (
    id bigint DEFAULT nextval('public.activity_logs_id_seq'::regclass) NOT NULL,
    user_id bigint NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.activity_logs OWNER TO postgres;

--
-- Name: ages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ages (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    image character varying(150) NOT NULL,
    priority integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ages OWNER TO postgres;

--
-- Name: ages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ages_id_seq OWNER TO postgres;

--
-- Name: ages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ages_id_seq OWNED BY public.ages.id;


--
-- Name: build_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.build_orders (
    id bigint NOT NULL,
    insights_id bigint NOT NULL,
    age character varying(150) NOT NULL,
    title character varying(150) NOT NULL,
    description text,
    image character varying(150) NOT NULL,
    step character varying(150) NOT NULL,
    priority integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.build_orders OWNER TO postgres;

--
-- Name: build_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.build_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.build_orders_id_seq OWNER TO postgres;

--
-- Name: build_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.build_orders_id_seq OWNED BY public.build_orders.id;


--
-- Name: category_insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_insights (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.category_insights OWNER TO postgres;

--
-- Name: category_insights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_insights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_insights_id_seq OWNER TO postgres;

--
-- Name: category_insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_insights_id_seq OWNED BY public.category_insights.id;


--
-- Name: contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contents (
    id bigint NOT NULL,
    groups_id bigint NOT NULL,
    page character varying(150) NOT NULL,
    field_types character varying(150) NOT NULL,
    field_value text,
    image character varying(150),
    label character varying(150),
    link character varying(100),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.contents OWNER TO postgres;

--
-- Name: contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contents_id_seq OWNER TO postgres;

--
-- Name: contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contents_id_seq OWNED BY public.contents.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    body text,
    image character varying(100) NOT NULL,
    link character varying(100),
    from_date timestamp(0) without time zone NOT NULL,
    to_date timestamp(0) without time zone NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: game_matches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.game_matches_id_seq OWNER TO postgres;

--
-- Name: game_matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_matches (
    id bigint DEFAULT nextval('public.game_matches_id_seq'::regclass) NOT NULL,
    match_id integer NOT NULL,
    started_at timestamp(0) without time zone NOT NULL,
    finished_at timestamp(0) without time zone,
    name character varying(191) NOT NULL,
    map character varying(191) NOT NULL,
    server character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.game_matches OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    page character varying(150) NOT NULL,
    slug character varying(150) NOT NULL,
    name character varying(150) NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: insight_age_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insight_age_resources (
    id bigint NOT NULL,
    insights_id bigint NOT NULL,
    resources_id bigint NOT NULL,
    age character varying(150) NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.insight_age_resources OWNER TO postgres;

--
-- Name: insight_age_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insight_age_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.insight_age_resources_id_seq OWNER TO postgres;

--
-- Name: insight_age_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insight_age_resources_id_seq OWNED BY public.insight_age_resources.id;


--
-- Name: insight_ages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insight_ages (
    insights_id bigint NOT NULL,
    ages_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.insight_ages OWNER TO postgres;

--
-- Name: insight_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insight_categories (
    insights_id bigint NOT NULL,
    category_insights_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.insight_categories OWNER TO postgres;

--
-- Name: insights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insights (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    image character varying(150),
    description text,
    difficulty character varying(150),
    population integer,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.insights OWNER TO postgres;

--
-- Name: insights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.insights_id_seq OWNER TO postgres;

--
-- Name: insights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insights_id_seq OWNED BY public.insights.id;


--
-- Name: match_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.match_teams_id_seq OWNER TO postgres;

--
-- Name: match_teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match_teams (
    id bigint DEFAULT nextval('public.match_teams_id_seq'::regclass) NOT NULL,
    match_id integer NOT NULL,
    team_id integer NOT NULL,
    aoe2net_id integer NOT NULL,
    civ character varying(191) NOT NULL,
    won boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.match_teams OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer DEFAULT nextval('public.migrations_id_seq'::regclass) NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass) NOT NULL,
    tokenable_type character varying(191) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(191) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_id_seq OWNER TO postgres;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id bigint DEFAULT nextval('public.players_id_seq'::regclass) NOT NULL,
    name character varying(191) NOT NULL,
    aoe2net_id integer,
    elo double precision DEFAULT '1'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    status character varying(255) DEFAULT '1'::character varying NOT NULL,
    avatar_url text,
    alias character varying(191),
    elo_unranked double precision DEFAULT '1000'::double precision,
    elo_1v1 double precision DEFAULT '0'::double precision,
    elo_team double precision DEFAULT '0'::double precision,
    meta_data json,
    drops double precision DEFAULT '0'::double precision NOT NULL,
    streak double precision DEFAULT '0'::double precision NOT NULL,
    last_win_count double precision DEFAULT '0'::double precision NOT NULL,
    last_lose_count double precision DEFAULT '0'::double precision NOT NULL,
    final_elo double precision DEFAULT '0'::double precision NOT NULL,
    crown character varying(191)
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: COLUMN players.drops; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.players.drops IS 'Number of drops';


--
-- Name: COLUMN players.streak; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.players.streak IS 'Current win/loss streak';


--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    image character varying(150),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.resources OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resources_id_seq OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_id_seq OWNED BY public.resources.id;


--
-- Name: sponsors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sponsors (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    image character varying(100),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sponsors OWNER TO postgres;

--
-- Name: sponsors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sponsors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sponsors_id_seq OWNER TO postgres;

--
-- Name: sponsors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sponsors_id_seq OWNED BY public.sponsors.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    name character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(191) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: ages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ages ALTER COLUMN id SET DEFAULT nextval('public.ages_id_seq'::regclass);


--
-- Name: build_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.build_orders ALTER COLUMN id SET DEFAULT nextval('public.build_orders_id_seq'::regclass);


--
-- Name: category_insights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_insights ALTER COLUMN id SET DEFAULT nextval('public.category_insights_id_seq'::regclass);


--
-- Name: contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents ALTER COLUMN id SET DEFAULT nextval('public.contents_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: insight_age_resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_age_resources ALTER COLUMN id SET DEFAULT nextval('public.insight_age_resources_id_seq'::regclass);


--
-- Name: insights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights ALTER COLUMN id SET DEFAULT nextval('public.insights_id_seq'::regclass);


--
-- Name: resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources ALTER COLUMN id SET DEFAULT nextval('public.resources_id_seq'::regclass);


--
-- Name: sponsors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors ALTER COLUMN id SET DEFAULT nextval('public.sponsors_id_seq'::regclass);


--
-- Data for Name: activity_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity_logs (id, user_id, description, created_at, updated_at) FROM stdin;
1	2	User Tarikh logged in.	2024-05-19 08:40:59	2024-05-19 08:40:59
2	5	User bligung@indoaoe.com logged in.	2024-05-19 08:52:54	2024-05-19 08:52:54
3	5	User Bli Gung logged in.	2024-05-19 08:55:27	2024-05-19 08:55:27
4	5	User Bli Gung logged in.	2024-05-20 09:14:00	2024-05-20 09:14:00
5	5	User Bli Gung logged in.	2024-05-20 09:15:08	2024-05-20 09:15:08
6	2	User Tarikh logged in.	2024-05-20 09:22:55	2024-05-20 09:22:55
7	2	User Tarikh logged in.	2024-05-20 09:24:55	2024-05-20 09:24:55
8	2	User Tarikh logged in.	2024-05-22 06:56:49	2024-05-22 06:56:49
9	2	User Tarikh updated player _WOWER_ to elo 70.	2024-05-22 06:56:58	2024-05-22 06:56:58
10	3	User Nugraha logged in.	2024-05-24 17:50:44	2024-05-24 17:50:44
11	3	User Nugraha updated player _WOWER_ to elo 70.	2024-05-24 17:51:07	2024-05-24 17:51:07
12	3	User Nugraha updated player _WOWER_ to elo 70.	2024-05-24 17:51:27	2024-05-24 17:51:27
13	3	User Nugraha updated player _WOWER_ to elo 65.	2024-05-24 17:57:18	2024-05-24 17:57:18
14	3	User Nugraha logged in.	2024-05-24 18:15:21	2024-05-24 18:15:21
15	3	User Nugraha updated player Seven to elo 30.	2024-05-24 18:16:38	2024-05-24 18:16:38
16	5	User Bli Gung logged in.	2024-05-24 18:22:15	2024-05-24 18:22:15
17	3	User Nugraha logged in.	2024-05-25 09:32:30	2024-05-25 09:32:30
18	3	User Nugraha updated player pianiskadabra to elo 70.	2024-05-25 09:32:46	2024-05-25 09:32:46
19	2	User Tarikh logged in.	2024-05-26 07:40:06	2024-05-26 07:40:06
20	3	User Nugraha logged in.	2024-05-27 02:16:18	2024-05-27 02:16:18
21	3	User Nugraha updated player Behind You to elo 85.	2024-05-27 02:26:21	2024-05-27 02:26:21
22	3	User Nugraha updated player _WOWER_ to elo 65.	2024-05-27 02:26:35	2024-05-27 02:26:35
23	3	User Nugraha logged in.	2024-05-27 12:25:37	2024-05-27 12:25:37
24	3	User Nugraha logged in.	2024-05-27 12:53:21	2024-05-27 12:53:21
25	3	User Nugraha updated player Bang Gere to elo 60.	2024-05-27 12:53:23	2024-05-27 12:53:23
26	3	User Nugraha updated player Bang Gere to elo 55.	2024-05-27 12:54:33	2024-05-27 12:54:33
27	3	User Nugraha updated player Deri_indra to elo 65.	2024-05-27 12:57:30	2024-05-27 12:57:30
28	3	User Nugraha updated player Bang Gere to elo 50.	2024-05-27 14:02:15	2024-05-27 14:02:15
29	3	User Nugraha logged in.	2024-05-27 22:22:11	2024-05-27 22:22:11
30	2	User Tarikh logged in.	2024-05-28 02:25:29	2024-05-28 02:25:29
31	2	User Tarikh updated player Mbok Jamu to elo 75.	2024-05-28 02:25:57	2024-05-28 02:25:57
32	3	User Nugraha logged in.	2024-05-28 02:58:22	2024-05-28 02:58:22
33	3	User Nugraha updated player Satpol PP to elo 85.	2024-05-28 02:58:34	2024-05-28 02:58:34
34	3	User Nugraha logged in.	2024-05-28 10:23:27	2024-05-28 10:23:27
35	3	User Nugraha logged in.	2024-05-29 01:43:21	2024-05-29 01:43:21
36	3	User Nugraha updated player _WOWER_ to elo 65.	2024-05-29 02:05:54	2024-05-29 02:05:54
37	3	User Nugraha updated player _WOWER_ to elo 65.	2024-05-29 02:08:21	2024-05-29 02:08:21
38	3	User Nugraha logged in.	2024-05-30 10:52:39	2024-05-30 10:52:39
39	3	User Nugraha updated player Enf_fff to elo 75.	2024-05-30 10:53:16	2024-05-30 10:53:16
40	3	User Nugraha updated player Nep to elo 95.	2024-05-30 10:55:27	2024-05-30 10:55:27
41	3	User Nugraha updated player Nep to elo 95.	2024-05-30 10:55:39	2024-05-30 10:55:39
42	3	User Nugraha updated player Nep to elo 95.	2024-05-30 10:55:56	2024-05-30 10:55:56
43	2	User Tarikh logged in.	2024-05-31 07:06:15	2024-05-31 07:06:15
44	2	User Tarikh updated player Bang Gere to elo 50.	2024-05-31 07:06:29	2024-05-31 07:06:29
45	2	User Tarikh updated player _WOWER_ to elo 65.	2024-05-31 07:07:21	2024-05-31 07:07:21
46	2	User Tarikh logged in.	2024-05-31 15:27:08	2024-05-31 15:27:08
47	5	User Bli Gung logged in.	2024-05-31 17:26:56	2024-05-31 17:26:56
48	5	User Bli Gung logged in.	2024-06-08 15:21:53	2024-06-08 15:21:53
49	3	User Nugraha logged in.	2024-06-08 15:58:45	2024-06-08 15:58:45
50	3	User Nugraha updated player The Godeg's to elo 65.	2024-06-08 15:58:55	2024-06-08 15:58:55
51	3	User Nugraha updated player Nep to elo 100.	2024-06-08 16:45:27	2024-06-08 16:45:27
52	3	User Nugraha updated player The Godeg's to elo 68.	2024-06-08 18:07:01	2024-06-08 18:07:01
53	3	User Nugraha updated player The Godeg's to elo 70.	2024-06-08 18:07:05	2024-06-08 18:07:05
54	3	User Nugraha updated player Nukasep to elo 70.	2024-06-08 18:56:13	2024-06-08 18:56:13
55	5	User Bli Gung logged in.	2024-06-09 06:18:08	2024-06-09 06:18:08
56	4	User pc@indoaoe.com logged in.	2024-06-09 12:29:40	2024-06-09 12:29:40
57	4	User pc@indoaoe.com updated player Bagas to elo 90.	2024-06-09 12:29:58	2024-06-09 12:29:58
58	2	User Tarikh logged in.	2024-06-25 22:29:17	2024-06-25 22:29:17
59	2	User Tarikh updated player Panglima to elo 70.	2024-06-25 22:29:58	2024-06-25 22:29:58
60	2	User Tarikh updated player Panglima to elo 70.	2024-06-25 22:30:05	2024-06-25 22:30:05
61	2	User Tarikh logged in.	2024-06-26 01:27:48	2024-06-26 01:27:48
62	2	User Tarikh updated player Panglima to elo 75.	2024-06-26 01:28:07	2024-06-26 01:28:07
63	5	User Bli Gung logged in.	2024-06-29 11:28:36	2024-06-29 11:28:36
64	3	User Nugraha logged in.	2024-07-13 09:46:09	2024-07-13 09:46:09
65	3	User Nugraha logged in.	2024-07-13 11:34:54	2024-07-13 11:34:54
66	3	User Nugraha updated player KamuBohong to elo 40.	2024-07-13 11:35:56	2024-07-13 11:35:56
67	3	User Nugraha logged in.	2024-07-16 03:53:10	2024-07-16 03:53:10
68	3	User Nugraha updated player Mbok Jamu to elo 85.	2024-07-16 03:53:36	2024-07-16 03:53:36
69	3	User Nugraha logged in.	2024-07-17 10:14:17	2024-07-17 10:14:17
70	3	User Nugraha updated player Langittinggi to elo 45.	2024-07-17 10:14:41	2024-07-17 10:14:41
71	3	User Nugraha logged in.	2024-07-19 17:04:32	2024-07-19 17:04:32
72	3	User Nugraha logged in.	2024-07-21 10:22:18	2024-07-21 10:22:18
73	3	User Nugraha logged in.	2024-07-21 11:59:55	2024-07-21 11:59:55
74	3	User Nugraha updated player Langittinggi to elo 45.	2024-07-21 12:00:28	2024-07-21 12:00:28
75	3	User Nugraha logged in.	2024-07-26 00:51:14	2024-07-26 00:51:14
76	3	User Nugraha updated player Langittinggi to elo 45.	2024-07-26 00:51:23	2024-07-26 00:51:23
77	3	User Nugraha updated player stmboat to elo 60.	2024-07-26 00:51:48	2024-07-26 00:51:48
78	3	User Nugraha logged in.	2024-08-09 16:02:41	2024-08-09 16:02:41
79	3	User Nugraha logged in.	2024-08-12 00:59:26	2024-08-12 00:59:26
80	3	User Nugraha updated player Sheva to elo 50.	2024-08-12 00:59:47	2024-08-12 00:59:47
81	3	User Nugraha logged in.	2024-08-12 04:29:30	2024-08-12 04:29:30
82	3	User Nugraha updated player Langittinggi to elo 50.	2024-08-12 04:29:41	2024-08-12 04:29:41
83	3	User Nugraha logged in.	2024-08-13 15:35:50	2024-08-13 15:35:50
84	3	User Nugraha updated player KamuBohong to elo 40.	2024-08-13 15:37:09	2024-08-13 15:37:09
85	3	User Nugraha updated player K.B.X to elo 40.	2024-08-13 15:37:21	2024-08-13 15:37:21
86	3	User Nugraha updated player K.B.X to elo 45.	2024-08-13 15:37:26	2024-08-13 15:37:26
87	3	User Nugraha updated player Sheva to elo 50.	2024-08-13 15:45:04	2024-08-13 15:45:04
88	3	User Nugraha updated player xvier to elo 40.	2024-08-13 15:48:09	2024-08-13 15:48:09
89	3	User Nugraha logged in.	2024-08-14 13:52:57	2024-08-14 13:52:57
90	3	User Nugraha logged in.	2024-08-14 14:46:08	2024-08-14 14:46:08
91	3	User Nugraha updated player Sheva to elo 53.	2024-08-14 14:46:46	2024-08-14 14:46:46
92	3	User Nugraha logged in.	2024-08-15 02:19:41	2024-08-15 02:19:41
93	3	User Nugraha updated player Great Gali Djowo to elo 50.	2024-08-15 02:20:10	2024-08-15 02:20:10
94	3	User Nugraha logged in.	2024-08-24 13:34:25	2024-08-24 13:34:25
95	3	User Nugraha updated player Sheva to elo 45.	2024-08-24 13:34:43	2024-08-24 13:34:43
96	3	User Nugraha updated player flare to elo 70.	2024-08-24 17:00:21	2024-08-24 17:00:21
97	3	User Nugraha updated player flare to elo 73.	2024-08-24 17:06:54	2024-08-24 17:06:54
98	3	User Nugraha updated player flare to elo 75.	2024-08-24 17:36:59	2024-08-24 17:36:59
99	3	User Nugraha logged in.	2024-08-25 08:45:15	2024-08-25 08:45:15
100	3	User Nugraha updated player flare to elo 75.	2024-08-25 08:48:48	2024-08-25 08:48:48
101	3	User Nugraha logged in.	2024-09-02 00:53:12	2024-09-02 00:53:12
102	3	User Nugraha logged in.	2024-09-13 02:45:42	2024-09-13 02:45:42
103	3	User Nugraha logged in.	2024-10-09 00:58:10	2024-10-09 00:58:10
104	3	User Nugraha updated player KBX to elo 60.	2024-10-09 01:10:14	2024-10-09 01:10:14
105	3	User Nugraha updated player KBX to elo 45.	2024-10-09 01:13:22	2024-10-09 01:13:22
106	3	User Nugraha logged in.	2024-10-10 07:51:18	2024-10-10 07:51:18
107	3	User Nugraha updated player Nukasep to elo 75.	2024-10-10 07:51:31	2024-10-10 07:51:31
108	3	User Nugraha updated player _syu_ to elo 75.	2024-10-10 08:06:05	2024-10-10 08:06:05
109	3	User Nugraha updated player _syu_ to elo 75.	2024-10-10 08:07:43	2024-10-10 08:07:43
110	3	User Nugraha updated player Nukasep to elo 70.	2024-10-10 08:07:53	2024-10-10 08:07:53
111	3	User Nugraha updated player Mbok_Ijjah to elo 85.	2024-10-10 08:09:29	2024-10-10 08:09:29
112	3	User Nugraha updated player Mbok Jamu to elo 80.	2024-10-10 08:09:41	2024-10-10 08:09:41
113	3	User Nugraha updated player Eldarsono to elo 60.	2024-10-10 08:11:00	2024-10-10 08:11:00
114	3	User Nugraha updated player -[ V G B ]- to elo 80.	2024-10-10 08:15:17	2024-10-10 08:15:17
115	3	User Nugraha updated player Nukasep to elo 75.	2024-10-10 08:17:50	2024-10-10 08:17:50
116	3	User Nugraha logged in.	2024-10-12 06:17:47	2024-10-12 06:17:47
117	3	User Nugraha logged in.	2024-10-13 03:48:37	2024-10-13 03:48:37
118	3	User Nugraha updated player Jurig Asli to elo 55.	2024-10-13 03:49:05	2024-10-13 03:49:05
119	3	User Nugraha logged in.	2024-10-15 03:25:12	2024-10-15 03:25:12
120	3	User Nugraha logged in.	2024-10-15 04:32:43	2024-10-15 04:32:43
121	3	User Nugraha updated player Putri Cantik to elo 75.	2024-10-15 04:34:03	2024-10-15 04:34:03
122	3	User Nugraha updated player Abay Jampang to elo 70.	2024-10-15 04:35:19	2024-10-15 04:35:19
123	3	User Nugraha updated player KODOMO SAKIT to elo 65.	2024-10-15 04:36:20	2024-10-15 04:36:20
124	3	User Nugraha updated player Isabuya33 to elo 55.	2024-10-15 04:38:27	2024-10-15 04:38:27
125	3	User Nugraha logged in.	2024-10-17 10:54:25	2024-10-17 10:54:25
126	3	User Nugraha updated player Jurig to elo 55.	2024-10-17 10:54:52	2024-10-17 10:54:52
127	3	User Nugraha updated player Mbok Jamu to elo 80.	2024-10-17 10:55:34	2024-10-17 10:55:34
128	3	User Nugraha updated player Ahmadzizi to elo 60.	2024-10-17 10:55:57	2024-10-17 10:55:57
129	3	User Nugraha logged in.	2024-10-18 11:25:26	2024-10-18 11:25:26
130	3	User Nugraha updated player Jurig to elo 60.	2024-10-18 11:26:05	2024-10-18 11:26:05
131	3	User Nugraha logged in.	2024-10-18 16:49:32	2024-10-18 16:49:32
132	3	User Nugraha logged in.	2024-10-19 10:40:09	2024-10-19 10:40:09
133	3	User Nugraha updated player Kang LOKA to elo 50.	2024-10-19 10:40:28	2024-10-19 10:40:28
134	3	User Nugraha updated player Kang LOKA to elo 55.	2024-10-19 10:40:34	2024-10-19 10:40:34
135	3	User Nugraha logged in.	2024-10-19 12:47:18	2024-10-19 12:47:18
136	3	User Nugraha updated player Jurig to elo 55.	2024-10-19 12:47:53	2024-10-19 12:47:53
137	3	User Nugraha logged in.	2024-10-21 05:11:50	2024-10-21 05:11:50
138	3	User Nugraha updated player Sheva to elo 55.	2024-10-21 05:12:11	2024-10-21 05:12:11
139	3	User Nugraha logged in.	2024-10-23 04:39:25	2024-10-23 04:39:25
140	3	User Nugraha logged in.	2024-10-23 05:17:09	2024-10-23 05:17:09
141	3	User Nugraha updated player Perpendicular to elo 50.	2024-10-23 05:23:57	2024-10-23 05:23:57
142	3	User Nugraha updated player Mlempem to elo 45.	2024-10-23 05:24:34	2024-10-23 05:24:34
143	3	User Nugraha updated player Kudabinal to elo 45.	2024-10-23 05:24:53	2024-10-23 05:24:53
144	3	User Nugraha updated player Matahachiro to elo 45.	2024-10-23 05:25:18	2024-10-23 05:25:18
145	3	User Nugraha updated player Rieyuuk to elo 50.	2024-10-23 05:25:57	2024-10-23 05:25:57
146	3	User Nugraha updated player KAEL to elo 55.	2024-10-23 05:28:11	2024-10-23 05:28:11
147	3	User Nugraha logged in.	2024-10-23 07:33:54	2024-10-23 07:33:54
148	3	User Nugraha logged in.	2024-10-23 07:39:06	2024-10-23 07:39:06
149	3	User Nugraha updated player Biru_Hantara to elo 65.	2024-10-23 07:39:26	2024-10-23 07:39:26
150	3	User Nugraha logged in.	2024-10-23 17:01:21	2024-10-23 17:01:21
151	3	User Nugraha updated player Kang LOKA to elo 60.	2024-10-23 17:04:24	2024-10-23 17:04:24
152	3	User Nugraha updated player Loka to elo 60.	2024-10-23 17:04:32	2024-10-23 17:04:32
153	3	User Nugraha logged in.	2024-10-25 23:17:44	2024-10-25 23:17:44
154	3	User Nugraha updated player Shira to elo 100.	2024-10-25 23:18:16	2024-10-25 23:18:16
155	3	User Nugraha logged in.	2024-10-26 08:16:44	2024-10-26 08:16:44
156	3	User Nugraha logged in.	2024-10-26 08:16:52	2024-10-26 08:16:52
157	3	User Nugraha logged in.	2024-10-26 08:18:06	2024-10-26 08:18:06
158	3	User Nugraha logged in.	2024-10-28 03:01:25	2024-10-28 03:01:25
159	3	User Nugraha logged in.	2024-10-30 05:07:07	2024-10-30 05:07:07
160	3	User Nugraha updated player Bagas to elo 90.	2024-10-30 05:25:40	2024-10-30 05:25:40
161	3	User Nugraha updated player Bagas to elo 90.	2024-10-30 05:30:29	2024-10-30 05:30:29
\.


--
-- Data for Name: ages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ages (id, name, image, priority, deleted_at, created_at, updated_at) FROM stdin;
1	Dark Age	images/ages/01JDP09NDJFHKEGYP24YENGG1J.png	1	\N	2024-11-27 05:07:56	2024-11-27 05:07:56
2	Feudal Age	images/ages/01JDP0AE6TCZSB0PCSYNA9Y67F.png	2	\N	2024-11-27 05:08:21	2024-11-27 05:08:21
3	Castle Age	images/ages/01JDP0B6WJD4JQM5ZV47J11P9M.png	3	\N	2024-11-27 05:08:47	2024-11-27 05:08:47
\.


--
-- Data for Name: build_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.build_orders (id, insights_id, age, title, description, image, step, priority, deleted_at, created_at, updated_at) FROM stdin;
1	1	Dark Age	Queue Villagers	Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad. Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade. 	images/build_orders/01JDP0Q6YV2BG8F2FKZM5H7JAF.png	3	1	\N	2024-11-27 05:15:20	2024-11-27 05:15:20
2	1	Dark Age	Build 2 Houses	Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad. Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade. 	images/build_orders/01JDP4ZR8TP26DV9WPJYXAEZ4D.png	3	2	\N	2024-11-27 06:29:54	2024-11-27 06:29:54
3	1	Dark Age	6 on Sheep	Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad. Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade. 	images/build_orders/01JDP50ZBCQH8X9AGSW63BDHJG.png	?	1	\N	2024-11-27 06:30:34	2024-11-27 06:30:34
4	1	Feudal Age	Queue Villagers to Mining Camp	Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad. Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade. 	images/build_orders/01JDP52QD97863DYCXRV1BP6CG.png	19-23	1	\N	2024-11-27 06:31:32	2024-11-27 06:31:32
5	1	Feudal Age	Upgrade Double-Bit Axe	Lörem ipsum kron pineren. Planat ditesade begen förutom parasöligt kontratism. Du kan vara drabbad. Traböliga ren och spotifiera kropesade för kora. Föjont poras, tul, hess tinera ossade. 	images/build_orders/01JDP53SGP4Z1WKH4J6BQCX9JA.png	19-23	2	\N	2024-11-27 06:32:06	2024-11-27 06:32:06
\.


--
-- Data for Name: category_insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_insights (id, name, deleted_at, created_at, updated_at) FROM stdin;
1	Build Order	\N	2024-11-26 16:24:21	2024-11-26 16:24:21
2	Build Civ	\N	2024-11-27 05:09:58	2024-11-27 05:09:58
\.


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contents (id, groups_id, page, field_types, field_value, image, label, link, deleted_at, created_at, updated_at) FROM stdin;
3	1	home	image	\N	images/contents/01JDP017X9MTD0K995B03NGBDS.png	\N	images/contents/01JDP00K6QZ59AD9024X6PVCTC.png	\N	2024-11-27 05:02:59	2024-11-27 05:03:20
4	2	insight	text	INSIGHTS	\N	\N	\N	\N	2024-11-27 07:16:40	2024-11-27 07:16:40
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, title, body, image, link, from_date, to_date, deleted_at, created_at, updated_at) FROM stdin;
1	Grand Final	\N	images/events/01JDRWD1HSY2P8MZN3EQM320GM.png	\N	2024-11-28 14:57:24	2024-12-04 14:57:27	\N	2024-11-28 07:57:36	2024-11-28 07:57:36
\.


--
-- Data for Name: game_matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_matches (id, match_id, started_at, finished_at, name, map, server, created_at, updated_at) FROM stdin;
2513	354624201	2024-11-26 18:38:19	2024-11-26 19:27:19	INDO	rm_land_nomad	\N	2024-11-27 03:27:39	2024-11-27 03:27:39
2514	354617712	2024-11-26 18:02:15	2024-11-26 18:31:36	Indo Masuk Angin	rm_land_nomad	\N	2024-11-27 03:27:39	2024-11-27 03:27:39
2515	354605424	2024-11-26 16:47:32	2024-11-26 17:18:38	Indo bus kedua	rm_land_nomad	\N	2024-11-27 03:27:39	2024-11-27 03:27:39
2516	354596409	2024-11-26 15:51:32	2024-11-26 16:42:32	Indo bus kedua	rm_land_nomad	\N	2024-11-27 03:27:39	2024-11-27 03:27:39
2517	354589782	2024-11-26 15:12:53	2024-11-26 15:43:33	Indo Masuk Angin	rm_land_nomad	\N	2024-11-27 03:27:39	2024-11-27 03:27:39
2518	352622334	2024-11-17 14:02:09	2024-11-17 14:46:09	Indo Clan League	rm_migration	\N	2024-11-27 03:27:42	2024-11-27 03:27:42
2519	352391888	2024-11-16 16:09:44	2024-11-16 16:42:18	Indo malming	rm_land_nomad	\N	2024-11-27 03:27:42	2024-11-27 03:27:42
2520	349408543	2024-11-02 15:20:41	2024-11-02 15:49:03	 Indo Pagi..  14	rm_land_nomad	\N	2024-11-27 03:27:42	2024-11-27 03:27:42
2521	349154310	2024-11-01 14:02:12	2024-11-01 14:50:43	Indo Clan League	rm_migration	\N	2024-11-27 03:27:42	2024-11-27 03:27:42
2522	347893944	2024-10-26 14:24:05	2024-10-26 14:54:57	Indo Clan Tourney	rm_migration	\N	2024-11-27 03:27:42	2024-11-27 03:27:42
2523	353671688	2024-11-22 14:57:34	2024-11-22 15:30:47	Indo OmG vs Cupu	rm_migration	\N	2024-11-27 03:27:46	2024-11-27 03:27:46
2524	353649227	2024-11-22 12:38:47	2024-11-22 13:09:58	IndoAOE	rm_land_nomad	\N	2024-11-27 03:27:46	2024-11-27 03:27:46
2525	353462971	2024-11-21 14:06:59	2024-11-21 14:38:41	IndoAOE	rm_land_nomad	\N	2024-11-27 03:27:46	2024-11-27 03:27:46
2526	353086362	2024-11-19 15:59:42	2024-11-19 16:38:34	Indo Only	rm_land_nomad	\N	2024-11-27 03:27:46	2024-11-27 03:27:46
2527	348379879	2024-10-28 16:31:09	2024-10-28 16:59:48	Indo Kebakaran	rm_arena	\N	2024-11-27 03:27:50	2024-11-27 03:27:50
2528	347931691	2024-10-26 17:14:54	2024-10-26 17:41:54	INDO MALAM	rm_nomad	\N	2024-11-27 03:27:50	2024-11-27 03:27:50
2529	347919465	2024-10-26 16:17:39	2024-10-26 16:49:15	Indonesia PANITIA OSPEK kembali	rm_nomad	\N	2024-11-27 03:27:50	2024-11-27 03:27:50
2530	345402712	2024-10-14 16:14:47	2024-10-14 16:47:01	Indo	rm_land_nomad	\N	2024-11-27 03:27:52	2024-11-27 03:27:52
2531	344913754	2024-10-12 14:05:19	2024-10-12 14:38:08	indo	rm_african_clearing	\N	2024-11-27 03:27:52	2024-11-27 03:27:52
2532	344722493	2024-10-11 16:54:46	2024-10-11 17:34:48	IndoAOE	rm_land_nomad	\N	2024-11-27 03:27:52	2024-11-27 03:27:52
2533	344521141	2024-10-10 16:35:39	2024-10-10 17:01:36	INDO	rm_land_nomad	\N	2024-11-27 03:27:52	2024-11-27 03:27:52
2534	354610371	2024-11-26 17:17:44	2024-11-26 17:57:30	Indo Masuk Angin	rm_land_nomad	\N	2024-11-27 03:27:55	2024-11-27 03:27:55
2535	354604112	2024-11-26 16:36:22	2024-11-26 17:12:38	Indo Masuk Angin	rm_land_nomad	\N	2024-11-27 03:27:55	2024-11-27 03:27:55
2536	354596663	2024-11-26 15:50:36	2024-11-26 16:31:39	Indo Masuk Angin	rm_land_nomad	\N	2024-11-27 03:27:55	2024-11-27 03:27:55
2537	349833451	2024-11-04 09:41:43	2024-11-04 10:09:48	indo jjs	rm_land_nomad	\N	2024-11-27 03:27:57	2024-11-27 03:27:57
2538	298630865	2024-03-14 09:34:49	2024-03-14 10:04:07	[Rematch] Indonesia	rm_arena	\N	2024-11-27 03:27:57	2024-11-27 03:27:57
2539	298206711	2024-03-12 08:52:32	2024-03-12 09:23:47	[Rematch] Indonesia	rm_land_nomad	\N	2024-11-27 03:27:57	2024-11-27 03:27:57
2540	298203455	2024-03-12 08:11:41	2024-03-12 08:42:05	Indonesia	rm_land_nomad	\N	2024-11-27 03:27:57	2024-11-27 03:27:57
2541	339594363	2024-09-16 09:46:54	2024-09-16 10:05:34	Go,. Indo 14	rm_land_nomad	\N	2024-11-27 03:28:00	2024-11-27 03:28:00
2542	346174501	2024-10-18 15:38:09	2024-10-18 16:09:20	INDO	rm_land_nomad	\N	2024-11-27 03:28:03	2024-11-27 03:28:03
2543	337718558	2024-09-07 05:22:51	2024-09-07 06:04:50	Indo	rm_land_nomad	\N	2024-11-27 03:28:03	2024-11-27 03:28:03
2544	325570590	2024-07-11 15:15:45	2024-07-11 15:50:18	AOE Indo 14 	rm_land_nomad	\N	2024-11-27 03:28:03	2024-11-27 03:28:03
2545	324774997	2024-07-07 15:29:13	2024-07-07 16:17:14	IndoAoe masuk	rm_land_nomad	\N	2024-11-27 03:28:03	2024-11-27 03:28:03
2546	324709913	2024-07-07 08:54:00	2024-07-07 09:50:59	Bis Indo	rm_land_nomad	\N	2024-11-27 03:28:03	2024-11-27 03:28:03
2547	288812970	2024-01-30 13:48:13	2024-01-30 14:23:08	Indo Ringan	rm_land_nomad	\N	2024-11-27 03:28:04	2024-11-27 03:28:04
2548	288617188	2024-01-29 14:16:13	2024-01-29 14:48:03	Indo AOE	rm_land_nomad	\N	2024-11-27 03:28:04	2024-11-27 03:28:04
2549	288416570	2024-01-28 16:18:22	2024-01-28 16:45:13	Indo Ringan	rm_land_nomad	\N	2024-11-27 03:28:04	2024-11-27 03:28:04
2550	288407681	2024-01-28 15:46:46	2024-01-28 16:11:09	Indo Ringan	rm_land_nomad	\N	2024-11-27 03:28:04	2024-11-27 03:28:04
2551	354407630	2024-11-25 16:41:02	2024-11-25 17:12:14	INDO	rm_land_nomad	\N	2024-11-27 03:28:07	2024-11-27 03:28:07
2552	354377883	2024-11-25 13:28:20	2024-11-25 14:21:15	Indo santai	rm_land_nomad	\N	2024-11-27 03:28:10	2024-11-27 03:28:10
2553	354112608	2024-11-24 09:22:56	2024-11-24 09:59:11	indo pemanasin	rm_land_nomad	\N	2024-11-27 03:28:10	2024-11-27 03:28:10
2554	352383224	2024-11-16 15:23:36	2024-11-16 15:57:51	Indo malming	rm_land_nomad	\N	2024-11-27 03:28:10	2024-11-27 03:28:10
2555	354578855	2024-11-26 13:55:57	2024-11-26 14:22:53	IndoAOE	rm_land_nomad	\N	2024-11-27 03:28:12	2024-11-27 03:28:12
2556	354571857	2024-11-26 13:21:13	2024-11-26 13:50:37	IndoAOE	rm_land_nomad	\N	2024-11-27 03:28:12	2024-11-27 03:28:12
2557	354405292	2024-11-25 16:27:47	2024-11-25 17:06:57	Indo santai	rm_land_nomad	\N	2024-11-27 03:28:12	2024-11-27 03:28:12
2558	354160613	2024-11-24 14:13:37	2024-11-24 14:40:39	Indo Clan War Bifi vs Vesper	rm_migration	\N	2024-11-27 03:28:16	2024-11-27 03:28:16
2559	352367122	2024-11-16 14:40:26	2024-11-16 15:12:00	Indo Clan War Omg vs Vesper	rm_migration	\N	2024-11-27 03:28:16	2024-11-27 03:28:16
2560	350627424	2024-11-08 14:22:15	2024-11-08 14:56:15	Indo Clan War - Migration	rm_migration	\N	2024-11-27 03:28:16	2024-11-27 03:28:16
2561	278286083	2023-12-14 11:49:57	2023-12-14 12:20:29	Bus Indo Ngacir	rm_arena	\N	2024-11-27 03:28:18	2024-11-27 03:28:18
2562	278129534	2023-12-13 15:46:16	2023-12-13 16:18:56	Indo Aoe 	rm_land_nomad	\N	2024-11-27 03:28:18	2024-11-27 03:28:18
2563	278110776	2023-12-13 13:54:57	2023-12-13 14:49:28	Indonesia	rm_land_nomad	\N	2024-11-27 03:28:18	2024-11-27 03:28:18
2564	277919025	2023-12-12 14:20:48	2023-12-12 15:00:43	 AOE INDO	rm_land_nomad	\N	2024-11-27 03:28:18	2024-11-27 03:28:18
2565	272266171	2023-11-16 14:46:45	2023-11-16 15:16:10	INDO 1 KOMANDO	rm_land_nomad	\N	2024-11-27 03:28:18	2024-11-27 03:28:18
2566	252837731	2023-08-12 17:03:31	2023-08-12 17:48:10	Bus Indo	rm_land_nomad	\N	2024-11-27 03:28:20	2024-11-27 03:28:20
2567	252830204	2023-08-12 16:25:13	2023-08-12 16:57:01	Bus Indo	rm_land_nomad	\N	2024-11-27 03:28:20	2024-11-27 03:28:20
2568	252820110	2023-08-12 15:30:55	2023-08-12 16:17:48	Indonesia	rm_land_nomad	\N	2024-11-27 03:28:20	2024-11-27 03:28:20
2569	252816422	2023-08-12 15:22:33	2023-08-12 19:46:21	Bus Indo	rm_land_nomad	\N	2024-11-27 03:28:20	2024-11-27 03:28:20
2570	243666796	2023-06-30 16:32:35	2023-06-30 17:02:36	Bis Indo Only	rm_hill-fort	\N	2024-11-27 03:28:20	2024-11-27 03:28:20
2571	347654767	2024-10-25 14:19:53	2024-10-25 14:52:55	Indo Cupu vs Vesper 4v4	rm_migration	\N	2024-11-27 03:28:23	2024-11-27 03:28:23
2572	345968918	2024-10-17 15:15:45	2024-10-17 15:41:53	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:28:23	2024-11-27 03:28:23
2573	345962982	2024-10-17 14:38:44	2024-10-17 15:09:10	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:28:23	2024-11-27 03:28:23
2574	354160975	2024-11-24 14:15:26	2024-11-24 14:52:33	Xbow vs Lowelo Indo	rm_migration	\N	2024-11-27 03:28:25	2024-11-27 03:28:25
2575	351746165	2024-11-13 15:41:39	2024-11-13 16:19:58	INDO	rm_land_nomad	\N	2024-11-27 03:28:25	2024-11-27 03:28:25
2576	351736982	2024-11-13 14:40:53	2024-11-13 15:34:32	Indo Masuk LN	rm_land_nomad	\N	2024-11-27 03:28:25	2024-11-27 03:28:25
2577	351731473	2024-11-13 14:07:42	2024-11-13 14:37:33	Indo Masuk LN	rm_land_nomad	\N	2024-11-27 03:28:25	2024-11-27 03:28:25
2578	352401652	2024-11-16 16:49:28	2024-11-16 17:24:06	Indo malming	rm_land_nomad	\N	2024-11-27 03:28:28	2024-11-27 03:28:28
2579	215318195	2023-03-03 14:56:53	2023-03-03 15:13:25	TIM NOOB INDONESIA	rm_land_nomad	\N	2024-11-27 03:28:30	2024-11-27 03:28:30
2580	210623462	2023-02-15 14:23:10	2023-02-15 14:43:27	INDO BF ECO RACING	rm_black-forest	\N	2024-11-27 03:28:30	2024-11-27 03:28:30
2581	207739109	2023-02-06 15:45:01	2023-02-06 16:34:31	Indonesia	rm_land_nomad	\N	2024-11-27 03:28:30	2024-11-27 03:28:30
2582	352878061	2024-11-18 15:44:15	2024-11-18 16:27:54	INDO KALEM	rm_land_nomad	\N	2024-11-27 03:28:33	2024-11-27 03:28:33
2583	352611833	2024-11-17 13:07:01	2024-11-17 13:45:23	IndoAOE	rm_land_nomad	\N	2024-11-27 03:28:33	2024-11-27 03:28:33
2584	353950628	2024-11-23 17:44:22	2024-11-23 18:13:53	Indo Panggang	rm_land_nomad	\N	2024-11-27 03:28:36	2024-11-27 03:28:36
2585	353941899	2024-11-23 17:05:26	2024-11-23 17:39:36	Indo Panggang	rm_land_nomad	\N	2024-11-27 03:28:36	2024-11-27 03:28:36
2586	353907551	2024-11-23 14:30:40	2024-11-23 15:18:35	Indo Panggang	rm_land_nomad	\N	2024-11-27 03:28:36	2024-11-27 03:28:36
2587	353900299	2024-11-23 13:59:20	2024-11-23 14:26:38	Indo Panggang	rm_land_nomad	\N	2024-11-27 03:28:36	2024-11-27 03:28:36
2588	352612694	2024-11-17 13:07:10	2024-11-17 13:50:24	Indo only	rm_land_nomad	\N	2024-11-27 03:28:36	2024-11-27 03:28:36
2589	344101115	2024-10-08 13:24:27	2024-10-08 13:54:49	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:28:38	2024-11-27 03:28:38
2590	225601286	2023-04-11 10:12:00	2023-04-11 10:43:10	Indonesia	rm_land_nomad	\N	2024-11-27 03:28:40	2024-11-27 03:28:40
2591	200578876	2023-01-08 08:59:46	2023-01-08 19:25:05	Indonesia	rm_land_nomad	\N	2024-11-27 03:28:40	2024-11-27 03:28:40
2592	200573874	2023-01-08 08:22:47	2023-01-08 08:52:47	Indonesia	rm_land_nomad	\N	2024-11-27 03:28:40	2024-11-27 03:28:40
2593	199493566	2023-01-03 05:55:39	2023-01-03 06:17:11	indoaoe	rm_arabia	\N	2024-11-27 03:28:41	2024-11-27 03:28:41
2594	197537988	2022-12-24 19:55:22	2022-12-24 20:55:30	INDONESIA	rm_land_nomad	\N	2024-11-27 03:28:41	2024-11-27 03:28:41
2595	328174812	2024-07-23 15:53:14	2024-07-23 16:34:42	Indo ga AFK	rm_land_nomad	\N	2024-11-27 03:28:43	2024-11-27 03:28:43
2596	328165544	2024-07-23 15:04:40	2024-07-23 15:46:32	Indo ga AFK	rm_land_nomad	\N	2024-11-27 03:28:43	2024-11-27 03:28:43
2597	328153825	2024-07-23 14:09:35	2024-07-23 14:57:47	Indo ga AFK	rm_land_nomad	\N	2024-11-27 03:28:43	2024-11-27 03:28:43
2598	327750788	2024-07-21 15:40:24	2024-07-21 16:18:14	AOE Indo Fun Match	rm_land_nomad	\N	2024-11-27 03:28:43	2024-11-27 03:28:43
2599	327742028	2024-07-21 15:00:00	2024-07-21 15:36:56	AOE Indo Fun Match	rm_land_nomad	\N	2024-11-27 03:28:43	2024-11-27 03:28:43
2600	353919230	2024-11-23 15:28:12	2024-11-23 16:09:39	Indo Panggang	rm_land_nomad	\N	2024-11-27 03:28:47	2024-11-27 03:28:47
2601	353701635	2024-11-22 17:35:46	2024-11-22 18:35:02	Indo Only	rm_land_nomad	\N	2024-11-27 03:28:47	2024-11-27 03:28:47
2602	353276372	2024-11-20 15:24:51	2024-11-20 15:56:03	Indo santai	rm_land_nomad	\N	2024-11-27 03:28:47	2024-11-27 03:28:47
2603	354397313	2024-11-25 15:35:23	2024-11-25 16:14:46	INDO	rm_land_nomad	\N	2024-11-27 03:28:49	2024-11-27 03:28:49
2604	295633227	2024-03-01 12:22:24	2024-03-01 12:41:36	Indo hepi hepi	rm_land_nomad	\N	2024-11-27 03:28:52	2024-11-27 03:28:52
2605	281029497	2023-12-27 09:20:04	2023-12-27 09:50:29	 AOE INDO	rm_land_nomad	\N	2024-11-27 03:28:52	2024-11-27 03:28:52
2606	280795869	2023-12-26 08:21:06	2023-12-26 08:45:00	Bis Indo	rm_land_nomad	\N	2024-11-27 03:28:52	2024-11-27 03:28:52
2607	280789433	2023-12-26 07:19:19	2023-12-26 08:17:48	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:28:52	2024-11-27 03:28:52
2608	351322308	2024-11-11 12:33:24	2024-11-11 13:07:15	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:28:55	2024-11-27 03:28:55
2609	346417070	2024-10-19 15:41:18	2024-10-19 17:10:10	Indo Berlatih 1	rm_arena	\N	2024-11-27 03:28:55	2024-11-27 03:28:55
2610	346395064	2024-10-19 14:10:36	2024-10-19 15:21:56	Indo AOE x Vosamis.id FFA\r	rm_migration	\N	2024-11-27 03:28:55	2024-11-27 03:28:55
2611	320263634	2024-06-16 08:55:28	2024-06-16 09:35:12	Nusantara (indo only)	rm_african_clearing	\N	2024-11-27 03:28:57	2024-11-27 03:28:57
2612	320255590	2024-06-16 08:05:05	2024-06-16 08:40:02	Bis Indo	rm_land_nomad	\N	2024-11-27 03:28:57	2024-11-27 03:28:57
2613	320249502	2024-06-16 07:08:22	2024-06-16 07:48:06	Bis Indo	rm_land_nomad	\N	2024-11-27 03:28:57	2024-11-27 03:28:57
2614	320245065	2024-06-16 06:42:23	2024-06-16 07:00:37	Indo Main Anti RIbet	rm_land_nomad	\N	2024-11-27 03:28:57	2024-11-27 03:28:57
2615	320232539	2024-06-16 05:31:35	2024-06-16 06:18:52	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:28:57	2024-11-27 03:28:57
2616	231361975	2023-05-05 13:37:23	2023-05-05 14:01:35	IndoGazzz	rm_land_nomad	\N	2024-11-27 03:28:59	2024-11-27 03:28:59
2617	209347878	2023-02-11 14:12:03	2023-02-11 14:40:23	Indonesia	rm_land_nomad	\N	2024-11-27 03:28:59	2024-11-27 03:28:59
2618	204812643	2023-01-29 13:02:19	2023-01-29 13:50:32	Indonesia Fun Game	rm_nomad	\N	2024-11-27 03:29:00	2024-11-27 03:29:00
2619	204158972	2023-01-26 13:03:06	2023-01-26 13:45:11	Indonesia Fun Game	rm_nomad	\N	2024-11-27 03:29:00	2024-11-27 03:29:00
2620	346334447	2024-10-19 07:16:04	2024-10-19 07:49:50	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:29:02	2024-11-27 03:29:02
2621	346327573	2024-10-19 06:20:46	2024-10-19 07:10:54	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:29:02	2024-11-27 03:29:02
2622	322852828	2024-06-28 15:01:30	2024-06-28 15:17:40	Indo SUMMER TURNAMEN	rm_african_clearing	\N	2024-11-27 03:29:03	2024-11-27 03:29:03
2623	255581631	2023-08-26 12:35:44	2023-08-26 12:59:06	indo black forest (restore)	rm_land_nomad	\N	2024-11-27 03:29:04	2024-11-27 03:29:04
2624	255577381	2023-08-26 12:17:00	2023-08-26 12:33:06	indo black forest	rm_land_nomad	\N	2024-11-27 03:29:05	2024-11-27 03:29:05
2625	346165177	2024-10-18 14:46:37	2024-10-18 15:32:13	INDO	rm_land_nomad	\N	2024-11-27 03:29:09	2024-11-27 03:29:09
2626	346158738	2024-10-18 14:13:18	2024-10-18 14:42:57	INDO	rm_land_nomad	\N	2024-11-27 03:29:09	2024-11-27 03:29:09
2627	344107082	2024-10-08 13:59:50	2024-10-08 14:27:12	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:29:12	2024-11-27 03:29:12
2628	343095777	2024-10-03 14:35:26	2024-10-03 15:21:17	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:29:12	2024-11-27 03:29:12
2629	343090325	2024-10-03 13:59:28	2024-10-03 14:26:37	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:29:12	2024-11-27 03:29:12
2630	343084006	2024-10-03 13:21:34	2024-10-03 13:52:58	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:29:12	2024-11-27 03:29:12
2631	354395365	2024-11-25 15:23:35	2024-11-25 16:19:06	Indo Gas bablas	rm_land_nomad	\N	2024-11-27 03:29:14	2024-11-27 03:29:14
2632	354386457	2024-11-25 14:27:33	2024-11-25 15:15:22	Indo Gas bablas	rm_land_nomad	\N	2024-11-27 03:29:14	2024-11-27 03:29:14
2633	320758461	2024-06-18 16:01:22	2024-06-18 16:34:37	[Rematch] Bus Empuk Indo	rm_land_nomad	\N	2024-11-27 03:29:20	2024-11-27 03:29:20
2634	320747468	2024-06-18 15:09:04	2024-06-18 15:46:25	[Rematch] Bus Empuk Indo	rm_land_nomad	\N	2024-11-27 03:29:20	2024-11-27 03:29:20
2635	320538353	2024-06-17 14:33:15	2024-06-17 14:57:51	[Rematch] Bus Empuk Indo	rm_land_nomad	\N	2024-11-27 03:29:20	2024-11-27 03:29:20
2636	294578468	2024-02-25 08:38:43	2024-02-25 09:09:42	Indo Ringan	rm_land_nomad	\N	2024-11-27 03:29:22	2024-11-27 03:29:22
2637	294574604	2024-02-25 08:08:06	2024-02-25 08:29:44	INDONESIA LOW ELO	rm_land_nomad	\N	2024-11-27 03:29:22	2024-11-27 03:29:22
2638	294570240	2024-02-25 07:31:59	2024-02-25 08:00:44	INDONESIA LOW ELO	rm_land_nomad	\N	2024-11-27 03:29:22	2024-11-27 03:29:22
2639	317484256	2024-06-03 12:35:32	2024-06-03 13:08:27	4 vs 4, indo	rm_land_nomad	\N	2024-11-27 03:29:24	2024-11-27 03:29:24
2640	341123639	2024-09-23 18:34:27	2024-09-23 19:28:03	INDO	rm_land_nomad	\N	2024-11-27 03:29:28	2024-11-27 03:29:28
2641	341114771	2024-09-23 17:52:54	2024-09-23 18:28:04	INDO	rm_land_nomad	\N	2024-11-27 03:29:28	2024-11-27 03:29:28
2642	341101472	2024-09-23 16:31:02	2024-09-23 16:54:47	INDO	rm_land_nomad	\N	2024-11-27 03:29:28	2024-11-27 03:29:28
2643	341079862	2024-09-23 14:20:34	2024-09-23 14:53:31	INDO	rm_land_nomad	\N	2024-11-27 03:29:28	2024-11-27 03:29:28
2644	340924349	2024-09-22 18:46:03	2024-09-22 19:27:30	INDO	rm_amazon_tunnels	\N	2024-11-27 03:29:28	2024-11-27 03:29:28
2645	344526432	2024-10-10 17:13:33	2024-10-10 17:58:04	INDO	rm_african_clearing	\N	2024-11-27 03:29:31	2024-11-27 03:29:31
2646	278502808	2023-12-15 14:42:31	2023-12-15 15:10:23	Indo Aoe 	rm_land_nomad	\N	2024-11-27 03:29:31	2024-11-27 03:29:31
2647	278465530	2023-12-15 10:00:41	2023-12-15 10:27:22	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:29:31	2024-11-27 03:29:31
2648	318094451	2024-06-06 15:08:32	2024-06-06 15:38:02	Indo Badut	rm_coastal_forest	\N	2024-11-27 03:29:38	2024-11-27 03:29:38
2649	129695071	2021-11-21 17:01:12	2021-11-21 17:30:19	Indonesia!	rm_african_clearing	\N	2024-11-27 03:29:40	2024-11-27 03:29:40
2650	129686309	2021-11-21 16:06:40	2021-11-21 16:52:27	AOEINDO (PRIVATE)	rm_african_clearing	\N	2024-11-27 03:29:40	2024-11-27 03:29:40
2651	352645661	2024-11-17 15:38:22	2024-11-17 16:18:06	Indo Gas bablas	rm_land_nomad	\N	2024-11-27 03:29:42	2024-11-27 03:29:42
2652	352124897	2024-11-15 13:53:28	2024-11-15 14:24:05	INDO NOMAD noob 3v3 4v4	rm_nomad	\N	2024-11-27 03:29:43	2024-11-27 03:29:43
2653	350890995	2024-11-09 16:07:32	2024-11-09 16:38:46	Indo Penghabisan	rm_land_nomad	\N	2024-11-27 03:29:43	2024-11-27 03:29:43
2654	350878474	2024-11-09 15:18:18	2024-11-09 15:59:44	Indo Masuk	rm_land_nomad	\N	2024-11-27 03:29:43	2024-11-27 03:29:43
2655	312276760	2024-05-11 12:17:36	2024-05-11 12:49:37	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:29:45	2024-11-27 03:29:45
2656	312043920	2024-05-10 13:07:12	2024-05-10 13:58:44	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:29:45	2024-11-27 03:29:45
2657	311800918	2024-05-09 09:45:35	2024-05-09 10:17:11	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:29:45	2024-11-27 03:29:45
2658	311794525	2024-05-09 08:50:10	2024-05-09 09:18:47	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:29:45	2024-11-27 03:29:45
2659	311789093	2024-05-09 08:02:50	2024-05-09 08:42:53	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:29:45	2024-11-27 03:29:45
2660	354118783	2024-11-24 10:12:55	2024-11-24 10:46:02	indo pemanasin	rm_land_nomad	\N	2024-11-27 03:29:48	2024-11-27 03:29:48
2661	292782285	2024-02-17 15:34:35	2024-02-17 15:57:28	Indonesia	rm_nomad	\N	2024-11-27 03:29:50	2024-11-27 03:29:50
2662	292769434	2024-02-17 14:55:34	2024-02-17 15:24:26	Indonesia	rm_land_nomad	\N	2024-11-27 03:29:50	2024-11-27 03:29:50
2663	248194308	2023-07-21 14:59:15	2023-07-21 15:25:07	indo	rm_arabia	\N	2024-11-27 03:29:50	2024-11-27 03:29:50
2664	248189066	2023-07-21 14:26:19	2023-07-21 14:52:37	indo	rm_land_nomad	\N	2024-11-27 03:29:50	2024-11-27 03:29:50
2665	350276298	2024-11-06 17:14:35	2024-11-06 17:48:24	Indo Masuk	rm_land_nomad	\N	2024-11-27 03:29:52	2024-11-27 03:29:52
2666	350270011	2024-11-06 16:32:29	2024-11-06 17:03:53	Indo bus malam	rm_land_nomad	\N	2024-11-27 03:29:52	2024-11-27 03:29:52
2667	350080627	2024-11-05 16:20:14	2024-11-05 16:46:30	INDO	rm_land_nomad	\N	2024-11-27 03:29:52	2024-11-27 03:29:52
2668	348769635	2024-10-30 16:18:33	2024-10-30 17:05:27	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:29:52	2024-11-27 03:29:52
2669	347920087	2024-10-26 16:23:50	2024-10-26 16:58:30	omg indo	rm_migration	\N	2024-11-27 03:29:52	2024-11-27 03:29:52
2670	350085115	2024-11-05 16:51:52	2024-11-05 17:23:33	INDO	rm_land_nomad	\N	2024-11-27 03:29:55	2024-11-27 03:29:55
2671	352648979	2024-11-17 15:47:28	2024-11-17 16:24:56	INDO	rm_land_nomad	\N	2024-11-27 03:29:57	2024-11-27 03:29:57
2672	335146874	2024-08-25 13:12:01	2024-08-25 13:45:53	Indo Low Elo	rm_african_clearing	\N	2024-11-27 03:30:00	2024-11-27 03:30:00
2673	332225616	2024-08-11 16:34:22	2024-08-11 17:05:02	indoAOE	rm_african_clearing	\N	2024-11-27 03:30:00	2024-11-27 03:30:00
2674	327742489	2024-07-21 15:08:26	2024-07-21 15:54:33	Indo Badut	rm_african_clearing	\N	2024-11-27 03:30:00	2024-11-27 03:30:00
2675	235160423	2023-05-21 13:53:51	2023-05-21 14:25:55	Indo	rm_land_nomad	\N	2024-11-27 03:30:02	2024-11-27 03:30:02
2676	235153865	2023-05-21 13:20:06	2023-05-21 13:44:44	Indonesia Low Elo	rm_city-of-lakes	\N	2024-11-27 03:30:02	2024-11-27 03:30:02
2677	86903355	2021-04-25 17:19:06	2021-04-25 17:54:38	Indonesia	rm_land_nomad	\N	2024-11-27 03:30:02	2024-11-27 03:30:02
2678	352563053	2024-11-17 07:16:19	2024-11-17 08:00:54	Indo only	rm_land_nomad	\N	2024-11-27 03:30:04	2024-11-27 03:30:04
2679	352324058	2024-11-16 09:43:32	2024-11-16 10:18:07	 Indo Pagi..  14	rm_land_nomad	\N	2024-11-27 03:30:04	2024-11-27 03:30:04
2680	264093024	2023-10-08 03:28:09	2023-10-08 04:28:59	Indonesia	rm_land_nomad	\N	2024-11-27 03:30:06	2024-11-27 03:30:06
2681	255550921	2023-08-26 08:28:03	2023-08-26 09:22:48	Indonesia	rm_land_nomad	\N	2024-11-27 03:30:06	2024-11-27 03:30:06
2682	255546270	2023-08-26 07:52:27	2023-08-26 08:23:31	Indonesia	rm_land_nomad	\N	2024-11-27 03:30:06	2024-11-27 03:30:06
2683	255541371	2023-08-26 07:08:26	2023-08-26 07:40:57	Indonesia	rm_land_nomad	\N	2024-11-27 03:30:06	2024-11-27 03:30:06
2684	335594018	2024-08-27 16:14:28	2024-08-27 16:47:31	Go,. Indo 14	rm_land_nomad	\N	2024-11-27 03:30:11	2024-11-27 03:30:11
2685	335586967	2024-08-27 15:28:28	2024-08-27 16:10:39	Go,. Indo 14	rm_land_nomad	\N	2024-11-27 03:30:11	2024-11-27 03:30:11
2686	233280146	2023-05-13 17:29:11	2023-05-13 18:31:41	INDONESIA BIS 2	rm_land_nomad	\N	2024-11-27 03:30:12	2024-11-27 03:30:12
2687	233272517	2023-05-13 16:52:23	2023-05-13 17:20:26	INDONESIA BIS 2	rm_land_nomad	\N	2024-11-27 03:30:12	2024-11-27 03:30:12
2688	233264995	2023-05-13 16:16:52	2023-05-13 16:45:47	IndoGazzz	rm_land_nomad	\N	2024-11-27 03:30:12	2024-11-27 03:30:12
2689	352303990	2024-11-16 07:01:49	2024-11-16 07:31:53	Indo pemanasan	rm_land_nomad	\N	2024-11-27 03:30:14	2024-11-27 03:30:14
2690	351889199	2024-11-14 08:19:03	2024-11-14 08:52:48	indo bus oleng	rm_land_nomad	\N	2024-11-27 03:30:14	2024-11-27 03:30:14
2691	347830776	2024-10-26 07:31:51	2024-10-26 08:02:34	INDO SIANG	rm_land_nomad	\N	2024-11-27 03:30:14	2024-11-27 03:30:14
2692	335394721	2024-08-26 15:41:53	2024-08-26 16:06:47	INDO RAME IN YUK	rm_african_clearing	\N	2024-11-27 03:30:14	2024-11-27 03:30:14
2693	331325934	2024-08-07 13:52:10	2024-08-07 14:19:17	Bis Indo	rm_land_nomad	\N	2024-11-27 03:30:15	2024-11-27 03:30:15
2694	354169798	2024-11-24 14:56:49	2024-11-24 15:33:55	Indo Santai 	rm_land_nomad	\N	2024-11-27 03:30:17	2024-11-27 03:30:17
2695	353686136	2024-11-22 16:14:18	2024-11-22 16:46:12	Indo Masuk 	rm_land_nomad	\N	2024-11-27 03:30:17	2024-11-27 03:30:17
2696	353279142	2024-11-20 15:37:16	2024-11-20 16:10:09	Indo Gas bablas	rm_land_nomad	\N	2024-11-27 03:30:17	2024-11-27 03:30:17
2697	352158682	2024-11-15 16:49:43	2024-11-15 17:31:18	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:30:19	2024-11-27 03:30:19
2698	352152411	2024-11-15 16:18:06	2024-11-15 16:46:41	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:30:20	2024-11-27 03:30:20
2699	352143443	2024-11-15 15:41:44	2024-11-15 16:13:48	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:30:20	2024-11-27 03:30:20
2700	352134440	2024-11-15 14:49:16	2024-11-15 15:24:15	Indo Clan League Cupu VS Lowelo	rm_migration	\N	2024-11-27 03:30:20	2024-11-27 03:30:20
2701	351133486	2024-11-10 15:22:07	2024-11-10 15:54:52	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:30:20	2024-11-27 03:30:20
2702	349167389	2024-11-01 15:08:16	2024-11-01 15:36:42	Indo Clan War	rm_migration	\N	2024-11-27 03:30:21	2024-11-27 03:30:21
2703	352363321	2024-11-16 13:52:52	2024-11-16 14:20:42	indo bus oleng	rm_land_nomad	\N	2024-11-27 03:30:30	2024-11-27 03:30:30
2704	351924372	2024-11-14 13:53:51	2024-11-14 14:34:23	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:30:30	2024-11-27 03:30:30
2705	348083454	2024-10-27 08:50:35	2024-10-27 09:25:41	Indo	rm_land_nomad	\N	2024-11-27 03:30:32	2024-11-27 03:30:32
2706	343923075	2024-10-07 14:49:47	2024-10-07 15:18:30	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:30:35	2024-11-27 03:30:35
2707	342500938	2024-09-30 15:00:34	2024-09-30 15:43:18	Indo	rm_land_nomad	\N	2024-11-27 03:30:35	2024-11-27 03:30:35
2708	341281889	2024-09-24 15:13:50	2024-09-24 15:42:18	IndoAOE	rm_land_nomad	\N	2024-11-27 03:30:35	2024-11-27 03:30:35
2709	333667919	2024-08-18 14:07:35	2024-08-18 14:31:47	Indo Fighter, 14	rm_land_nomad	\N	2024-11-27 03:30:35	2024-11-27 03:30:35
2710	353073989	2024-11-19 14:49:28	2024-11-19 15:24:21	Indo Gas bablas	rm_land_nomad	\N	2024-11-27 03:30:37	2024-11-27 03:30:37
2711	352572022	2024-11-17 08:31:15	2024-11-17 09:03:41	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:30:38	2024-11-27 03:30:38
2712	352568782	2024-11-17 08:09:45	2024-11-17 08:28:51	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:30:38	2024-11-27 03:30:38
2713	354179043	2024-11-24 15:38:19	2024-11-24 16:21:47	Indo Santai 	rm_land_nomad	\N	2024-11-27 03:30:40	2024-11-27 03:30:40
2714	327058617	2024-07-18 14:56:47	2024-07-18 15:35:28	Indonesia Player Only	rm_land_nomad	\N	2024-11-27 03:30:43	2024-11-27 03:30:43
2715	327051390	2024-07-18 14:18:22	2024-07-18 14:53:35	Indonesia Player Only	rm_land_nomad	\N	2024-11-27 03:30:43	2024-11-27 03:30:43
2716	326644745	2024-07-16 14:21:03	2024-07-16 14:54:08	Indo	rm_land_nomad	\N	2024-11-27 03:30:43	2024-11-27 03:30:43
2717	326455066	2024-07-15 15:25:04	2024-07-15 16:05:25	Indo	rm_land_nomad	\N	2024-11-27 03:30:43	2024-11-27 03:30:43
2718	290574461	2024-02-07 14:32:00	2024-02-07 15:23:23	Indo Team Island	rm_team-islands	\N	2024-11-27 03:30:45	2024-11-27 03:30:45
2719	290373356	2024-02-06 14:47:50	2024-02-06 15:18:24	Indo Low Elo 	rm_arena	\N	2024-11-27 03:30:45	2024-11-27 03:30:45
2720	351124743	2024-11-10 14:44:12	2024-11-10 15:19:06	Indo Clan Aoe Bifi vs Cupu	rm_migration	\N	2024-11-27 03:31:00	2024-11-27 03:31:00
2721	347267031	2024-10-23 15:27:07	2024-10-23 16:03:44	IndoAOE	rm_african_clearing	\N	2024-11-27 03:31:00	2024-11-27 03:31:00
2722	347260247	2024-10-23 14:45:17	2024-10-23 15:20:15	IndoAOE	rm_land_nomad	\N	2024-11-27 03:31:00	2024-11-27 03:31:00
2723	353692897	2024-11-22 16:53:04	2024-11-22 17:26:06	Indo Masuk 	rm_land_nomad	\N	2024-11-27 03:31:02	2024-11-27 03:31:02
2724	352318730	2024-11-16 09:01:27	2024-11-16 09:39:55	 Indo Pagi..  14	rm_land_nomad	\N	2024-11-27 03:31:05	2024-11-27 03:31:05
2725	352313994	2024-11-16 08:16:34	2024-11-16 08:53:58	 Indo Pagi..  14	rm_land_nomad	\N	2024-11-27 03:31:05	2024-11-27 03:31:05
2726	352309214	2024-11-16 07:40:50	2024-11-16 08:11:00	Indo pemanasan	rm_land_nomad	\N	2024-11-27 03:31:05	2024-11-27 03:31:05
2727	116335835	2021-09-09 15:49:25	2021-09-09 16:21:06	Indo HOT	rm_african_clearing	\N	2024-11-27 03:31:07	2024-11-27 03:31:07
2728	350647944	2024-11-08 15:58:44	2024-11-08 16:34:59	Indo Masuk	rm_land_nomad	\N	2024-11-27 03:31:10	2024-11-27 03:31:10
2729	350639091	2024-11-08 15:10:51	2024-11-08 15:52:26	Indo	rm_land_nomad	\N	2024-11-27 03:31:10	2024-11-27 03:31:10
2730	346676626	2024-10-20 16:17:59	2024-10-20 16:53:00	Indo Berani Masuk	rm_land_nomad	\N	2024-11-27 03:31:12	2024-11-27 03:31:12
2731	346638508	2024-10-20 13:35:07	2024-10-20 14:03:28	Indo Berani Masuk	rm_land_nomad	\N	2024-11-27 03:31:12	2024-11-27 03:31:12
2732	211522122	2023-02-18 16:32:32	2023-02-18 17:10:07	INDO ONLY, TRIMS	rm_land_nomad	\N	2024-11-27 03:31:12	2024-11-27 03:31:12
2733	211509737	2023-02-18 15:46:31	2023-02-18 16:26:30	INDO ONLY, TRIMS	rm_land_nomad	\N	2024-11-27 03:31:12	2024-11-27 03:31:12
2734	211497606	2023-02-18 15:13:33	2023-02-18 15:42:09	SELAMAT DATANG INDONESIA	rm_land_nomad	\N	2024-11-27 03:31:12	2024-11-27 03:31:12
2735	258250833	2023-09-08 14:16:36	2023-09-08 14:55:30	Indo Low Elo	rm_african_clearing	\N	2024-11-27 03:31:14	2024-11-27 03:31:14
2736	256418936	2023-08-30 14:26:39	2023-08-30 15:04:37	Indomie	rm_land_nomad	\N	2024-11-27 03:31:14	2024-11-27 03:31:14
2737	256412490	2023-08-30 13:46:14	2023-08-30 14:20:40	Indonesia	rm_land_nomad	\N	2024-11-27 03:31:14	2024-11-27 03:31:14
2738	256026856	2023-08-28 13:25:58	2023-08-28 13:55:48	Indonesia	rm_land_nomad	\N	2024-11-27 03:31:14	2024-11-27 03:31:14
2739	291697207	2024-02-12 15:42:49	2024-02-12 16:40:51	Indo Low Elo 	rm_land_nomad	\N	2024-11-27 03:31:23	2024-11-27 03:31:23
2740	289031067	2024-01-31 15:48:15	2024-01-31 16:30:09	INDO	rm_land_nomad	\N	2024-11-27 03:31:23	2024-11-27 03:31:23
2741	288981495	2024-01-31 08:50:49	2024-01-31 09:14:45	Indonesia Only	rm_arena	\N	2024-11-27 03:31:23	2024-11-27 03:31:23
2742	288832060	2024-01-30 15:51:17	2024-01-30 16:35:25	Indo AOE	rm_land_nomad	\N	2024-11-27 03:31:23	2024-11-27 03:31:23
2743	288158126	2024-01-27 16:42:28	2024-01-27 17:17:58	Indonesia Only	rm_land_nomad	\N	2024-11-27 03:31:23	2024-11-27 03:31:23
2744	341069169	2024-09-23 13:14:57	2024-09-23 13:42:56	Indo Kebakaran	rm_land_nomad	\N	2024-11-27 03:31:26	2024-11-27 03:31:26
2745	336613784	2024-09-01 14:29:34	2024-09-01 15:02:36	indoAOE	rm_land_nomad	\N	2024-11-27 03:31:26	2024-11-27 03:31:26
2746	335167275	2024-08-25 14:47:22	2024-08-25 15:13:35	Indo Low Elo	rm_land_nomad	\N	2024-11-27 03:31:26	2024-11-27 03:31:26
2747	334492729	2024-08-22 14:35:22	2024-08-22 15:04:50	INDO RAME IN YUK	rm_land_nomad	\N	2024-11-27 03:31:26	2024-11-27 03:31:26
2748	299044345	2024-03-16 04:03:57	2024-03-16 04:40:07	Indo Only	rm_land_nomad	\N	2024-11-27 03:31:30	2024-11-27 03:31:30
2749	285155906	2024-01-14 04:39:45	2024-01-14 05:43:38	Indo Only	rm_land_nomad	\N	2024-11-27 03:31:32	2024-11-27 03:31:32
2750	283174010	2024-01-05 12:28:03	2024-01-05 12:57:33	Indo Sebelum Tidur	rm_land_nomad	\N	2024-11-27 03:31:32	2024-11-27 03:31:32
2751	283167221	2024-01-05 11:42:03	2024-01-05 12:23:28	Indo Sebelum Tidur	rm_land_nomad	\N	2024-11-27 03:31:32	2024-11-27 03:31:32
2752	281322489	2023-12-28 15:35:28	2023-12-28 16:20:31	INDO	rm_land_nomad	\N	2024-11-27 03:31:32	2024-11-27 03:31:32
2753	344134734	2024-10-08 16:51:48	2024-10-08 17:29:26	INDO	rm_land_nomad	\N	2024-11-27 03:31:38	2024-11-27 03:31:38
2754	354775333	2024-11-27 14:14:52	2024-11-27 14:48:24	IndoAOE	rm_land_nomad	\N	2024-11-27 14:52:02	2024-11-27 14:52:02
2755	354769910	2024-11-27 13:41:48	2024-11-27 14:12:04	IndoAOE	rm_land_nomad	\N	2024-11-27 14:52:02	2024-11-27 14:52:02
2756	354725407	2024-11-27 05:43:48	2024-11-27 06:25:41	Indo pick civ	rm_land_nomad	\N	2024-11-27 14:52:23	2024-11-27 14:52:23
2757	354744917	2024-11-27 09:50:04	2024-11-27 10:18:45	Indonesia Invisible	rm_land_nomad	\N	2024-11-27 14:52:40	2024-11-27 14:52:40
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, page, slug, name, deleted_at, created_at, updated_at) FROM stdin;
1	home	hero	hero	\N	2024-11-27 04:25:49	2024-11-27 04:25:49
2	insight	hero	hero	\N	2024-11-27 07:16:21	2024-11-27 07:16:21
\.


--
-- Data for Name: insight_age_resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insight_age_resources (id, insights_id, resources_id, age, quantity, created_at, updated_at) FROM stdin;
1	1	1	Feudal Age	20	2024-11-27 06:32:50	2024-11-27 06:32:50
2	1	2	Feudal Age	16	2024-11-27 06:34:40	2024-11-27 06:34:40
\.


--
-- Data for Name: insight_ages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insight_ages (insights_id, ages_id, created_at, updated_at) FROM stdin;
1	1	\N	\N
1	2	\N	\N
1	3	\N	\N
\.


--
-- Data for Name: insight_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insight_categories (insights_id, category_insights_id, created_at, updated_at) FROM stdin;
1	1	\N	\N
1	2	\N	\N
\.


--
-- Data for Name: insights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insights (id, title, image, description, difficulty, population, deleted_at, created_at, updated_at) FROM stdin;
1	Arabia Fast Feudal -> Archer Rush	images/insights/01JDP0F0DJ2C18SJWB7HGNKXCQ.png	Lorem ipsum sit amet	Advanced	20	\N	2024-11-27 05:10:51	2024-11-27 05:10:51
\.


--
-- Data for Name: match_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match_teams (id, match_id, team_id, aoe2net_id, civ, won, created_at, updated_at) FROM stdin;
18446	354624201	1	781607	mongols	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18447	354624201	1	912155	aztecs	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18448	354624201	1	1986085	lithuanians	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18449	354624201	1	2682747	hindustanis	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18450	354624201	2	20192926	khmer	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18451	354624201	2	9454038	dravidians	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18452	354624201	2	12206179	italians	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18453	354624201	2	3540345	vikings	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18454	354617712	1	781607	portuguese	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18455	354617712	1	912155	chinese	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18456	354617712	1	12206179	mongols	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18457	354617712	1	3540345	celts	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18458	354617712	2	2682747	franks	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18459	354617712	2	2991308	teutons	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18460	354617712	2	3216997	cumans	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18461	354617712	2	2696529	koreans	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18462	354605424	1	12206179	sicilians	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18463	354605424	1	2758897	achaemenids	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18464	354605424	1	19749740	turks	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18465	354605424	1	16696615	lithuanians	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18466	354605424	2	912155	khmer	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18467	354605424	2	4226314	armenians	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18468	354605424	2	6830736	spartans	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18469	354605424	2	652559	mongols	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18470	354596409	1	16696615	portuguese	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18471	354596409	1	12206179	britons	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18472	354596409	1	19749740	malians	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18473	354596409	1	2758897	huns	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18474	354596409	2	652559	cumans	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18475	354596409	2	912155	incas	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18476	354596409	2	6830736	celts	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18477	354596409	2	4226314	burmese	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18478	354589782	1	2991308	malay	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18479	354589782	1	2886619	huns	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18480	354589782	1	4226314	ethiopians	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18481	354589782	1	5138019	mongols	t	2024-11-27 03:27:39	2024-11-27 03:27:39
18482	354589782	2	781607	magyars	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18483	354589782	2	20192926	turks	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18484	354589782	2	3540345	bulgarians	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18485	354589782	2	12206179	aztecs	f	2024-11-27 03:27:39	2024-11-27 03:27:39
18486	352622334	1	6130469	dravidians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18487	352622334	1	6830736	vikings	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18488	352622334	1	18411382	bohemians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18489	352622334	1	3216997	persians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18490	352622334	2	1633111	japanese	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18491	352622334	2	14775984	dravidians	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18492	352622334	2	19579387	persians	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18493	352622334	2	2702812	berbers	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18494	352391888	1	1633111	burgundians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18495	352391888	1	2793927	huns	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18496	352391888	1	18959347	britons	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18497	352391888	1	11443540	koreans	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18498	352391888	2	1386590	georgians	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18499	352391888	2	2886619	bohemians	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18500	352391888	2	16696615	celts	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18501	352391888	2	20192926	tatars	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18502	349408543	1	912155	goths	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18503	349408543	1	4226314	japanese	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18504	349408543	1	1633111	mayans	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18505	349408543	1	19579387	vietnamese	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18506	349408543	2	5138019	spanish	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18507	349408543	2	5556319	turks	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18508	349408543	2	18959347	cumans	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18509	349408543	2	2758897	khmer	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18510	349154310	1	1268183	malay	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18511	349154310	1	652559	persians	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18512	349154310	1	6269989	italians	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18513	349154310	1	2682747	lithuanians	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18514	349154310	2	19579387	persians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18515	349154310	2	1633111	saracens	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18516	349154310	2	2758897	japanese	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18517	349154310	2	9417745	italians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18518	347893944	1	18959347	burmese	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18519	347893944	1	4226314	vikings	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18520	347893944	1	4256064	koreans	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18521	347893944	1	2793927	berbers	f	2024-11-27 03:27:42	2024-11-27 03:27:42
18522	347893944	2	1633111	dravidians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18523	347893944	2	19579387	persians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18524	347893944	2	19749740	byzantines	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18525	347893944	2	2758897	burgundians	t	2024-11-27 03:27:42	2024-11-27 03:27:42
18526	353671688	1	2682747	athenians	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18527	353671688	1	3540345	vikings	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18528	353671688	1	16696615	italians	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18529	353671688	1	16840678	persians	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18530	353671688	2	2776978	byzantines	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18531	353671688	2	19882187	khmer	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18532	353671688	2	1386590	saracens	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18533	353671688	2	18959347	celts	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18534	353649227	1	16696615	hindustanis	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18535	353649227	1	2758897	poles	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18536	353649227	1	16840678	chinese	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18537	353649227	1	912155	mayans	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18538	353649227	2	5138019	mongols	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18539	353649227	2	2682747	teutons	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18540	353649227	2	21227366	lithuanians	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18541	353649227	2	2886619	bengalis	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18542	353462971	1	16840678	malay	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18543	353462971	1	6783155	italians	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18544	353462971	2	5138019	ethiopians	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18545	353462971	2	11715344	lithuanians	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18546	353086362	1	2682747	poles	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18547	353086362	1	21227366	koreans	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18548	353086362	1	21059248	malians	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18549	353086362	1	12206179	mongols	t	2024-11-27 03:27:46	2024-11-27 03:27:46
18550	353086362	2	3540345	turks	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18551	353086362	2	781607	khmer	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18552	353086362	2	912155	bulgarians	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18553	353086362	2	16840678	dravidians	f	2024-11-27 03:27:46	2024-11-27 03:27:46
18554	348379879	1	218945	khmer	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18555	348379879	1	12206179	bohemians	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18556	348379879	1	19749740	teutons	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18557	348379879	1	781607	britons	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18558	348379879	2	4516139	italians	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18559	348379879	2	4033185	berbers	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18560	348379879	2	20192926	portuguese	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18561	348379879	2	9454038	mayans	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18562	347931691	1	20870702	lithuanians	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18563	347931691	1	2991308	bohemians	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18564	347931691	1	1986085	slavs	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18565	347931691	1	12206179	khmer	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18566	347931691	2	218945	magyars	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18567	347931691	2	11682652	portuguese	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18568	347931691	2	4516139	malay	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18569	347931691	2	20192926	incas	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18570	347919465	1	781607	sicilians	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18571	347919465	1	9454038	slavs	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18572	347919465	1	20192926	spanish	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18573	347919465	1	218945	georgians	f	2024-11-27 03:27:50	2024-11-27 03:27:50
18574	347919465	2	12206179	japanese	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18575	347919465	2	9583069	tatars	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18576	347919465	2	18841242	persians	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18577	347919465	2	14775984	armenians	t	2024-11-27 03:27:50	2024-11-27 03:27:50
18578	345402712	1	4516139	turks	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18579	345402712	1	12206179	hindustanis	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18580	345402712	1	15133012	poles	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18581	345402712	2	10011205	goths	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18582	345402712	2	14135529	dravidians	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18583	345402712	2	2696529	portuguese	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18584	344913754	1	11443540	slavs	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18585	344913754	1	4256064	romans	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18586	344913754	1	2682747	portuguese	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18587	344913754	1	2991308	hindustanis	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18588	344913754	2	14135529	bengalis	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18589	344913754	2	4516139	vietnamese	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18590	344913754	2	652559	sicilians	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18591	344913754	2	10011205	burmese	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18592	344722493	1	2886619	ethiopians	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18593	344722493	1	3319777	portuguese	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18594	344722493	1	912155	magyars	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18595	344722493	1	3540345	mayans	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18596	344722493	2	4033185	bengalis	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18597	344722493	2	12206179	teutons	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18598	344722493	2	5138019	italians	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18599	344722493	2	10011205	turks	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18600	344521141	1	1986085	romans	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18601	344521141	1	14135529	burgundians	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18602	344521141	1	12206179	franks	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18603	344521141	1	912155	slavs	t	2024-11-27 03:27:52	2024-11-27 03:27:52
18604	344521141	2	10011205	mongols	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18605	344521141	2	5060982	vietnamese	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18606	344521141	2	5138019	burmese	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18607	344521141	2	4033185	celts	f	2024-11-27 03:27:52	2024-11-27 03:27:52
18608	354610371	1	781607	aztecs	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18609	354610371	1	11955124	malians	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18610	354610371	1	2991308	bohemians	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18611	354610371	1	2682747	persians	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18612	354610371	2	20192926	incas	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18613	354610371	2	9454038	vikings	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18614	354610371	2	5138019	gurjaras	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18615	354610371	2	3540345	georgians	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18616	354604112	1	3540345	poles	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18617	354604112	1	2682747	mongols	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18618	354604112	1	5138019	aztecs	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18619	354604112	1	20192926	vikings	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18620	354604112	2	781607	koreans	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18621	354604112	2	9454038	bulgarians	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18622	354604112	2	2886619	bohemians	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18623	354604112	2	11955124	malay	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18624	354596663	1	4516139	cumans	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18625	354596663	1	2682747	japanese	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18626	354596663	1	2886619	britons	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18627	354596663	1	5138019	chinese	t	2024-11-27 03:27:55	2024-11-27 03:27:55
18628	354596663	2	781607	poles	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18629	354596663	2	3540345	romans	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18630	354596663	2	20192926	burmese	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18631	354596663	2	9454038	portuguese	f	2024-11-27 03:27:55	2024-11-27 03:27:55
18632	349833451	1	11955124	aztecs	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18633	349833451	1	1386590	malians	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18634	349833451	2	5138019	ethiopians	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18635	349833451	2	17877078	incas	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18636	298630865	1	3975785	spanish	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18637	298630865	1	2749860	tatars	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18638	298630865	1	2886619	bulgarians	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18639	298630865	1	18847707	teutons	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18640	298630865	2	17877078	huns	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18641	298630865	2	18411382	khmer	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18642	298630865	2	4516139	dravidians	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18643	298630865	2	12206179	malay	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18644	298206711	1	4516139	bohemians	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18645	298206711	1	16840678	mongols	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18646	298206711	1	781607	turks	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18647	298206711	1	9417745	byzantines	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18648	298206711	2	6269989	koreans	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18649	298206711	2	4033185	japanese	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18650	298206711	2	11443540	bulgarians	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18651	298206711	2	17877078	cumans	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18652	298203455	1	781607	tatars	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18653	298203455	1	9417745	poles	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18654	298203455	1	16840678	koreans	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18655	298203455	1	4516139	italians	t	2024-11-27 03:27:57	2024-11-27 03:27:57
18656	298203455	2	6269989	malians	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18657	298203455	2	17877078	japanese	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18658	298203455	2	3975785	saracens	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18659	298203455	2	4033185	vikings	f	2024-11-27 03:27:57	2024-11-27 03:27:57
18660	339594363	1	5556319	sicilians	f	2024-11-27 03:28:00	2024-11-27 03:28:00
18661	339594363	1	2682747	poles	f	2024-11-27 03:28:00	2024-11-27 03:28:00
18662	339594363	1	2481683	gurjaras	f	2024-11-27 03:28:00	2024-11-27 03:28:00
18663	339594363	2	2758897	japanese	t	2024-11-27 03:28:00	2024-11-27 03:28:00
18664	339594363	2	3540345	vikings	t	2024-11-27 03:28:00	2024-11-27 03:28:00
18665	339594363	2	1386590	tatars	t	2024-11-27 03:28:00	2024-11-27 03:28:00
18666	346174501	1	652559	persians	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18667	346174501	1	421538	chinese	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18668	346174501	1	14135529	armenians	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18669	346174501	1	11715344	bengalis	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18670	346174501	2	4371847	mayans	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18671	346174501	2	3975785	tatars	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18672	346174501	2	781607	lithuanians	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18673	346174501	2	19749740	teutons	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18674	337718558	1	1386590	burgundians	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18675	337718558	2	4371847	celts	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18676	337718558	2	16840678	burmese	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18677	325570590	1	781607	bulgarians	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18678	325570590	1	4226314	italians	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18679	325570590	1	4371847	koreans	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18680	325570590	1	2670727	franks	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18681	325570590	2	3540345	byzantines	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18682	325570590	2	12206179	hindustanis	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18683	325570590	2	652559	magyars	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18684	325570590	2	19749740	celts	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18685	324774997	1	4295209	incas	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18686	324774997	1	4256064	gurjaras	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18687	324774997	1	2696529	burmese	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18688	324774997	1	781607	turks	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18689	324774997	2	4516139	malay	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18690	324774997	2	4371847	spanish	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18691	324774997	2	4033185	armenians	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18692	324774997	2	652559	huns	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18693	324709913	1	2670727	lithuanians	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18694	324709913	1	3540345	bohemians	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18695	324709913	1	10140054	poles	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18696	324709913	1	5556319	britons	t	2024-11-27 03:28:03	2024-11-27 03:28:03
18697	324709913	2	12206179	khmer	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18698	324709913	2	652559	malay	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18699	324709913	2	4371847	teutons	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18700	324709913	2	2682747	aztecs	f	2024-11-27 03:28:03	2024-11-27 03:28:03
18701	288812970	1	18411382	magyars	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18702	288812970	1	18171781	japanese	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18703	288812970	1	2886619	khmer	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18704	288812970	1	11715344	huns	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18705	288812970	2	11955124	burmese	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18706	288812970	2	218945	bulgarians	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18707	288812970	2	597994	incas	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18708	288812970	2	2749860	persians	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18709	288617188	1	2696529	vietnamese	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18710	288617188	1	2886619	slavs	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18711	288617188	1	652559	burgundians	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18712	288617188	2	597994	saracens	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18713	288617188	2	912155	bengalis	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18714	288617188	2	3146059	hindustanis	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18715	288416570	1	218945	mayans	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18716	288416570	2	18171781	burgundians	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18717	288416570	2	597994	britons	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18718	288407681	1	2682747	portuguese	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18719	288407681	1	597994	britons	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18720	288407681	1	1633111	vietnamese	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18721	288407681	1	18171781	cumans	t	2024-11-27 03:28:04	2024-11-27 03:28:04
18722	288407681	2	12206179	burmese	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18723	288407681	2	2696529	tatars	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18724	288407681	2	218945	chinese	f	2024-11-27 03:28:04	2024-11-27 03:28:04
18725	288407681	2	912155	mayans	f	2024-11-27 03:28:05	2024-11-27 03:28:05
18726	354407630	1	20192926	aztecs	f	2024-11-27 03:28:07	2024-11-27 03:28:07
18727	354407630	1	9454038	mongols	f	2024-11-27 03:28:07	2024-11-27 03:28:07
18728	354407630	1	1986085	sicilians	f	2024-11-27 03:28:07	2024-11-27 03:28:07
18729	354407630	1	12206179	burmese	f	2024-11-27 03:28:07	2024-11-27 03:28:07
18730	354407630	2	781607	malians	t	2024-11-27 03:28:07	2024-11-27 03:28:07
18731	354407630	2	912155	bengalis	t	2024-11-27 03:28:07	2024-11-27 03:28:07
18732	354407630	2	15133012	dravidians	t	2024-11-27 03:28:07	2024-11-27 03:28:07
18733	354407630	2	4516139	japanese	t	2024-11-27 03:28:07	2024-11-27 03:28:07
18734	354377883	1	11443540	sicilians	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18735	354377883	1	2758897	slavs	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18736	354377883	1	652559	bohemians	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18737	354377883	1	21227366	spanish	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18738	354377883	2	2886619	teutons	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18739	354377883	2	2793927	dravidians	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18740	354377883	2	3540345	ethiopians	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18741	354377883	2	2682747	bulgarians	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18742	354112608	1	4033185	persians	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18743	354112608	1	2886619	tatars	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18744	354112608	1	2793927	slavs	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18745	354112608	1	16696615	koreans	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18746	354112608	2	2758897	italians	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18747	354112608	2	12206179	turks	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18748	354112608	2	2776978	poles	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18749	354112608	2	18959347	berbers	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18750	352383224	1	21227366	magyars	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18751	352383224	1	1386590	khmer	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18752	352383224	1	19749740	persians	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18753	352383224	1	16696615	aztecs	f	2024-11-27 03:28:10	2024-11-27 03:28:10
18754	352383224	2	781607	franks	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18755	352383224	2	2793927	gurjaras	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18756	352383224	2	18959347	ethiopians	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18757	352383224	2	2682747	burgundians	t	2024-11-27 03:28:10	2024-11-27 03:28:10
18758	354578855	1	6830736	aztecs	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18759	354578855	1	11715344	dravidians	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18760	354578855	1	5138019	britons	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18761	354578855	1	3975785	huns	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18762	354578855	2	6783155	italians	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18763	354578855	2	16696615	ethiopians	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18764	354578855	2	2758897	hindustanis	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18765	354578855	2	2682747	saracens	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18766	354571857	1	16696615	malians	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18767	354571857	1	3975785	celts	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18768	354571857	1	2682747	tatars	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18769	354571857	1	6783155	portuguese	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18770	354571857	2	2758897	armenians	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18771	354571857	2	21059248	franks	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18772	354571857	2	6830736	romans	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18773	354571857	2	5138019	turks	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18774	354405292	1	3975785	incas	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18775	354405292	1	4033185	berbers	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18776	354405292	1	6830736	koreans	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18777	354405292	1	19749740	vietnamese	t	2024-11-27 03:28:12	2024-11-27 03:28:12
18778	354405292	2	5138019	tatars	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18779	354405292	2	2682747	athenians	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18780	354405292	2	2758897	teutons	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18781	354405292	2	3540345	persians	f	2024-11-27 03:28:12	2024-11-27 03:28:12
18782	354160613	1	11715344	bohemians	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18783	354160613	1	18411382	vikings	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18784	354160613	1	2886619	dravidians	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18785	354160613	1	6783155	persians	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18786	354160613	2	6160315	koreans	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18787	354160613	2	15133012	vikings	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18788	354160613	2	14923704	vikings	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18789	354160613	2	17842551	huns	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18790	352367122	1	14923704	byzantines	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18791	352367122	1	21170374	vikings	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18792	352367122	1	19636187	armenians	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18793	352367122	1	15133012	italians	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18794	352367122	2	2776978	burmese	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18795	352367122	2	2793927	vikings	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18796	352367122	2	18959347	celts	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18797	352367122	2	11955124	dravidians	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18798	350627424	1	19749740	italians	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18799	350627424	1	4033185	vikings	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18800	350627424	1	2758897	malay	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18801	350627424	1	19579387	persians	t	2024-11-27 03:28:16	2024-11-27 03:28:16
18802	350627424	2	21170374	dravidians	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18803	350627424	2	14551949	vikings	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18804	350627424	2	15133012	italians	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18805	350627424	2	14923704	byzantines	f	2024-11-27 03:28:16	2024-11-27 03:28:16
18806	278286083	1	9414798	malians	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18807	278286083	1	3540345	poles	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18808	278286083	2	2682747	chinese	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18809	278286083	2	11955124	slavs	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18810	278129534	1	2682747	huns	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18811	278129534	1	781607	ethiopians	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18812	278129534	1	3540345	berbers	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18813	278129534	1	14474131	teutons	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18814	278129534	2	9414798	britons	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18815	278129534	2	2696529	spanish	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18816	278129534	2	2670727	poles	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18817	278129534	2	652559	aztecs	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18818	278110776	1	1268183	burgundians	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18819	278110776	1	218945	bulgarians	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18820	278110776	1	11955124	turks	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18821	278110776	2	2886619	dravidians	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18822	278110776	2	4516139	sicilians	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18823	278110776	2	9414798	cumans	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18824	277919025	1	781607	magyars	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18825	277919025	1	3540345	celts	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18826	277919025	1	2670727	burgundians	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18827	277919025	2	2682747	turks	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18828	277919025	2	9414798	teutons	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18829	277919025	2	1268183	tatars	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18830	272266171	1	9414798	goths	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18831	272266171	1	781607	hindustanis	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18832	272266171	1	6830736	chinese	t	2024-11-27 03:28:18	2024-11-27 03:28:18
18833	272266171	2	652559	tatars	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18834	272266171	2	2682747	berbers	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18835	272266171	2	2670727	vietnamese	f	2024-11-27 03:28:18	2024-11-27 03:28:18
18836	252837731	1	14619943	britons	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18837	252837731	1	5556319	ethiopians	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18838	252837731	1	781607	saracens	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18839	252837731	1	4256064	bulgarians	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18840	252837731	2	2682747	berbers	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18841	252837731	2	4516139	bengalis	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18842	252837731	2	4226314	malians	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18843	252837731	2	3540345	persians	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18844	252830204	1	5556319	saracens	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18845	252830204	1	3216997	dravidians	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18846	252830204	1	4226314	vikings	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18847	252830204	1	14619943	malians	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18848	252830204	2	2682747	portuguese	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18849	252830204	2	781607	hindustanis	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18850	252830204	2	3540345	celts	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18851	252830204	2	10011205	mayans	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18852	252820110	1	3216997	magyars	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18853	252820110	1	10011205	berbers	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18854	252820110	1	14619943	italians	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18855	252820110	1	5556319	mongols	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18856	252820110	2	4516139	britons	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18857	252820110	2	2682747	bengalis	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18858	252820110	2	3540345	romans	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18859	252820110	2	4226314	gurjaras	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18860	252816422	1	14619943	khmer	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18861	252816422	1	3216997	hindustanis	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18862	252816422	1	10011205	dravidians	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18863	252816422	1	5556319	aztecs	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18864	252816422	2	2682747	incas	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18865	252816422	2	4516139	bohemians	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18866	252816422	2	4226314	goths	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18867	252816422	2	3540345	cumans	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18868	243666796	1	14619943	huns	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18869	243666796	1	4226314	cumans	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18870	243666796	1	2923822	koreans	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18871	243666796	1	5556319	dravidians	f	2024-11-27 03:28:20	2024-11-27 03:28:20
18872	243666796	2	15303580	turks	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18873	243666796	2	1633111	bulgarians	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18874	243666796	2	3216997	saracens	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18875	243666796	2	3975785	hindustanis	t	2024-11-27 03:28:20	2024-11-27 03:28:20
18876	347654767	1	5138019	italians	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18877	347654767	1	6269989	turks	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18878	347654767	1	3319777	franks	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18879	347654767	1	652559	armenians	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18880	347654767	2	15133012	spanish	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18881	347654767	2	14923704	byzantines	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18882	347654767	2	6160315	malay	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18883	347654767	2	17842551	franks	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18884	345968918	1	6269989	sicilians	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18885	345968918	1	11443540	celts	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18886	345968918	1	19579387	vietnamese	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18887	345968918	1	12206179	malians	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18888	345968918	2	11715344	cumans	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18889	345968918	2	781607	malay	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18890	345968918	2	2682747	koreans	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18891	345968918	2	2886619	chinese	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18892	345962982	1	781607	huns	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18893	345962982	1	2886619	berbers	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18894	345962982	1	2682747	poles	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18895	345962982	1	11715344	persians	f	2024-11-27 03:28:23	2024-11-27 03:28:23
18896	345962982	2	6269989	malay	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18897	345962982	2	652559	franks	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18898	345962982	2	12206179	armenians	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18899	345962982	2	19579387	byzantines	t	2024-11-27 03:28:23	2024-11-27 03:28:23
18900	354160975	1	2758897	spartans	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18901	354160975	1	19579387	persians	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18902	354160975	1	9417745	dravidians	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18903	354160975	1	4033185	vikings	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18904	354160975	2	781607	dravidians	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18905	354160975	2	20192926	persians	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18906	354160975	2	912155	malay	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18907	354160975	2	12206179	vikings	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18908	351746165	1	912155	gurjaras	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18909	351746165	1	19579387	slavs	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18910	351746165	1	652559	goths	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18911	351746165	1	16696615	chinese	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18912	351746165	2	9454038	spanish	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18913	351746165	2	2886619	cumans	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18914	351746165	2	4033185	koreans	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18915	351746165	2	5138019	portuguese	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18916	351736982	1	2886619	teutons	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18917	351736982	1	2696529	vietnamese	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18918	351736982	1	652559	magyars	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18919	351736982	1	5138019	tatars	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18920	351736982	2	2682747	sicilians	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18921	351736982	2	912155	chinese	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18922	351736982	2	11715344	italians	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18923	351736982	2	19579387	aztecs	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18924	351731473	1	652559	italians	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18925	351731473	1	21227366	saracens	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18926	351731473	1	16696615	britons	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18927	351731473	1	912155	malay	f	2024-11-27 03:28:25	2024-11-27 03:28:25
18928	351731473	2	2886619	vietnamese	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18929	351731473	2	2682747	bohemians	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18930	351731473	2	19579387	bulgarians	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18931	351731473	2	12206179	mayans	t	2024-11-27 03:28:25	2024-11-27 03:28:25
18932	352401652	1	16696615	mongols	t	2024-11-27 03:28:28	2024-11-27 03:28:28
18933	352401652	1	2776978	byzantines	t	2024-11-27 03:28:28	2024-11-27 03:28:28
18934	352401652	1	18841242	vikings	t	2024-11-27 03:28:28	2024-11-27 03:28:28
18935	352401652	1	11955124	portuguese	t	2024-11-27 03:28:28	2024-11-27 03:28:28
18936	352401652	2	18959347	berbers	f	2024-11-27 03:28:28	2024-11-27 03:28:28
18937	352401652	2	2886619	incas	f	2024-11-27 03:28:28	2024-11-27 03:28:28
18938	352401652	2	1386590	gurjaras	f	2024-11-27 03:28:28	2024-11-27 03:28:28
18939	352401652	2	19882187	franks	f	2024-11-27 03:28:28	2024-11-27 03:28:28
18940	215318195	1	11895655	khmer	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18941	215318195	1	6269989	saracens	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18942	215318195	1	2793371	britons	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18943	215318195	2	2886619	portuguese	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18944	215318195	2	3540345	gurjaras	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18945	215318195	2	11955124	lithuanians	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18946	210623462	5	2702812	sicilians	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18947	210623462	6	1386590	hindustanis	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18948	210623462	7	2886619	vikings	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18949	210623462	8	11895655	persians	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18950	210623462	9	2793371	mongols	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18951	210623462	10	4516139	burgundians	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18952	210623462	11	6215044	cumans	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18953	207739109	1	4190574	persians	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18954	207739109	1	3540345	lithuanians	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18955	207739109	1	7333714	sicilians	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18956	207739109	1	652559	burmese	f	2024-11-27 03:28:30	2024-11-27 03:28:30
18957	207739109	2	11895655	ethiopians	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18958	207739109	2	4516139	italians	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18959	207739109	2	4371847	portuguese	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18960	207739109	2	2670727	byzantines	t	2024-11-27 03:28:30	2024-11-27 03:28:30
18961	352878061	1	2886619	lithuanians	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18962	352878061	1	21227366	mongols	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18963	352878061	1	19749740	chinese	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18964	352878061	1	16696615	incas	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18965	352878061	2	11955124	bengalis	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18966	352878061	2	6783155	franks	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18967	352878061	2	12206179	vietnamese	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18968	352878061	2	2682747	poles	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18969	352611833	1	16840678	malay	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18970	352611833	1	16696615	mayans	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18971	352611833	1	3319777	franks	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18972	352611833	1	3975785	portuguese	t	2024-11-27 03:28:33	2024-11-27 03:28:33
18973	352611833	2	5138019	celts	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18974	352611833	2	2682747	byzantines	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18975	352611833	2	11955124	chinese	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18976	352611833	2	2758897	lithuanians	f	2024-11-27 03:28:33	2024-11-27 03:28:33
18977	353950628	1	11682652	khmer	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18978	353950628	1	12206179	malians	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18979	353950628	1	4033185	goths	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18980	353950628	1	781607	mayans	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18981	353950628	2	3216997	mongols	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18982	353950628	2	3540345	bulgarians	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18983	353950628	2	19749740	gurjaras	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18984	353950628	2	2682747	bohemians	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18985	353941899	1	19749740	koreans	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18986	353941899	1	781607	bengalis	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18987	353941899	1	3216997	malay	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18988	353941899	2	2682747	turks	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18989	353941899	2	3540345	magyars	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18990	353941899	2	11682652	huns	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18991	353907551	1	21227366	britons	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18992	353907551	1	11682652	tatars	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18993	353907551	1	16696615	bohemians	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18994	353907551	1	781607	cumans	t	2024-11-27 03:28:36	2024-11-27 03:28:36
18995	353907551	2	2696529	chinese	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18996	353907551	2	3975785	khmer	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18997	353907551	2	12206179	goths	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18998	353907551	2	2682747	georgians	f	2024-11-27 03:28:36	2024-11-27 03:28:36
18999	353900299	1	21227366	vikings	f	2024-11-27 03:28:36	2024-11-27 03:28:36
19000	353900299	1	2682747	armenians	f	2024-11-27 03:28:36	2024-11-27 03:28:36
19001	353900299	1	781607	britons	f	2024-11-27 03:28:36	2024-11-27 03:28:36
19002	353900299	2	21059248	italians	t	2024-11-27 03:28:36	2024-11-27 03:28:36
19003	353900299	2	11682652	malians	t	2024-11-27 03:28:36	2024-11-27 03:28:36
19004	353900299	2	16696615	ethiopians	t	2024-11-27 03:28:36	2024-11-27 03:28:36
19005	352612694	1	11682652	huns	f	2024-11-27 03:28:36	2024-11-27 03:28:36
19006	352612694	1	2886619	bohemians	f	2024-11-27 03:28:36	2024-11-27 03:28:36
19007	352612694	1	781607	slavs	f	2024-11-27 03:28:36	2024-11-27 03:28:36
19008	352612694	1	21227366	sicilians	f	2024-11-27 03:28:36	2024-11-27 03:28:36
19009	352612694	2	4516139	burgundians	t	2024-11-27 03:28:36	2024-11-27 03:28:36
19010	352612694	2	12206179	malians	t	2024-11-27 03:28:36	2024-11-27 03:28:36
19011	352612694	2	20192926	celts	t	2024-11-27 03:28:36	2024-11-27 03:28:36
19012	352612694	2	9454038	japanese	t	2024-11-27 03:28:36	2024-11-27 03:28:36
19013	344101115	1	11715344	celts	t	2024-11-27 03:28:38	2024-11-27 03:28:38
19014	344101115	1	781607	byzantines	t	2024-11-27 03:28:38	2024-11-27 03:28:38
19015	344101115	1	5138019	persians	t	2024-11-27 03:28:38	2024-11-27 03:28:38
19016	344101115	1	2886619	mongols	t	2024-11-27 03:28:38	2024-11-27 03:28:38
19017	344101115	2	20031688	incas	f	2024-11-27 03:28:38	2024-11-27 03:28:38
19018	344101115	2	12206179	malay	f	2024-11-27 03:28:38	2024-11-27 03:28:38
19019	344101115	2	4033185	dravidians	f	2024-11-27 03:28:38	2024-11-27 03:28:38
19020	344101115	2	20067454	chinese	f	2024-11-27 03:28:38	2024-11-27 03:28:38
19021	225601286	1	12107710	portuguese	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19022	225601286	1	2682333	mayans	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19023	225601286	1	2886619	persians	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19024	225601286	1	4516139	italians	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19025	225601286	2	2749860	slavs	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19026	225601286	2	5556319	koreans	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19027	225601286	2	11955124	cumans	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19028	225601286	2	2670727	japanese	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19029	200578876	1	4516139	britons	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19030	200578876	1	2682747	koreans	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19031	200578876	1	2682333	lithuanians	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19032	200578876	1	3319777	malians	t	2024-11-27 03:28:40	2024-11-27 03:28:40
19033	200578876	2	6139075	teutons	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19034	200578876	2	6215044	magyars	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19035	200578876	2	4190574	cumans	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19036	200578876	2	781607	sicilians	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19037	200573874	1	4516139	dravidians	f	2024-11-27 03:28:40	2024-11-27 03:28:40
19038	200573874	1	2682747	lithuanians	f	2024-11-27 03:28:41	2024-11-27 03:28:41
19039	200573874	1	2682333	turks	f	2024-11-27 03:28:41	2024-11-27 03:28:41
19040	200573874	2	6139075	spanish	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19041	200573874	2	6215044	britons	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19042	200573874	2	3319777	malians	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19043	199493566	1	3319777	cumans	f	2024-11-27 03:28:41	2024-11-27 03:28:41
19044	199493566	2	2682333	mongols	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19045	199493566	2	11895655	bulgarians	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19046	197537988	1	5556319	chinese	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19047	197537988	1	3540345	bulgarians	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19048	197537988	1	781607	incas	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19049	197537988	1	6269989	teutons	t	2024-11-27 03:28:41	2024-11-27 03:28:41
19050	197537988	2	2682333	vietnamese	f	2024-11-27 03:28:41	2024-11-27 03:28:41
19051	197537988	2	4190574	slavs	f	2024-11-27 03:28:41	2024-11-27 03:28:41
19052	197537988	2	4226314	bohemians	f	2024-11-27 03:28:41	2024-11-27 03:28:41
19053	197537988	2	1386590	sicilians	f	2024-11-27 03:28:41	2024-11-27 03:28:41
19054	328174812	1	4516139	teutons	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19055	328174812	1	10011205	bengalis	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19056	328174812	1	1386590	bohemians	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19057	328174812	1	4033185	burgundians	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19058	328174812	2	2776978	burmese	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19059	328174812	2	12206179	mongols	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19060	328174812	2	19749740	vietnamese	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19061	328174812	2	2670727	turks	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19062	328165544	1	1386590	burmese	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19063	328165544	1	2886619	bengalis	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19064	328165544	1	652559	dravidians	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19065	328165544	1	12206179	spanish	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19066	328165544	2	11443540	franks	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19067	328165544	2	19749740	ethiopians	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19068	328165544	2	2670727	gurjaras	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19069	328165544	2	2682747	teutons	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19070	328153825	1	2886619	vietnamese	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19071	328153825	1	1386590	celts	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19072	328153825	1	10011205	khmer	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19073	328153825	1	12206179	burgundians	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19074	328153825	2	11715344	italians	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19075	328153825	2	2670727	poles	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19076	328153825	2	2682747	cumans	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19077	328153825	2	19579387	ethiopians	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19078	327750788	1	19749740	lithuanians	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19079	327750788	1	2682747	celts	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19080	327750788	1	1268183	byzantines	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19081	327750788	1	2776978	burgundians	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19082	327750788	2	19579387	turks	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19083	327750788	2	2670727	koreans	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19084	327750788	2	3216997	japanese	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19085	327750788	2	12206179	cumans	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19086	327742028	1	3216997	teutons	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19087	327742028	1	1268183	slavs	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19088	327742028	1	2776978	byzantines	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19089	327742028	1	4226314	poles	f	2024-11-27 03:28:43	2024-11-27 03:28:43
19090	327742028	2	11715344	berbers	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19091	327742028	2	1386590	koreans	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19092	327742028	2	2670727	mayans	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19093	327742028	2	19579387	celts	t	2024-11-27 03:28:43	2024-11-27 03:28:43
19094	353919230	1	12206179	ethiopians	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19095	353919230	1	3975785	spanish	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19096	353919230	1	781607	magyars	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19097	353919230	1	20192926	italians	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19098	353919230	2	21227366	huns	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19099	353919230	2	1386590	byzantines	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19100	353919230	2	2682747	bohemians	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19101	353919230	2	2696529	turks	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19102	353701635	1	781607	chinese	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19103	353701635	1	2682747	incas	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19104	353701635	1	2696529	portuguese	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19105	353701635	1	20192926	bohemians	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19106	353701635	2	912155	spanish	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19107	353701635	2	12206179	bengalis	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19108	353701635	2	3540345	romans	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19109	353701635	2	18959347	bulgarians	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19110	353276372	1	11715344	bengalis	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19111	353276372	1	12206179	dravidians	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19112	353276372	1	2886619	ethiopians	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19113	353276372	1	2696529	teutons	f	2024-11-27 03:28:47	2024-11-27 03:28:47
19114	353276372	2	6783155	khmer	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19115	353276372	2	18411382	italians	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19116	353276372	2	16696615	chinese	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19117	353276372	2	20192926	bulgarians	t	2024-11-27 03:28:47	2024-11-27 03:28:47
19118	354397313	1	12206179	tatars	f	2024-11-27 03:28:49	2024-11-27 03:28:49
19119	354397313	1	20192926	franks	f	2024-11-27 03:28:49	2024-11-27 03:28:49
19120	354397313	1	15133012	portuguese	f	2024-11-27 03:28:49	2024-11-27 03:28:49
19121	354397313	1	3975785	cumans	f	2024-11-27 03:28:49	2024-11-27 03:28:49
19122	354397313	2	1986085	malay	t	2024-11-27 03:28:49	2024-11-27 03:28:49
19123	354397313	2	912155	khmer	t	2024-11-27 03:28:49	2024-11-27 03:28:49
19124	354397313	2	9454038	britons	t	2024-11-27 03:28:49	2024-11-27 03:28:49
19125	354397313	2	4516139	hindustanis	t	2024-11-27 03:28:49	2024-11-27 03:28:49
19126	295633227	1	2749860	byzantines	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19127	295633227	1	2886619	berbers	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19128	295633227	1	2923822	tatars	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19129	295633227	1	11955124	portuguese	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19130	295633227	2	2702812	koreans	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19131	295633227	2	18765026	burgundians	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19132	295633227	2	4226314	bengalis	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19133	295633227	2	12206179	slavs	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19134	281029497	1	3975785	ethiopians	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19135	281029497	1	5138019	malay	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19136	281029497	1	14474131	portuguese	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19137	281029497	1	5556319	byzantines	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19138	281029497	2	2923822	slavs	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19139	281029497	2	2682747	mayans	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19140	281029497	2	2886619	celts	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19141	281029497	2	3146059	italians	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19142	280795869	1	5138019	mongols	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19143	280795869	1	5556319	vietnamese	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19144	280795869	2	652559	franks	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19145	280795869	2	2923822	tatars	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19146	280789433	1	2923822	bengalis	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19147	280789433	1	5138019	celts	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19148	280789433	1	3216997	cumans	t	2024-11-27 03:28:52	2024-11-27 03:28:52
19149	280789433	2	3146059	chinese	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19150	280789433	2	2776978	franks	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19151	280789433	2	5556319	saracens	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19152	280789433	2	652559	khmer	f	2024-11-27 03:28:52	2024-11-27 03:28:52
19153	351322308	1	2886619	goths	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19154	351322308	1	19579387	khmer	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19155	351322308	1	12206179	portuguese	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19156	351322308	1	20192926	koreans	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19157	351322308	2	14551949	japanese	t	2024-11-27 03:28:55	2024-11-27 03:28:55
19158	351322308	2	16696615	cumans	t	2024-11-27 03:28:55	2024-11-27 03:28:55
19159	351322308	2	3975785	bohemians	t	2024-11-27 03:28:55	2024-11-27 03:28:55
19160	351322308	2	2696529	burgundians	t	2024-11-27 03:28:55	2024-11-27 03:28:55
19161	346417070	5	14775984	portuguese	t	2024-11-27 03:28:55	2024-11-27 03:28:55
19162	346417070	6	16840678	byzantines	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19163	346417070	7	20192926	italians	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19164	346417070	8	14551949	goths	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19165	346395064	5	14775984	portuguese	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19166	346395064	6	16840678	byzantines	t	2024-11-27 03:28:55	2024-11-27 03:28:55
19167	346395064	7	2793927	koreans	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19168	346395064	8	2696529	vikings	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19169	346395064	9	20192926	italians	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19170	346395064	10	14551949	vikings	f	2024-11-27 03:28:55	2024-11-27 03:28:55
19171	320263634	1	3319777	hindustanis	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19172	320263634	1	6215044	bohemians	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19173	320263634	1	4371847	cumans	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19174	320263634	2	2886619	huns	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19175	320263634	2	5556319	koreans	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19176	320263634	2	4033185	malians	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19177	320255590	1	781607	mayans	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19178	320255590	1	4033185	sicilians	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19179	320255590	1	5556319	incas	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19180	320255590	2	18721234	koreans	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19181	320255590	2	6215044	italians	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19182	320255590	2	4371847	turks	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19183	320249502	1	781607	koreans	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19184	320249502	1	5556319	slavs	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19185	320249502	1	6119233	lithuanians	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19186	320249502	1	652559	bengalis	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19187	320249502	2	3319777	magyars	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19188	320249502	2	2696529	mayans	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19189	320249502	2	6215044	turks	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19190	320249502	2	6830736	romans	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19191	320245065	1	6830736	ethiopians	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19192	320245065	1	6215044	tatars	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19193	320245065	2	781607	spanish	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19194	320245065	2	5556319	cumans	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19195	320245065	2	652559	armenians	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19196	320232539	1	2886619	chinese	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19197	320232539	1	11443540	mongols	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19198	320232539	1	12206179	goths	f	2024-11-27 03:28:57	2024-11-27 03:28:57
19199	320232539	2	652559	dravidians	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19200	320232539	2	6215044	burmese	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19201	320232539	2	19941388	mayans	t	2024-11-27 03:28:57	2024-11-27 03:28:57
19202	231361975	1	11715344	burmese	t	2024-11-27 03:28:59	2024-11-27 03:28:59
19203	231361975	1	1268183	burgundians	t	2024-11-27 03:28:59	2024-11-27 03:28:59
19204	231361975	1	6139075	lithuanians	t	2024-11-27 03:28:59	2024-11-27 03:28:59
19205	231361975	1	2682747	bohemians	t	2024-11-27 03:28:59	2024-11-27 03:28:59
19206	231361975	2	6269989	goths	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19207	231361975	2	2670727	portuguese	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19208	231361975	2	10594768	spanish	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19209	231361975	2	5556319	berbers	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19210	209347878	1	3216997	persians	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19211	209347878	1	6139075	incas	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19212	209347878	1	4516139	franks	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19213	209347878	1	2886619	cumans	f	2024-11-27 03:28:59	2024-11-27 03:28:59
19214	209347878	2	2776978	slavs	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19215	209347878	2	5556319	bohemians	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19216	209347878	2	11715344	magyars	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19217	209347878	2	6215044	italians	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19218	204812643	1	2670727	malay	f	2024-11-27 03:29:00	2024-11-27 03:29:00
19219	204812643	1	6139075	slavs	f	2024-11-27 03:29:00	2024-11-27 03:29:00
19220	204812643	1	4516139	ethiopians	f	2024-11-27 03:29:00	2024-11-27 03:29:00
19221	204812643	1	11715344	hindustanis	f	2024-11-27 03:29:00	2024-11-27 03:29:00
19222	204812643	2	2886619	byzantines	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19223	204812643	2	5060982	incas	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19224	204812643	2	2682747	vietnamese	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19225	204812643	2	9414798	bengalis	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19226	204158972	1	2886619	burmese	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19227	204158972	1	9454038	vikings	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19228	204158972	1	11895655	burgundians	t	2024-11-27 03:29:00	2024-11-27 03:29:00
19229	204158972	2	6139075	khmer	f	2024-11-27 03:29:00	2024-11-27 03:29:00
19230	204158972	2	2991308	slavs	f	2024-11-27 03:29:00	2024-11-27 03:29:00
19231	204158972	2	4516139	persians	f	2024-11-27 03:29:00	2024-11-27 03:29:00
19232	346334447	1	2702812	chinese	t	2024-11-27 03:29:02	2024-11-27 03:29:02
19233	346334447	1	2696529	koreans	t	2024-11-27 03:29:02	2024-11-27 03:29:02
19234	346334447	1	781607	italians	t	2024-11-27 03:29:02	2024-11-27 03:29:02
19235	346334447	2	4033185	bohemians	f	2024-11-27 03:29:02	2024-11-27 03:29:02
19236	346334447	2	5138019	teutons	f	2024-11-27 03:29:02	2024-11-27 03:29:02
19237	346334447	2	2886619	franks	f	2024-11-27 03:29:02	2024-11-27 03:29:02
19238	346327573	1	2886619	gurjaras	t	2024-11-27 03:29:02	2024-11-27 03:29:02
19239	346327573	1	18959347	burmese	t	2024-11-27 03:29:02	2024-11-27 03:29:02
19240	346327573	1	2682747	ethiopians	t	2024-11-27 03:29:02	2024-11-27 03:29:02
19241	346327573	2	2702812	sicilians	f	2024-11-27 03:29:02	2024-11-27 03:29:02
19242	346327573	2	2696529	mayans	f	2024-11-27 03:29:02	2024-11-27 03:29:02
19243	346327573	2	781607	bengalis	f	2024-11-27 03:29:03	2024-11-27 03:29:03
19244	322852828	1	4226314	lithuanians	f	2024-11-27 03:29:03	2024-11-27 03:29:03
19245	322852828	1	2702812	mongols	f	2024-11-27 03:29:03	2024-11-27 03:29:03
19246	322852828	1	6119233	cumans	f	2024-11-27 03:29:03	2024-11-27 03:29:03
19247	322852828	1	2793371	vietnamese	f	2024-11-27 03:29:03	2024-11-27 03:29:03
19248	322852828	2	2776978	magyars	t	2024-11-27 03:29:03	2024-11-27 03:29:03
19249	322852828	2	4256064	huns	t	2024-11-27 03:29:03	2024-11-27 03:29:03
19250	322852828	2	1386590	spanish	t	2024-11-27 03:29:03	2024-11-27 03:29:03
19251	322852828	2	2886619	vietnamese	t	2024-11-27 03:29:03	2024-11-27 03:29:03
19252	255581631	1	10594768	mayans	t	2024-11-27 03:29:05	2024-11-27 03:29:05
19253	255581631	1	14474131	burgundians	t	2024-11-27 03:29:05	2024-11-27 03:29:05
19254	255581631	1	6269989	britons	t	2024-11-27 03:29:05	2024-11-27 03:29:05
19255	255581631	2	218945	malay	f	2024-11-27 03:29:05	2024-11-27 03:29:05
19256	255581631	2	15675211	aztecs	f	2024-11-27 03:29:05	2024-11-27 03:29:05
19257	255581631	2	11715344	turks	f	2024-11-27 03:29:05	2024-11-27 03:29:05
19258	255577381	1	10594768	mayans	t	2024-11-27 03:29:05	2024-11-27 03:29:05
19259	255577381	1	6269989	britons	t	2024-11-27 03:29:05	2024-11-27 03:29:05
19260	255577381	1	14474131	burgundians	t	2024-11-27 03:29:05	2024-11-27 03:29:05
19261	255577381	2	11715344	turks	f	2024-11-27 03:29:05	2024-11-27 03:29:05
19262	255577381	2	15675211	aztecs	f	2024-11-27 03:29:05	2024-11-27 03:29:05
19263	255577381	2	218945	malay	f	2024-11-27 03:29:05	2024-11-27 03:29:05
19264	346165177	1	3975785	berbers	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19265	346165177	1	781607	celts	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19266	346165177	1	652559	bulgarians	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19267	346165177	1	19749740	magyars	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19268	346165177	2	1268183	burgundians	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19269	346165177	2	14135529	khmer	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19270	346165177	2	11715344	goths	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19271	346165177	2	4256064	slavs	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19272	346158738	1	4256064	tatars	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19273	346158738	1	2793927	ethiopians	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19274	346158738	1	652559	italians	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19275	346158738	1	4033185	malians	f	2024-11-27 03:29:09	2024-11-27 03:29:09
19276	346158738	2	19749740	goths	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19277	346158738	2	781607	slavs	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19278	346158738	2	12206179	berbers	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19279	346158738	2	4516139	saracens	t	2024-11-27 03:29:09	2024-11-27 03:29:09
19280	344107082	1	11715344	lithuanians	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19281	344107082	1	20067454	koreans	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19282	344107082	1	781607	bengalis	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19283	344107082	1	5138019	malay	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19284	344107082	2	2886619	incas	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19285	344107082	2	912155	bulgarians	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19286	344107082	2	4033185	poles	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19287	344107082	2	12206179	burgundians	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19288	343095777	1	20067454	lithuanians	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19289	343095777	1	20192926	mongols	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19290	343095777	1	2886619	sicilians	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19291	343095777	1	12206179	bulgarians	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19292	343095777	2	2696529	aztecs	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19293	343095777	2	781607	bengalis	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19294	343095777	2	2793927	chinese	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19295	343095777	2	11715344	poles	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19296	343090325	1	781607	aztecs	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19297	343090325	1	11715344	sicilians	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19298	343090325	1	12206179	saracens	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19299	343090325	1	20067454	italians	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19300	343090325	2	2886619	chinese	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19301	343090325	2	5556319	malay	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19302	343090325	2	20192926	ethiopians	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19303	343090325	2	2682747	koreans	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19304	343084006	1	20067454	portuguese	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19305	343084006	1	3540345	bohemians	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19306	343084006	1	20192926	byzantines	f	2024-11-27 03:29:12	2024-11-27 03:29:12
19307	343084006	2	11715344	japanese	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19308	343084006	2	781607	huns	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19309	343084006	2	2886619	burgundians	t	2024-11-27 03:29:12	2024-11-27 03:29:12
19310	354395365	1	2682747	romans	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19311	354395365	1	19749740	italians	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19312	354395365	1	4033185	khmer	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19313	354395365	1	3540345	slavs	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19314	354395365	2	652559	aztecs	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19315	354395365	2	11715344	burgundians	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19316	354395365	2	781607	byzantines	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19317	354395365	2	2758897	vietnamese	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19318	354386457	1	3540345	italians	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19319	354386457	1	21227366	bengalis	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19320	354386457	1	19749740	dravidians	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19321	354386457	1	16696615	tatars	f	2024-11-27 03:29:14	2024-11-27 03:29:14
19322	354386457	2	2682747	celts	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19323	354386457	2	11715344	khmer	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19324	354386457	2	3975785	burmese	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19325	354386457	2	2886619	gurjaras	t	2024-11-27 03:29:14	2024-11-27 03:29:14
19326	320758461	1	9454038	bulgarians	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19327	320758461	1	912155	gurjaras	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19328	320758461	1	4226314	khmer	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19329	320758461	1	2696529	mongols	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19330	320758461	2	2793371	dravidians	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19331	320758461	2	3540345	portuguese	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19332	320758461	2	5138019	vikings	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19333	320758461	2	4033185	slavs	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19334	320747468	1	3540345	dravidians	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19335	320747468	1	5138019	aztecs	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19336	320747468	1	652559	burgundians	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19337	320747468	1	2793371	khmer	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19338	320747468	2	2886619	gurjaras	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19339	320747468	2	3975785	teutons	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19340	320747468	2	9454038	britons	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19341	320747468	2	2696529	cumans	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19342	320538353	1	3540345	mongols	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19343	320538353	1	4226314	berbers	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19344	320538353	1	5138019	bulgarians	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19345	320538353	1	1386590	sicilians	t	2024-11-27 03:29:20	2024-11-27 03:29:20
19346	320538353	2	9454038	huns	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19347	320538353	2	4371847	persians	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19348	320538353	2	2793371	mayans	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19349	320538353	2	4516139	bohemians	f	2024-11-27 03:29:20	2024-11-27 03:29:20
19350	294578468	1	218945	huns	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19351	294578468	1	4226314	persians	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19352	294578468	1	2682747	georgians	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19353	294578468	1	3975785	magyars	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19354	294578468	2	410377	vikings	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19355	294578468	2	6830736	malay	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19356	294578468	2	12206179	poles	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19357	294578468	2	10011205	byzantines	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19358	294574604	1	2682747	poles	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19359	294574604	1	9454038	lithuanians	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19360	294574604	1	2749860	franks	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19361	294574604	1	410377	mongols	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19362	294574604	2	218945	burgundians	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19363	294574604	2	12206179	bohemians	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19364	294574604	2	2793927	malians	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19365	294574604	2	6830736	burmese	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19366	294570240	1	12206179	turks	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19367	294570240	1	2886619	spanish	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19368	294570240	1	3216997	bengalis	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19369	294570240	1	2793927	burgundians	t	2024-11-27 03:29:22	2024-11-27 03:29:22
19370	294570240	2	2749860	georgians	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19371	294570240	2	4226314	berbers	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19372	294570240	2	410377	burmese	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19373	294570240	2	9454038	koreans	f	2024-11-27 03:29:22	2024-11-27 03:29:22
19374	317484256	1	12206179	huns	f	2024-11-27 03:29:24	2024-11-27 03:29:24
19375	317484256	1	14551949	italians	f	2024-11-27 03:29:24	2024-11-27 03:29:24
19376	317484256	1	2886619	bohemians	f	2024-11-27 03:29:24	2024-11-27 03:29:24
19377	317484256	1	19579387	tatars	f	2024-11-27 03:29:24	2024-11-27 03:29:24
19378	317484256	2	11682652	incas	t	2024-11-27 03:29:24	2024-11-27 03:29:24
19379	317484256	2	4371847	mongols	t	2024-11-27 03:29:24	2024-11-27 03:29:24
19380	317484256	2	18415063	britons	t	2024-11-27 03:29:24	2024-11-27 03:29:24
19381	317484256	2	2682747	sicilians	t	2024-11-27 03:29:24	2024-11-27 03:29:24
19382	341123639	1	3216997	saracens	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19383	341123639	1	20192926	spanish	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19384	341123639	1	14923704	bulgarians	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19385	341123639	1	912155	slavs	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19386	341123639	2	20223883	lithuanians	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19387	341123639	2	4226314	cumans	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19388	341123639	2	14135529	teutons	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19389	341123639	2	14775984	portuguese	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19390	341114771	1	20223883	mayans	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19391	341114771	1	14135529	armenians	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19392	341114771	1	14775984	goths	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19393	341114771	1	4226314	bengalis	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19394	341114771	2	20192926	burmese	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19395	341114771	2	912155	malians	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19396	341114771	2	14923704	franks	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19397	341114771	2	3216997	dravidians	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19398	341101472	1	14135529	tatars	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19399	341101472	1	912155	persians	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19400	341101472	2	20223883	byzantines	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19401	341101472	2	18959347	huns	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19402	341101472	2	218945	khmer	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19403	341079862	1	14135529	japanese	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19404	341079862	1	20223883	aztecs	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19405	341079862	1	11715344	portuguese	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19406	341079862	2	4226314	bulgarians	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19407	341079862	2	2886619	lithuanians	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19408	341079862	2	912155	poles	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19409	340924349	1	912155	spanish	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19410	340924349	1	14135529	goths	t	2024-11-27 03:29:28	2024-11-27 03:29:28
19411	340924349	2	14923704	mayans	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19412	340924349	2	1986085	britons	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19413	340924349	2	20223883	portuguese	f	2024-11-27 03:29:28	2024-11-27 03:29:28
19414	344526432	1	912155	chinese	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19415	344526432	1	5060982	cumans	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19416	344526432	1	20192926	koreans	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19417	344526432	2	12206179	lithuanians	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19418	344526432	2	14135529	burmese	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19419	344526432	2	1986085	japanese	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19420	278502808	1	1633111	bulgarians	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19421	278502808	1	781607	mayans	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19422	278502808	1	3146059	saracens	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19423	278502808	1	2991308	celts	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19424	278502808	2	2696529	tatars	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19425	278502808	2	652559	burmese	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19426	278502808	2	5060982	goths	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19427	278502808	2	4516139	huns	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19428	278465530	1	3540345	bulgarians	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19429	278465530	1	3146059	incas	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19430	278465530	1	781607	mongols	f	2024-11-27 03:29:31	2024-11-27 03:29:31
19431	278465530	2	5060982	japanese	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19432	278465530	2	2696529	lithuanians	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19433	278465530	2	14135529	gurjaras	t	2024-11-27 03:29:31	2024-11-27 03:29:31
19434	318094451	1	6160315	cumans	t	2024-11-27 03:29:38	2024-11-27 03:29:38
19435	318094451	1	6119233	saracens	t	2024-11-27 03:29:38	2024-11-27 03:29:38
19436	318094451	1	2886619	italians	t	2024-11-27 03:29:38	2024-11-27 03:29:38
19437	318094451	1	2991308	armenians	t	2024-11-27 03:29:38	2024-11-27 03:29:38
19438	318094451	2	4516139	japanese	f	2024-11-27 03:29:38	2024-11-27 03:29:38
19439	318094451	2	2696529	mongols	f	2024-11-27 03:29:38	2024-11-27 03:29:38
19440	318094451	2	218945	vietnamese	f	2024-11-27 03:29:38	2024-11-27 03:29:38
19441	318094451	2	12206179	koreans	f	2024-11-27 03:29:38	2024-11-27 03:29:38
19442	129695071	1	4190574	japanese	t	2024-11-27 03:29:40	2024-11-27 03:29:40
19443	129695071	1	5556319	goths	t	2024-11-27 03:29:40	2024-11-27 03:29:40
19444	129695071	1	2682747	spanish	t	2024-11-27 03:29:40	2024-11-27 03:29:40
19445	129695071	2	912155	malay	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19446	129695071	2	3540345	slavs	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19447	129695071	2	4516139	byzantines	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19448	129695071	2	4573982	italians	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19449	129686309	1	4190574	malay	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19450	129686309	1	4516139	aztecs	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19451	129686309	1	4573982	italians	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19452	129686309	1	5556319	malians	f	2024-11-27 03:29:40	2024-11-27 03:29:40
19453	129686309	2	6000597	lithuanians	t	2024-11-27 03:29:40	2024-11-27 03:29:40
19454	129686309	2	912155	bulgarians	t	2024-11-27 03:29:40	2024-11-27 03:29:40
19455	129686309	2	5229566	turks	t	2024-11-27 03:29:40	2024-11-27 03:29:40
19456	129686309	2	2682747	chinese	t	2024-11-27 03:29:40	2024-11-27 03:29:40
19457	352645661	1	3540345	spanish	t	2024-11-27 03:29:42	2024-11-27 03:29:42
19458	352645661	1	21227366	hindustanis	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19459	352645661	1	3975785	mongols	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19460	352645661	1	16696615	chinese	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19461	352645661	2	2682747	teutons	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19462	352645661	2	19749740	burmese	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19463	352645661	2	18841242	persians	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19464	352645661	2	4033185	berbers	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19465	352124897	1	652559	magyars	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19466	352124897	1	3319777	koreans	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19467	352124897	1	21227366	portuguese	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19468	352124897	1	3540345	sicilians	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19469	352124897	2	11955124	poles	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19470	352124897	2	18841242	turks	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19471	352124897	2	19749740	britons	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19472	352124897	2	2682747	burmese	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19473	350890995	1	19579387	japanese	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19474	350890995	1	16696615	spanish	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19475	350890995	1	4033185	mayans	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19476	350890995	1	2696529	saracens	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19477	350890995	2	2682747	khmer	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19478	350890995	2	2886619	poles	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19479	350890995	2	18841242	chinese	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19480	350890995	2	3540345	ethiopians	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19481	350878474	1	652559	malians	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19482	350878474	1	2696529	japanese	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19483	350878474	1	18765026	aztecs	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19484	350878474	1	18841242	incas	t	2024-11-27 03:29:43	2024-11-27 03:29:43
19485	350878474	2	4033185	britons	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19486	350878474	2	9417745	bengalis	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19487	350878474	2	2682747	mongols	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19488	350878474	2	2886619	hindustanis	f	2024-11-27 03:29:43	2024-11-27 03:29:43
19489	312276760	1	18765026	koreans	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19490	312276760	1	19579387	aztecs	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19491	312276760	1	2682747	bulgarians	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19492	312276760	2	16840678	malay	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19493	312276760	2	3146059	mayans	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19494	312276760	2	4371847	magyars	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19495	312276760	2	12206179	tatars	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19496	312043920	1	4226314	italians	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19497	312043920	1	19579387	malay	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19498	312043920	1	1633111	tatars	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19499	312043920	1	16840678	magyars	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19500	312043920	2	12206179	incas	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19501	312043920	2	2682747	mayans	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19502	312043920	2	3146059	malians	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19503	312043920	2	5138019	aztecs	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19504	311800918	1	18959347	italians	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19505	311800918	1	2886619	huns	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19506	311800918	1	3975785	lithuanians	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19507	311800918	1	19732014	spanish	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19508	311800918	2	6830736	vikings	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19509	311800918	2	3319777	celts	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19510	311800918	2	3146059	chinese	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19511	311800918	2	12206179	byzantines	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19512	311794525	1	2682747	koreans	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19513	311794525	1	3146059	byzantines	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19514	311794525	1	6830736	cumans	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19515	311794525	1	14551949	dravidians	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19516	311794525	2	18765026	italians	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19517	311794525	2	12206179	burmese	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19518	311794525	2	18959347	spanish	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19519	311794525	2	4371847	japanese	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19520	311789093	1	18959347	slavs	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19521	311789093	1	18765026	ethiopians	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19522	311789093	1	19579387	goths	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19523	311789093	1	3146059	japanese	f	2024-11-27 03:29:45	2024-11-27 03:29:45
19524	311789093	2	12206179	saracens	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19525	311789093	2	4371847	mongols	t	2024-11-27 03:29:45	2024-11-27 03:29:45
19526	311789093	2	3319777	gurjaras	t	2024-11-27 03:29:46	2024-11-27 03:29:46
19527	311789093	2	2682747	berbers	t	2024-11-27 03:29:46	2024-11-27 03:29:46
19528	354118783	1	2758897	chinese	t	2024-11-27 03:29:48	2024-11-27 03:29:48
19529	354118783	1	2682747	sicilians	t	2024-11-27 03:29:48	2024-11-27 03:29:48
19530	354118783	1	18959347	aztecs	t	2024-11-27 03:29:48	2024-11-27 03:29:48
19531	354118783	2	4033185	ethiopians	f	2024-11-27 03:29:48	2024-11-27 03:29:48
19532	354118783	2	2886619	spanish	f	2024-11-27 03:29:48	2024-11-27 03:29:48
19533	354118783	2	16696615	incas	f	2024-11-27 03:29:48	2024-11-27 03:29:48
19534	292782285	1	9417745	vikings	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19535	292782285	1	1101756	vietnamese	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19536	292782285	1	1633111	burgundians	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19537	292782285	1	4516139	franks	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19538	292782285	2	2682747	cumans	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19539	292782285	2	11955124	khmer	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19540	292782285	2	3975785	malians	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19541	292782285	2	12206179	mayans	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19542	292769434	1	1633111	hindustanis	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19543	292769434	1	11443540	vikings	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19544	292769434	1	652559	burmese	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19545	292769434	1	1101756	koreans	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19546	292769434	2	12206179	japanese	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19547	292769434	2	9454038	magyars	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19548	292769434	2	3975785	ethiopians	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19549	292769434	2	2682747	huns	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19550	248194308	1	15347672	lithuanians	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19551	248194308	1	781607	teutons	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19552	248194308	1	2886619	franks	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19553	248194308	1	2749860	incas	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19554	248194308	2	4516139	turks	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19555	248194308	2	6130469	magyars	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19556	248194308	2	1101756	persians	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19557	248194308	2	11715344	burmese	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19558	248189066	1	10011205	teutons	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19559	248189066	1	15347672	japanese	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19560	248189066	1	2886619	turks	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19561	248189066	1	11715344	italians	f	2024-11-27 03:29:50	2024-11-27 03:29:50
19562	248189066	2	1633111	franks	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19563	248189066	2	6130469	tatars	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19564	248189066	2	2749860	portuguese	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19565	248189066	2	1101756	ethiopians	t	2024-11-27 03:29:50	2024-11-27 03:29:50
19566	350276298	1	652559	malay	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19567	350276298	1	421538	sicilians	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19568	350276298	1	9454038	byzantines	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19569	350276298	2	5138019	goths	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19570	350276298	2	2886619	italians	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19571	350276298	2	3216997	georgians	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19572	350270011	1	4516139	byzantines	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19573	350270011	1	3540345	mayans	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19574	350270011	1	9454038	vikings	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19575	350270011	1	652559	bengalis	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19576	350270011	2	421538	incas	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19577	350270011	2	5138019	chinese	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19578	350270011	2	11443540	portuguese	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19579	350270011	2	3319777	malay	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19580	350080627	1	2682747	khmer	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19581	350080627	1	4516139	lithuanians	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19582	350080627	1	912155	aztecs	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19583	350080627	1	4226314	byzantines	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19584	350080627	2	3319777	armenians	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19585	350080627	2	421538	spanish	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19586	350080627	2	21059248	hindustanis	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19587	350080627	2	781607	italians	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19588	348769635	1	421538	byzantines	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19589	348769635	1	4226314	spanish	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19590	348769635	1	2682747	hindustanis	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19591	348769635	1	781607	britons	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19592	348769635	2	3216997	gurjaras	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19593	348769635	2	3319777	ethiopians	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19594	348769635	2	2696529	berbers	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19595	348769635	2	12206179	japanese	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19596	347920087	1	18959347	aztecs	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19597	347920087	1	11955124	incas	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19598	347920087	1	4226314	sicilians	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19599	347920087	1	3975785	berbers	t	2024-11-27 03:29:52	2024-11-27 03:29:52
19600	347920087	2	421538	burgundians	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19601	347920087	2	2886619	magyars	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19602	347920087	2	2682747	tatars	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19603	347920087	2	19749740	japanese	f	2024-11-27 03:29:52	2024-11-27 03:29:52
19604	350085115	1	912155	huns	t	2024-11-27 03:29:55	2024-11-27 03:29:55
19605	350085115	1	4226314	incas	t	2024-11-27 03:29:55	2024-11-27 03:29:55
19606	350085115	1	5138019	spanish	t	2024-11-27 03:29:55	2024-11-27 03:29:55
19607	350085115	1	781607	lithuanians	t	2024-11-27 03:29:55	2024-11-27 03:29:55
19608	350085115	2	2682747	slavs	f	2024-11-27 03:29:55	2024-11-27 03:29:55
19609	350085115	2	12206179	magyars	f	2024-11-27 03:29:55	2024-11-27 03:29:55
19610	350085115	2	2696529	celts	f	2024-11-27 03:29:55	2024-11-27 03:29:55
19611	350085115	2	18841242	goths	f	2024-11-27 03:29:55	2024-11-27 03:29:55
19612	352648979	1	781607	malians	t	2024-11-27 03:29:57	2024-11-27 03:29:57
19613	352648979	1	4516139	teutons	t	2024-11-27 03:29:57	2024-11-27 03:29:57
19614	352648979	1	5138019	cumans	t	2024-11-27 03:29:57	2024-11-27 03:29:57
19615	352648979	1	11443540	mayans	t	2024-11-27 03:29:57	2024-11-27 03:29:57
19616	352648979	2	20351985	tatars	f	2024-11-27 03:29:57	2024-11-27 03:29:57
19617	352648979	2	11715344	huns	f	2024-11-27 03:29:57	2024-11-27 03:29:57
19618	352648979	2	12206179	bengalis	f	2024-11-27 03:29:57	2024-11-27 03:29:57
19619	352648979	2	912155	slavs	f	2024-11-27 03:29:57	2024-11-27 03:29:57
19620	335146874	1	912155	chinese	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19621	335146874	1	2886619	mayans	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19622	335146874	1	16840678	mongols	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19623	335146874	1	6269989	malay	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19624	335146874	2	18171781	berbers	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19625	335146874	2	11715344	khmer	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19626	335146874	2	19749740	portuguese	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19627	335146874	2	2758897	lithuanians	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19628	332225616	1	14923704	chinese	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19629	332225616	1	4256064	koreans	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19630	332225616	1	2682747	vikings	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19631	332225616	1	4033185	turks	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19632	332225616	2	18171781	britons	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19633	332225616	2	5138019	aztecs	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19634	332225616	2	4226314	japanese	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19635	332225616	2	3975785	mayans	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19636	327742489	1	4256064	saracens	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19637	327742489	1	218945	ethiopians	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19638	327742489	1	2886619	japanese	f	2024-11-27 03:30:00	2024-11-27 03:30:00
19639	327742489	2	18171781	britons	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19640	327742489	2	4516139	koreans	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19641	327742489	2	1986085	britons	t	2024-11-27 03:30:00	2024-11-27 03:30:00
19642	235160423	1	652559	burmese	t	2024-11-27 03:30:02	2024-11-27 03:30:02
19643	235160423	1	2702812	lithuanians	t	2024-11-27 03:30:02	2024-11-27 03:30:02
19644	235160423	1	1557172	cumans	t	2024-11-27 03:30:02	2024-11-27 03:30:02
19645	235160423	2	218945	britons	f	2024-11-27 03:30:02	2024-11-27 03:30:02
19646	235160423	2	2886619	tatars	f	2024-11-27 03:30:02	2024-11-27 03:30:02
19647	235160423	2	4516139	saracens	f	2024-11-27 03:30:02	2024-11-27 03:30:02
19648	235160423	2	1268183	sicilians	f	2024-11-27 03:30:02	2024-11-27 03:30:02
19649	235153865	1	1557172	berbers	t	2024-11-27 03:30:02	2024-11-27 03:30:02
19650	235153865	1	2886619	koreans	t	2024-11-27 03:30:02	2024-11-27 03:30:02
19651	235153865	2	218945	slavs	f	2024-11-27 03:30:02	2024-11-27 03:30:02
19652	235153865	2	10011205	sicilians	f	2024-11-27 03:30:02	2024-11-27 03:30:02
19653	352563053	1	20192926	persians	t	2024-11-27 03:30:04	2024-11-27 03:30:04
19654	352563053	1	2991308	hindustanis	t	2024-11-27 03:30:04	2024-11-27 03:30:04
19655	352563053	1	4516139	slavs	t	2024-11-27 03:30:04	2024-11-27 03:30:04
19656	352563053	1	12206179	britons	t	2024-11-27 03:30:04	2024-11-27 03:30:04
19657	352563053	2	3540345	bengalis	f	2024-11-27 03:30:04	2024-11-27 03:30:04
19658	352563053	2	2682747	georgians	f	2024-11-27 03:30:04	2024-11-27 03:30:04
19659	352563053	2	2886619	magyars	f	2024-11-27 03:30:04	2024-11-27 03:30:04
19660	352563053	2	3975785	cumans	f	2024-11-27 03:30:04	2024-11-27 03:30:04
19661	352324058	1	5556319	mongols	f	2024-11-27 03:30:04	2024-11-27 03:30:04
19662	352324058	1	2991308	ethiopians	f	2024-11-27 03:30:04	2024-11-27 03:30:04
19663	352324058	1	3540345	bohemians	f	2024-11-27 03:30:04	2024-11-27 03:30:04
19664	352324058	2	2682747	gurjaras	t	2024-11-27 03:30:04	2024-11-27 03:30:04
19665	352324058	2	2886619	vikings	t	2024-11-27 03:30:04	2024-11-27 03:30:04
19666	352324058	2	21227366	malay	t	2024-11-27 03:30:04	2024-11-27 03:30:04
19667	264093024	5	2886619	spanish	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19668	264093024	6	10184599	franks	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19669	264093024	7	4516139	vietnamese	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19670	255550921	1	14474131	bengalis	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19671	255550921	1	781607	chinese	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19672	255550921	1	2886619	berbers	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19673	255550921	2	10184599	teutons	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19674	255550921	2	4516139	mayans	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19675	255550921	2	5556319	bulgarians	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19676	255546270	1	14474131	celts	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19677	255546270	1	2886619	lithuanians	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19678	255546270	1	781607	japanese	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19679	255546270	1	10184599	vikings	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19680	255546270	2	4516139	portuguese	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19681	255546270	2	218945	byzantines	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19682	255546270	2	5040262	chinese	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19683	255546270	2	5556319	burmese	f	2024-11-27 03:30:06	2024-11-27 03:30:06
19684	255541371	1	218945	sicilians	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19685	255541371	1	5556319	franks	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19686	255541371	1	4256064	japanese	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19687	255541371	1	14474131	ethiopians	t	2024-11-27 03:30:06	2024-11-27 03:30:06
19688	255541371	2	2886619	italians	f	2024-11-27 03:30:07	2024-11-27 03:30:07
19689	255541371	2	5040262	chinese	f	2024-11-27 03:30:07	2024-11-27 03:30:07
19690	255541371	2	10184599	tatars	f	2024-11-27 03:30:07	2024-11-27 03:30:07
19691	255541371	2	4516139	malay	f	2024-11-27 03:30:07	2024-11-27 03:30:07
19692	335594018	1	19749740	cumans	t	2024-11-27 03:30:11	2024-11-27 03:30:11
19693	335594018	1	2682747	burmese	t	2024-11-27 03:30:11	2024-11-27 03:30:11
19694	335594018	1	781607	koreans	t	2024-11-27 03:30:11	2024-11-27 03:30:11
19695	335594018	1	5556319	berbers	t	2024-11-27 03:30:11	2024-11-27 03:30:11
19696	335594018	2	5138019	malay	f	2024-11-27 03:30:11	2024-11-27 03:30:11
19697	335594018	2	9602121	ethiopians	f	2024-11-27 03:30:11	2024-11-27 03:30:11
19698	335594018	2	2696529	mongols	f	2024-11-27 03:30:11	2024-11-27 03:30:11
19699	335594018	2	1386590	britons	f	2024-11-27 03:30:11	2024-11-27 03:30:11
19700	335586967	1	2682747	georgians	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19701	335586967	1	2696529	malians	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19702	335586967	1	5556319	vietnamese	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19703	335586967	1	5138019	turks	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19704	335586967	2	19749740	berbers	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19705	335586967	2	1268183	byzantines	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19706	335586967	2	9602121	cumans	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19707	335586967	2	781607	dravidians	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19708	233280146	1	2682747	saracens	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19709	233280146	1	3540345	bulgarians	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19710	233280146	1	4033185	huns	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19711	233280146	1	9602121	koreans	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19712	233280146	2	6269989	malay	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19713	233280146	2	9454038	japanese	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19714	233280146	2	652559	incas	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19715	233280146	2	5556319	byzantines	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19716	233272517	1	2682747	spanish	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19717	233272517	1	652559	incas	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19718	233272517	1	1268183	vietnamese	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19719	233272517	1	6269989	franks	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19720	233272517	2	1386590	malay	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19721	233272517	2	3540345	saracens	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19722	233272517	2	9602121	burgundians	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19723	233272517	2	4033185	malians	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19724	233264995	1	3540345	burmese	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19725	233264995	1	652559	bulgarians	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19726	233264995	1	9602121	slavs	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19727	233264995	1	1386590	britons	f	2024-11-27 03:30:12	2024-11-27 03:30:12
19728	233264995	2	4033185	franks	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19729	233264995	2	1268183	celts	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19730	233264995	2	2682747	koreans	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19731	233264995	2	6269989	lithuanians	t	2024-11-27 03:30:12	2024-11-27 03:30:12
19732	352303990	1	21227366	persians	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19733	352303990	1	1386590	franks	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19734	352303990	1	10140054	chinese	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19735	352303990	2	12206179	burgundians	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19736	352303990	2	2682747	bulgarians	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19737	352303990	2	5556319	burmese	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19738	351889199	1	3319777	vikings	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19739	351889199	1	3975785	incas	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19740	351889199	1	2682747	byzantines	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19741	351889199	2	16696615	persians	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19742	351889199	2	10140054	celts	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19743	351889199	2	4033185	malians	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19744	347830776	1	4226314	malians	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19745	347830776	1	10140054	vietnamese	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19746	347830776	1	5556319	khmer	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19747	347830776	1	12206179	aztecs	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19748	347830776	2	421538	sicilians	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19749	347830776	2	4033185	bulgarians	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19750	347830776	2	21059248	slavs	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19751	347830776	2	1386590	burmese	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19752	335394721	1	10140054	cumans	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19753	335394721	1	652559	burgundians	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19754	335394721	1	20222695	italians	f	2024-11-27 03:30:14	2024-11-27 03:30:14
19755	335394721	2	5138019	mayans	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19756	335394721	2	5556319	mongols	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19757	335394721	2	2886619	portuguese	t	2024-11-27 03:30:14	2024-11-27 03:30:14
19758	331325934	1	4226314	mayans	t	2024-11-27 03:30:15	2024-11-27 03:30:15
19759	331325934	1	1268183	persians	t	2024-11-27 03:30:15	2024-11-27 03:30:15
19760	331325934	1	1386590	italians	t	2024-11-27 03:30:15	2024-11-27 03:30:15
19761	331325934	1	2886619	burmese	t	2024-11-27 03:30:15	2024-11-27 03:30:15
19762	331325934	2	3216997	bohemians	f	2024-11-27 03:30:15	2024-11-27 03:30:15
19763	331325934	2	5556319	aztecs	f	2024-11-27 03:30:15	2024-11-27 03:30:15
19764	331325934	2	10140054	dravidians	f	2024-11-27 03:30:15	2024-11-27 03:30:15
19765	331325934	2	19749740	berbers	f	2024-11-27 03:30:15	2024-11-27 03:30:15
19766	354169798	1	652559	celts	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19767	354169798	1	19749740	vikings	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19768	354169798	1	2682747	vietnamese	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19769	354169798	1	11715344	portuguese	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19770	354169798	2	21059248	ethiopians	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19771	354169798	2	3216997	georgians	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19772	354169798	2	3540345	bengalis	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19773	354169798	2	2886619	huns	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19774	353686136	1	652559	mayans	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19775	353686136	1	6783155	burgundians	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19776	353686136	1	912155	khmer	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19777	353686136	1	2682747	bohemians	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19778	353686136	2	21059248	hindustanis	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19779	353686136	2	5138019	magyars	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19780	353686136	2	781607	malay	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19781	353686136	2	17593325	koreans	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19782	353279142	1	2758897	byzantines	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19783	353279142	1	3540345	persians	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19784	353279142	1	2682747	koreans	f	2024-11-27 03:30:17	2024-11-27 03:30:17
19785	353279142	2	21059248	vikings	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19786	353279142	2	3975785	gurjaras	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19787	353279142	2	19749740	burmese	t	2024-11-27 03:30:17	2024-11-27 03:30:17
19788	352158682	1	781607	spanish	f	2024-11-27 03:30:19	2024-11-27 03:30:19
19789	352158682	1	6119233	slavs	f	2024-11-27 03:30:19	2024-11-27 03:30:19
19790	352158682	1	20192926	bengalis	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19791	352158682	1	9583069	cumans	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19792	352158682	2	1986085	sicilians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19793	352158682	2	9454038	magyars	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19794	352158682	2	912155	persians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19795	352158682	2	12206179	malay	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19796	352152411	1	1986085	celts	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19797	352152411	1	912155	armenians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19798	352152411	1	9454038	mayans	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19799	352152411	1	12206179	turks	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19800	352152411	2	781607	tatars	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19801	352152411	2	9583069	huns	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19802	352152411	2	6119233	bulgarians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19803	352152411	2	20192926	incas	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19804	352143443	1	781607	sicilians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19805	352143443	1	9583069	vikings	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19806	352143443	1	6119233	lithuanians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19807	352143443	1	20192926	bulgarians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19808	352143443	2	12206179	georgians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19809	352143443	2	912155	burmese	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19810	352143443	2	9454038	saracens	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19811	352143443	2	1986085	ethiopians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19812	352134440	1	3540345	persians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19813	352134440	1	16840678	vikings	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19814	352134440	1	1268183	dravidians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19815	352134440	1	16696615	saracens	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19816	352134440	2	1986085	italians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19817	352134440	2	6119233	persians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19818	352134440	2	9454038	vikings	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19819	352134440	2	9583069	dravidians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19820	351133486	1	19579387	bulgarians	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19821	351133486	1	2886619	mayans	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19822	351133486	1	9454038	incas	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19823	351133486	1	3216997	chinese	f	2024-11-27 03:30:20	2024-11-27 03:30:20
19824	351133486	2	5138019	vietnamese	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19825	351133486	2	781607	berbers	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19826	351133486	2	6119233	malians	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19827	351133486	2	2682747	spanish	t	2024-11-27 03:30:20	2024-11-27 03:30:20
19828	349167389	1	6119233	japanese	t	2024-11-27 03:30:21	2024-11-27 03:30:21
19829	349167389	1	1986085	vikings	t	2024-11-27 03:30:21	2024-11-27 03:30:21
19830	349167389	1	20192926	persians	t	2024-11-27 03:30:21	2024-11-27 03:30:21
19831	349167389	1	11443540	italians	t	2024-11-27 03:30:21	2024-11-27 03:30:21
19832	349167389	2	19636187	portuguese	f	2024-11-27 03:30:21	2024-11-27 03:30:21
19833	349167389	2	15133012	koreans	f	2024-11-27 03:30:21	2024-11-27 03:30:21
19834	349167389	2	14923704	spanish	f	2024-11-27 03:30:21	2024-11-27 03:30:21
19835	349167389	2	17846155	japanese	f	2024-11-27 03:30:21	2024-11-27 03:30:21
19836	352363321	1	21227366	goths	t	2024-11-27 03:30:30	2024-11-27 03:30:30
19837	352363321	1	3319777	aztecs	t	2024-11-27 03:30:30	2024-11-27 03:30:30
19838	352363321	1	2682747	magyars	t	2024-11-27 03:30:30	2024-11-27 03:30:30
19839	352363321	2	16696615	persians	f	2024-11-27 03:30:30	2024-11-27 03:30:30
19840	352363321	2	19749740	bohemians	f	2024-11-27 03:30:30	2024-11-27 03:30:30
19841	352363321	2	9417745	italians	f	2024-11-27 03:30:30	2024-11-27 03:30:30
19842	351924372	1	2682747	mayans	t	2024-11-27 03:30:30	2024-11-27 03:30:30
19843	351924372	1	16840678	cumans	t	2024-11-27 03:30:30	2024-11-27 03:30:30
19844	351924372	1	5556319	chinese	t	2024-11-27 03:30:30	2024-11-27 03:30:30
19845	351924372	1	16696615	spanish	t	2024-11-27 03:30:30	2024-11-27 03:30:30
19846	351924372	2	3319777	burmese	f	2024-11-27 03:30:30	2024-11-27 03:30:30
19847	351924372	2	12206179	armenians	f	2024-11-27 03:30:30	2024-11-27 03:30:30
19848	351924372	2	2886619	persians	f	2024-11-27 03:30:30	2024-11-27 03:30:30
19849	351924372	2	781607	aztecs	f	2024-11-27 03:30:30	2024-11-27 03:30:30
19850	348083454	1	5138019	spanish	t	2024-11-27 03:30:32	2024-11-27 03:30:32
19851	348083454	1	2886619	saracens	t	2024-11-27 03:30:32	2024-11-27 03:30:32
19852	348083454	1	4033185	slavs	t	2024-11-27 03:30:32	2024-11-27 03:30:32
19853	348083454	1	4516139	byzantines	t	2024-11-27 03:30:32	2024-11-27 03:30:32
19854	348083454	2	3216997	portuguese	f	2024-11-27 03:30:32	2024-11-27 03:30:32
19855	348083454	2	14775984	khmer	f	2024-11-27 03:30:32	2024-11-27 03:30:32
19856	348083454	2	11682652	vikings	f	2024-11-27 03:30:32	2024-11-27 03:30:32
19857	348083454	2	3319777	burgundians	f	2024-11-27 03:30:32	2024-11-27 03:30:32
19858	343923075	1	12206179	spanish	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19859	343923075	1	11715344	turks	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19860	343923075	1	1268183	gurjaras	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19861	343923075	1	4516139	vikings	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19862	343923075	2	2991308	burmese	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19863	343923075	2	3540345	aztecs	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19864	343923075	2	15347672	chinese	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19865	343923075	2	2886619	bengalis	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19866	342500938	1	2886619	celts	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19867	342500938	1	15347672	chinese	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19868	342500938	1	1268183	mongols	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19869	342500938	1	1386590	hindustanis	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19870	342500938	2	2682747	incas	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19871	342500938	2	5556319	slavs	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19872	342500938	2	781607	turks	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19873	342500938	2	19749740	byzantines	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19874	341281889	1	2682747	tatars	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19875	341281889	1	3319777	persians	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19876	341281889	1	3216997	japanese	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19877	341281889	1	15347672	poles	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19878	341281889	2	5138019	hindustanis	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19879	341281889	2	781607	mayans	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19880	341281889	2	652559	goths	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19881	341281889	2	3540345	georgians	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19882	333667919	1	5556319	lithuanians	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19883	333667919	1	4516139	japanese	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19884	333667919	1	1386590	sicilians	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19885	333667919	1	3216997	britons	f	2024-11-27 03:30:35	2024-11-27 03:30:35
19886	333667919	2	15347672	tatars	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19887	333667919	2	2991308	teutons	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19888	333667919	2	1268183	mongols	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19889	333667919	2	912155	georgians	t	2024-11-27 03:30:35	2024-11-27 03:30:35
19890	353073989	1	16696615	italians	t	2024-11-27 03:30:37	2024-11-27 03:30:37
19891	353073989	1	2682747	vikings	t	2024-11-27 03:30:37	2024-11-27 03:30:37
19892	353073989	1	4516139	georgians	t	2024-11-27 03:30:37	2024-11-27 03:30:37
19893	353073989	1	12206179	tatars	t	2024-11-27 03:30:37	2024-11-27 03:30:37
19894	353073989	2	3540345	byzantines	f	2024-11-27 03:30:37	2024-11-27 03:30:37
19895	353073989	2	9417745	mongols	f	2024-11-27 03:30:37	2024-11-27 03:30:37
19896	353073989	2	652559	malay	f	2024-11-27 03:30:37	2024-11-27 03:30:37
19897	353073989	2	19882187	goths	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19898	352572022	1	12206179	incas	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19899	352572022	1	781607	aztecs	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19900	352572022	1	9417745	malians	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19901	352572022	1	2886619	japanese	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19902	352572022	2	652559	mayans	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19903	352572022	2	19749740	teutons	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19904	352572022	2	2682747	burgundians	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19905	352572022	2	4516139	romans	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19906	352568782	1	781607	magyars	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19907	352568782	1	12206179	hindustanis	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19908	352568782	1	20192926	burgundians	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19909	352568782	1	9417745	goths	t	2024-11-27 03:30:38	2024-11-27 03:30:38
19910	352568782	2	19749740	bulgarians	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19911	352568782	2	4516139	berbers	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19912	352568782	2	2886619	chinese	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19913	352568782	2	2682747	dravidians	f	2024-11-27 03:30:38	2024-11-27 03:30:38
19914	354179043	1	2682747	incas	t	2024-11-27 03:30:40	2024-11-27 03:30:40
19915	354179043	1	19882187	berbers	t	2024-11-27 03:30:40	2024-11-27 03:30:40
19916	354179043	1	652559	vietnamese	t	2024-11-27 03:30:40	2024-11-27 03:30:40
19917	354179043	1	2758897	saracens	t	2024-11-27 03:30:40	2024-11-27 03:30:40
19918	354179043	2	19749740	magyars	f	2024-11-27 03:30:40	2024-11-27 03:30:40
19919	354179043	2	11715344	byzantines	f	2024-11-27 03:30:40	2024-11-27 03:30:40
19920	354179043	2	912155	malians	f	2024-11-27 03:30:40	2024-11-27 03:30:40
19921	354179043	2	781607	huns	f	2024-11-27 03:30:40	2024-11-27 03:30:40
19922	327058617	1	2682747	georgians	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19923	327058617	1	2670727	saracens	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19924	327058617	1	18959347	goths	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19925	327058617	1	4226314	byzantines	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19926	327058617	2	18765026	malay	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19927	327058617	2	3975785	celts	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19928	327058617	2	1268183	hindustanis	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19929	327058617	2	2886619	dravidians	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19930	327051390	1	2670727	italians	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19931	327051390	1	19749740	saracens	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19932	327051390	1	18765026	aztecs	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19933	327051390	1	3975785	bengalis	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19934	327051390	2	2886619	tatars	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19935	327051390	2	1386590	bulgarians	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19936	327051390	2	10011205	spanish	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19937	327051390	2	1268183	japanese	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19938	326644745	1	18765026	incas	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19939	326644745	1	4516139	malay	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19940	326644745	1	19749740	byzantines	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19941	326644745	1	2886619	cumans	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19942	326644745	2	3975785	burmese	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19943	326644745	2	19997314	mongols	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19944	326644745	2	5138019	bulgarians	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19945	326644745	2	4226314	spanish	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19946	326455066	1	781607	celts	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19947	326455066	1	19749740	lithuanians	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19948	326455066	1	2670727	magyars	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19949	326455066	1	12206179	cumans	f	2024-11-27 03:30:43	2024-11-27 03:30:43
19950	326455066	2	18765026	bulgarians	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19951	326455066	2	18959347	britons	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19952	326455066	2	1386590	saracens	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19953	326455066	2	4226314	dravidians	t	2024-11-27 03:30:43	2024-11-27 03:30:43
19954	290574461	1	4256064	saracens	t	2024-11-27 03:30:45	2024-11-27 03:30:45
19955	290574461	1	4516139	portuguese	t	2024-11-27 03:30:45	2024-11-27 03:30:45
19956	290574461	1	12199368	japanese	t	2024-11-27 03:30:45	2024-11-27 03:30:45
19957	290574461	2	2886619	malay	f	2024-11-27 03:30:45	2024-11-27 03:30:45
19958	290574461	2	781607	dravidians	f	2024-11-27 03:30:45	2024-11-27 03:30:45
19959	290574461	2	10594768	italians	f	2024-11-27 03:30:45	2024-11-27 03:30:45
19960	290373356	1	10594768	huns	f	2024-11-27 03:30:45	2024-11-27 03:30:45
19961	290373356	1	11955124	turks	f	2024-11-27 03:30:45	2024-11-27 03:30:45
19962	290373356	1	18756386	persians	f	2024-11-27 03:30:45	2024-11-27 03:30:45
19963	290373356	1	11715344	celts	f	2024-11-27 03:30:45	2024-11-27 03:30:45
19964	290373356	2	12206179	magyars	t	2024-11-27 03:30:45	2024-11-27 03:30:45
19965	290373356	2	10011205	byzantines	t	2024-11-27 03:30:45	2024-11-27 03:30:45
19966	290373356	2	5321797	goths	t	2024-11-27 03:30:45	2024-11-27 03:30:45
19967	290373356	2	16973676	mongols	t	2024-11-27 03:30:45	2024-11-27 03:30:45
19968	351124743	1	652559	khmer	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19969	351124743	1	3319777	italians	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19970	351124743	1	1268183	vikings	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19971	351124743	1	16840678	lithuanians	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19972	351124743	2	6830736	armenians	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19973	351124743	2	6130469	dravidians	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19974	351124743	2	2886619	vikings	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19975	351124743	2	11682652	persians	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19976	347267031	1	652559	bengalis	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19977	347267031	1	6130469	japanese	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19978	347267031	1	11955124	mongols	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19979	347267031	1	2682747	burmese	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19980	347267031	2	4033185	chinese	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19981	347267031	2	5138019	saracens	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19982	347267031	2	4226314	burgundians	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19983	347267031	2	5556319	khmer	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19984	347260247	1	4033185	burgundians	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19985	347260247	1	2696529	sicilians	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19986	347260247	1	652559	celts	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19987	347260247	1	5138019	spanish	f	2024-11-27 03:31:00	2024-11-27 03:31:00
19988	347260247	2	6130469	huns	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19989	347260247	2	5556319	teutons	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19990	347260247	2	2682747	portuguese	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19991	347260247	2	2886619	bohemians	t	2024-11-27 03:31:00	2024-11-27 03:31:00
19992	353692897	1	2682747	gurjaras	t	2024-11-27 03:31:02	2024-11-27 03:31:02
19993	353692897	1	5138019	turks	t	2024-11-27 03:31:02	2024-11-27 03:31:02
19994	353692897	1	912155	sicilians	t	2024-11-27 03:31:02	2024-11-27 03:31:02
19995	353692897	1	3540345	georgians	t	2024-11-27 03:31:02	2024-11-27 03:31:02
19996	353692897	2	781607	hindustanis	f	2024-11-27 03:31:02	2024-11-27 03:31:02
19997	353692897	2	652559	spanish	f	2024-11-27 03:31:02	2024-11-27 03:31:02
19998	353692897	2	3216997	teutons	f	2024-11-27 03:31:02	2024-11-27 03:31:02
19999	353692897	2	17593325	magyars	f	2024-11-27 03:31:02	2024-11-27 03:31:02
20000	352318730	1	5556319	bohemians	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20001	352318730	1	2886619	spanish	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20002	352318730	1	5138019	koreans	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20003	352318730	1	3540345	franks	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20004	352318730	2	19749740	huns	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20005	352318730	2	18959347	byzantines	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20006	352318730	2	2682747	lithuanians	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20007	352318730	2	2991308	armenians	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20008	352313994	1	5556319	bengalis	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20009	352313994	1	19749740	slavs	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20010	352313994	1	2886619	lithuanians	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20011	352313994	1	5138019	burmese	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20012	352313994	2	2682747	ethiopians	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20013	352313994	2	12206179	teutons	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20014	352313994	2	21227366	spanish	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20015	352313994	2	18959347	saracens	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20016	352309214	1	1386590	vietnamese	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20017	352309214	1	21227366	turks	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20018	352309214	1	2991308	aztecs	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20019	352309214	1	5556319	celts	t	2024-11-27 03:31:05	2024-11-27 03:31:05
20020	352309214	2	19749740	magyars	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20021	352309214	2	2682747	teutons	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20022	352309214	2	12206179	chinese	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20023	352309214	2	18959347	japanese	f	2024-11-27 03:31:05	2024-11-27 03:31:05
20024	116335835	1	4190574	indians	f	2024-11-27 03:31:07	2024-11-27 03:31:07
20025	116335835	1	5138019	mongols	f	2024-11-27 03:31:07	2024-11-27 03:31:07
20026	116335835	1	2670727	koreans	f	2024-11-27 03:31:07	2024-11-27 03:31:07
20027	116335835	1	3023292	tatars	f	2024-11-27 03:31:07	2024-11-27 03:31:07
20028	116335835	2	2682747	burmese	t	2024-11-27 03:31:07	2024-11-27 03:31:07
20029	116335835	2	2702812	italians	t	2024-11-27 03:31:07	2024-11-27 03:31:07
20030	116335835	2	652559	goths	t	2024-11-27 03:31:07	2024-11-27 03:31:07
20031	116335835	2	2793371	incas	t	2024-11-27 03:31:07	2024-11-27 03:31:07
20032	350647944	1	4033185	poles	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20033	350647944	1	9454038	franks	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20034	350647944	1	18841242	chinese	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20035	350647944	1	5556319	huns	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20036	350647944	2	19749740	mongols	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20037	350647944	2	3216997	portuguese	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20038	350647944	2	652559	malay	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20039	350647944	2	1268183	vietnamese	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20040	350639091	1	9454038	saracens	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20041	350639091	1	912155	huns	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20042	350639091	1	1386590	lithuanians	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20043	350639091	1	4516139	malians	t	2024-11-27 03:31:10	2024-11-27 03:31:10
20044	350639091	2	19579387	koreans	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20045	350639091	2	5556319	burgundians	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20046	350639091	2	1268183	poles	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20047	350639091	2	652559	bohemians	f	2024-11-27 03:31:10	2024-11-27 03:31:10
20048	346676626	1	3540345	malians	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20049	346676626	1	12206179	khmer	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20050	346676626	1	2682747	magyars	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20051	346676626	1	421538	vietnamese	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20052	346676626	2	652559	britons	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20053	346676626	2	5138019	italians	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20054	346676626	2	4367953	celts	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20055	346676626	2	4516139	bohemians	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20056	346638508	1	2886619	hindustanis	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20057	346638508	1	11715344	italians	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20058	346638508	1	4226314	bulgarians	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20059	346638508	1	2682747	cumans	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20060	346638508	2	4367953	saracens	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20061	346638508	2	16840678	mongols	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20062	346638508	2	2696529	mayans	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20063	346638508	2	652559	tatars	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20064	211522122	1	652559	cumans	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20065	211522122	1	2682747	britons	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20066	211522122	1	4367953	malians	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20067	211522122	1	12128668	byzantines	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20068	211522122	2	3540345	bulgarians	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20069	211522122	2	912155	franks	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20070	211522122	2	5556319	ethiopians	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20071	211522122	2	4190574	dravidians	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20072	211509737	1	2682747	portuguese	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20073	211509737	1	4367953	magyars	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20074	211509737	1	3540345	malay	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20075	211509737	2	9414798	turks	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20076	211509737	2	652559	chinese	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20077	211509737	2	5556319	slavs	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20078	211497606	1	4367953	franks	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20079	211497606	1	9414798	mongols	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20080	211497606	1	5060982	vietnamese	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20081	211497606	1	9454038	gurjaras	t	2024-11-27 03:31:12	2024-11-27 03:31:12
20082	211497606	2	652559	britons	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20083	211497606	2	2682747	spanish	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20084	211497606	2	5556319	poles	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20085	211497606	2	3540345	turks	f	2024-11-27 03:31:12	2024-11-27 03:31:12
20086	258250833	1	218945	spanish	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20087	258250833	1	781607	persians	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20088	258250833	1	2886619	ethiopians	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20089	258250833	2	5040262	vikings	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20090	258250833	2	5060982	berbers	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20091	258250833	2	2793927	byzantines	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20092	256418936	1	11715344	incas	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20093	256418936	1	4516139	turks	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20094	256418936	1	2886619	khmer	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20095	256418936	1	9417745	tatars	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20096	256418936	2	218945	bulgarians	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20097	256418936	2	5040262	goths	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20098	256418936	2	6269989	japanese	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20099	256418936	2	2749860	lithuanians	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20100	256412490	1	218945	celts	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20101	256412490	1	5040262	byzantines	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20102	256412490	1	4516139	turks	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20103	256412490	2	2886619	vietnamese	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20104	256412490	2	11715344	portuguese	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20105	256412490	2	6269989	goths	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20106	256026856	1	9417745	malians	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20107	256026856	1	5040262	goths	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20108	256026856	1	2696529	franks	t	2024-11-27 03:31:14	2024-11-27 03:31:14
20109	256026856	2	4516139	aztecs	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20110	256026856	2	218945	japanese	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20111	256026856	2	14474131	saracens	f	2024-11-27 03:31:14	2024-11-27 03:31:14
20112	291697207	1	218945	vietnamese	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20113	291697207	1	11303898	slavs	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20114	291697207	1	7333714	italians	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20115	291697207	1	11715344	celts	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20116	291697207	2	2682747	mayans	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20117	291697207	2	2886619	mongols	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20118	291697207	2	15657335	franks	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20119	291697207	2	12206179	huns	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20120	289031067	1	912155	armenians	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20121	289031067	1	3540345	huns	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20122	289031067	1	7333714	persians	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20123	289031067	2	2749860	poles	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20124	289031067	2	9454038	magyars	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20125	289031067	2	2886619	hindustanis	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20126	288981495	1	3975785	turks	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20127	288981495	1	652559	mayans	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20128	288981495	1	421538	byzantines	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20129	288981495	2	9454038	koreans	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20130	288981495	2	7333714	franks	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20131	288981495	2	14551949	poles	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20132	288832060	1	912155	bohemians	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20133	288832060	1	652559	vietnamese	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20134	288832060	1	2682747	celts	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20135	288832060	1	3540345	incas	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20136	288832060	2	4033185	mayans	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20137	288832060	2	7333714	portuguese	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20138	288832060	2	5138019	spanish	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20139	288832060	2	3216997	tatars	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20140	288158126	1	11955124	berbers	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20141	288158126	1	7333714	malians	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20142	288158126	1	421538	tatars	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20143	288158126	1	6119233	khmer	f	2024-11-27 03:31:23	2024-11-27 03:31:23
20144	288158126	2	2682747	magyars	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20145	288158126	2	3540345	spanish	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20146	288158126	2	11303898	sicilians	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20147	288158126	2	2776978	cumans	t	2024-11-27 03:31:23	2024-11-27 03:31:23
20148	341069169	1	2749860	bengalis	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20149	341069169	1	2886619	khmer	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20150	341069169	1	781607	huns	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20151	341069169	1	1268183	sicilians	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20152	341069169	2	11715344	berbers	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20153	341069169	2	12206179	franks	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20154	341069169	2	18959347	hindustanis	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20155	341069169	2	912155	slavs	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20156	336613784	1	3540345	berbers	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20157	336613784	1	4516139	magyars	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20158	336613784	1	2886619	japanese	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20159	336613784	1	5138019	malay	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20160	336613784	2	19749740	britons	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20161	336613784	2	1386590	franks	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20162	336613784	2	2749860	mongols	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20163	336613784	2	10011205	khmer	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20164	335167275	1	11715344	britons	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20165	335167275	1	6269989	mongols	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20166	335167275	2	2749860	huns	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20167	335167275	2	16840678	teutons	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20168	334492729	1	2749860	ethiopians	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20169	334492729	1	781607	portuguese	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20170	334492729	1	652559	mayans	f	2024-11-27 03:31:26	2024-11-27 03:31:26
20171	334492729	2	3319777	khmer	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20172	334492729	2	4516139	britons	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20173	334492729	2	11715344	romans	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20174	334492729	2	19749740	lithuanians	t	2024-11-27 03:31:26	2024-11-27 03:31:26
20175	299044345	1	4033185	tatars	f	2024-11-27 03:31:30	2024-11-27 03:31:30
20176	299044345	1	2886619	slavs	f	2024-11-27 03:31:30	2024-11-27 03:31:30
20177	299044345	1	18171781	hindustanis	f	2024-11-27 03:31:30	2024-11-27 03:31:30
20178	299044345	1	10011205	sicilians	f	2024-11-27 03:31:30	2024-11-27 03:31:30
20179	299044345	2	781607	spanish	t	2024-11-27 03:31:30	2024-11-27 03:31:30
20180	299044345	2	16840678	malay	t	2024-11-27 03:31:30	2024-11-27 03:31:30
20181	299044345	2	3975785	lithuanians	t	2024-11-27 03:31:30	2024-11-27 03:31:30
20182	299044345	2	18170626	burmese	t	2024-11-27 03:31:30	2024-11-27 03:31:30
20183	285155906	1	14474131	turks	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20184	285155906	1	6269989	vikings	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20185	285155906	1	3540345	portuguese	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20186	285155906	1	2682747	celts	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20187	285155906	2	3146059	goths	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20188	285155906	2	2886619	hindustanis	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20189	285155906	2	9417745	chinese	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20190	285155906	2	781607	saracens	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20191	283174010	1	11955124	ethiopians	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20192	283174010	1	2749860	teutons	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20193	283174010	1	2886619	malay	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20194	283174010	2	2682747	cumans	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20195	283174010	2	14474131	byzantines	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20196	283174010	2	3146059	tatars	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20197	283167221	1	4371847	portuguese	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20198	283167221	1	2886619	goths	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20199	283167221	2	14474131	japanese	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20200	283167221	2	2749860	saracens	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20201	281322489	1	1386590	hindustanis	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20202	281322489	1	11715344	slavs	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20203	281322489	1	3216997	dravidians	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20204	281322489	1	12206179	goths	f	2024-11-27 03:31:32	2024-11-27 03:31:32
20205	281322489	2	1633111	spanish	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20206	281322489	2	10011205	cumans	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20207	281322489	2	912155	turks	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20208	281322489	2	14474131	huns	t	2024-11-27 03:31:32	2024-11-27 03:31:32
20209	344134734	1	20192926	mayans	f	2024-11-27 03:31:38	2024-11-27 03:31:38
20210	344134734	1	1986085	hindustanis	f	2024-11-27 03:31:38	2024-11-27 03:31:38
20211	344134734	1	14135529	koreans	f	2024-11-27 03:31:38	2024-11-27 03:31:38
20212	344134734	2	19636187	gurjaras	t	2024-11-27 03:31:38	2024-11-27 03:31:38
20213	344134734	2	912155	tatars	t	2024-11-27 03:31:38	2024-11-27 03:31:38
20214	344134734	2	4033185	incas	t	2024-11-27 03:31:38	2024-11-27 03:31:38
20215	354775333	1	5138019	tatars	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20216	354775333	1	2886619	spanish	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20217	354775333	1	12206179	turks	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20218	354775333	1	21227366	goths	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20219	354775333	2	3540345	portuguese	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20220	354775333	2	21059248	sicilians	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20221	354775333	2	2682747	mayans	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20222	354775333	2	2758897	hindustanis	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20223	354769910	1	21059248	huns	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20224	354769910	1	2682747	italians	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20225	354769910	1	21227366	slavs	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20226	354769910	1	12206179	spanish	f	2024-11-27 14:52:02	2024-11-27 14:52:02
20227	354769910	2	2886619	japanese	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20228	354769910	2	5138019	hindustanis	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20229	354769910	2	4226314	portuguese	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20230	354769910	2	2758897	gurjaras	t	2024-11-27 14:52:02	2024-11-27 14:52:02
20231	354725407	1	4516139	byzantines	t	2024-11-27 14:52:23	2024-11-27 14:52:23
20232	354725407	1	2682747	franks	t	2024-11-27 14:52:23	2024-11-27 14:52:23
20233	354725407	1	20192926	vietnamese	t	2024-11-27 14:52:23	2024-11-27 14:52:23
20234	354725407	1	9454038	mongols	t	2024-11-27 14:52:23	2024-11-27 14:52:23
20235	354725407	2	2758897	bengalis	f	2024-11-27 14:52:23	2024-11-27 14:52:23
20236	354725407	2	3216997	chinese	f	2024-11-27 14:52:23	2024-11-27 14:52:23
20237	354725407	2	2481683	saracens	f	2024-11-27 14:52:23	2024-11-27 14:52:23
20238	354725407	2	2991308	italians	f	2024-11-27 14:52:23	2024-11-27 14:52:23
20239	354744917	1	9417745	gurjaras	f	2024-11-27 14:52:40	2024-11-27 14:52:40
20240	354744917	1	2886619	mongols	f	2024-11-27 14:52:40	2024-11-27 14:52:40
20241	354744917	1	2793927	malians	f	2024-11-27 14:52:40	2024-11-27 14:52:40
20242	354744917	1	6830736	incas	f	2024-11-27 14:52:40	2024-11-27 14:52:40
20243	354744917	2	2758897	georgians	t	2024-11-27 14:52:40	2024-11-27 14:52:40
20244	354744917	2	2682747	britons	t	2024-11-27 14:52:40	2024-11-27 14:52:40
20245	354744917	2	5556319	huns	t	2024-11-27 14:52:40	2024-11-27 14:52:40
20246	354744917	2	4226314	malay	t	2024-11-27 14:52:40	2024-11-27 14:52:40
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2019_12_14_000001_create_personal_access_tokens_table	1
2	2023_02_03_002603_create_players_table	1
3	2024_02_24_232513_add_status_column	1
4	2024_02_24_233912_add_meta_data_player	1
5	2024_02_25_000422_change_avatar_length	1
6	2024_05_09_001221_create_users_table	2
7	2024_05_12_105526_fix_auto_increment_on_player	3
8	2024_05_18_075146_add_role_to_users	4
9	2024_05_18_081106_add_streak	4
10	2024_05_19_080447_create_activity_logs_table	4
12	2024_05_31_040656_add_last_win_and_lose_count	5
16	2024_06_07_113311_create_game_matches_table	6
17	2024_06_07_115244_create_match_teams_table	6
18	2024_10_30_051458_add_crown_image_to_players	7
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, name, aoe2net_id, elo, created_at, updated_at, status, avatar_url, alias, elo_unranked, elo_1v1, elo_team, meta_data, drops, streak, last_win_count, last_lose_count, final_elo, crown) FROM stdin;
101	Spock23	16840678	55	\N	2024-11-27 14:51:58	1	https://avatars.steamstatic.com/cc24ab91ca7f56e66b14145d6fac7ad6a792d25d_full.jpg	spock23 (CUPU)	1260	1126	1257	{"mpStatList":{"totalMatches":202,"totalWins":95,"currentWinStreak":0},"careerStats":{"totalGames":1611,"totalWins":790,"civilizations":[{"id":3,"name":"Britons","winCount":7,"defeatCount":46},{"id":4,"name":"Franks","winCount":90,"defeatCount":65},{"id":5,"name":"Goths","winCount":8,"defeatCount":30},{"id":6,"name":"Teutons","winCount":26,"defeatCount":39},{"id":7,"name":"Japanese","winCount":2,"defeatCount":45},{"id":8,"name":"Chinese","winCount":8,"defeatCount":28},{"id":9,"name":"Byzantines","winCount":157,"defeatCount":41},{"id":10,"name":"Persians","winCount":10,"defeatCount":46},{"id":11,"name":"Saracens","winCount":7,"defeatCount":35},{"id":12,"name":"Turks","winCount":51,"defeatCount":41},{"id":13,"name":"Vikings","winCount":6,"defeatCount":32},{"id":14,"name":"Mongols","winCount":2,"defeatCount":59},{"id":15,"name":"Celts","winCount":19,"defeatCount":34},{"id":16,"name":"Spanish","winCount":130,"defeatCount":52},{"id":17,"name":"Aztecs","winCount":8,"defeatCount":26},{"id":18,"name":"Mayans","winCount":5,"defeatCount":20},{"id":19,"name":"Huns","winCount":11,"defeatCount":39},{"id":20,"name":"Koreans","winCount":8,"defeatCount":34},{"id":21,"name":"Italians","winCount":6,"defeatCount":39},{"id":22,"name":"Hindustanis","winCount":2,"defeatCount":37},{"id":23,"name":"Incas","winCount":7,"defeatCount":17},{"id":24,"name":"Magyar","winCount":5,"defeatCount":45},{"id":25,"name":"Slavs","winCount":5,"defeatCount":22},{"id":26,"name":"Portuguese","winCount":5,"defeatCount":32},{"id":27,"name":"Ethiopians","winCount":23,"defeatCount":38},{"id":28,"name":"Malians","winCount":2,"defeatCount":23},{"id":29,"name":"Berbers","winCount":3,"defeatCount":20},{"id":30,"name":"Khmer","winCount":8,"defeatCount":37},{"id":31,"name":"Malay","winCount":16,"defeatCount":24},{"id":32,"name":"Burmese","winCount":3,"defeatCount":21},{"id":33,"name":"Vietnamese","winCount":21,"defeatCount":28},{"id":34,"name":"Bulgarians","winCount":8,"defeatCount":19},{"id":35,"name":"Tatars","winCount":5,"defeatCount":32},{"id":36,"name":"Cumans","winCount":10,"defeatCount":36},{"id":37,"name":"Lithuanians","winCount":31,"defeatCount":29},{"id":38,"name":"Random","winCount":136,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":77,"defeatCount":30},{"id":175,"name":"Sicilians","winCount":10,"defeatCount":29},{"id":184,"name":"Poles","winCount":5,"defeatCount":27},{"id":185,"name":"Bohemians","winCount":10,"defeatCount":27},{"id":195,"name":"Bengalis","winCount":3,"defeatCount":11},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":14},{"id":197,"name":"Gurjaras","winCount":4,"defeatCount":17},{"id":202,"name":"Romans","winCount":0,"defeatCount":18},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":61328,"highScoreMilitary":35785,"highScoreEconomy":18291,"highScoreTechnology":7136,"unitsKilled":170605,"unitsLost":203070,"buildingsRaised":23313,"buildingsLost":20602,"wondersBuilt":0,"castlesBuilt":3544,"trebsBuilt":3209,"farmsBuilt":51839},"user":{"userId":"","profileId":16840678,"userName":"spock23 (CUPU)","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/cc24ab91ca7f56e66b14145d6fac7ad6a792d25d_full.jpg","elo":1036,"playerStanding":0.48,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	14	-1	7	10	53.5	\N
37	Diks	\N	60	2023-02-24 07:28:20	2023-02-24 07:28:22	1			1000	0	0	\N	0	0	0	0	0	\N
42	Energic Owl	\N	65	2023-02-24 07:35:50	2023-02-24 07:35:52	1			1000	0	0	\N	0	0	0	0	0	\N
1057	Enf_fff	12206179	75	\N	2024-11-27 14:52:02	1	https://avatars.steamstatic.com/56b82661e23c38d97ba857914236f6231586a0c1_full.jpg	LowElo_Enf_ffff	1354	1424	1316	{"mpStatList":{"totalMatches":1381,"totalWins":726,"currentWinStreak":1},"careerStats":{"totalGames":3463,"totalWins":1783,"civilizations":[{"id":3,"name":"Britons","winCount":42,"defeatCount":212},{"id":4,"name":"Franks","winCount":38,"defeatCount":293},{"id":5,"name":"Goths","winCount":71,"defeatCount":188},{"id":6,"name":"Teutons","winCount":174,"defeatCount":202},{"id":7,"name":"Japanese","winCount":44,"defeatCount":130},{"id":8,"name":"Chinese","winCount":17,"defeatCount":126},{"id":9,"name":"Byzantines","winCount":93,"defeatCount":183},{"id":10,"name":"Persians","winCount":111,"defeatCount":179},{"id":11,"name":"Saracens","winCount":97,"defeatCount":131},{"id":12,"name":"Turks","winCount":40,"defeatCount":175},{"id":13,"name":"Vikings","winCount":23,"defeatCount":129},{"id":14,"name":"Mongols","winCount":137,"defeatCount":277},{"id":15,"name":"Celts","winCount":23,"defeatCount":132},{"id":16,"name":"Spanish","winCount":83,"defeatCount":221},{"id":17,"name":"Aztecs","winCount":13,"defeatCount":79},{"id":18,"name":"Mayans","winCount":27,"defeatCount":116},{"id":19,"name":"Huns","winCount":39,"defeatCount":185},{"id":20,"name":"Koreans","winCount":23,"defeatCount":108},{"id":21,"name":"Italians","winCount":98,"defeatCount":130},{"id":22,"name":"Hindustanis","winCount":25,"defeatCount":136},{"id":23,"name":"Incas","winCount":83,"defeatCount":94},{"id":24,"name":"Magyar","winCount":17,"defeatCount":159},{"id":25,"name":"Slavs","winCount":97,"defeatCount":141},{"id":26,"name":"Portuguese","winCount":32,"defeatCount":146},{"id":27,"name":"Ethiopians","winCount":23,"defeatCount":155},{"id":28,"name":"Malians","winCount":22,"defeatCount":110},{"id":29,"name":"Berbers","winCount":24,"defeatCount":130},{"id":30,"name":"Khmer","winCount":24,"defeatCount":176},{"id":31,"name":"Malay","winCount":29,"defeatCount":102},{"id":32,"name":"Burmese","winCount":8,"defeatCount":76},{"id":33,"name":"Vietnamese","winCount":90,"defeatCount":138},{"id":34,"name":"Bulgarians","winCount":15,"defeatCount":115},{"id":35,"name":"Tatars","winCount":17,"defeatCount":114},{"id":36,"name":"Cumans","winCount":118,"defeatCount":130},{"id":37,"name":"Lithuanians","winCount":38,"defeatCount":161},{"id":38,"name":"Random","winCount":602,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":27,"defeatCount":94},{"id":175,"name":"Sicilians","winCount":41,"defeatCount":79},{"id":184,"name":"Poles","winCount":32,"defeatCount":103},{"id":185,"name":"Bohemians","winCount":36,"defeatCount":126},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":58},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":77},{"id":197,"name":"Gurjaras","winCount":2,"defeatCount":91},{"id":202,"name":"Romans","winCount":0,"defeatCount":41},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64116,"highScoreMilitary":62878,"highScoreEconomy":24087,"highScoreTechnology":9190,"unitsKilled":859236,"unitsLost":695657,"buildingsRaised":86800,"buildingsLost":61781,"wondersBuilt":2,"castlesBuilt":10240,"trebsBuilt":5732,"farmsBuilt":203857},"user":{"userId":"","profileId":12206179,"userName":"LowElo_Enf_ffff","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/56b82661e23c38d97ba857914236f6231586a0c1_full.jpg","elo":1143,"playerStanding":0.32,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	66	1	8	9	74.5	\N
1052	ozant 	15347672	75	\N	2024-11-27 14:57:33	1	https://avatars.steamstatic.com/8076191ad0c46c933ffd63bba02cd1d9897ce6fe_full.jpg	BabaBuGim	1307	1020	1079	{"mpStatList":{"totalMatches":164,"totalWins":76,"currentWinStreak":0},"careerStats":{"totalGames":1117,"totalWins":517,"civilizations":[{"id":3,"name":"Britons","winCount":4,"defeatCount":77},{"id":4,"name":"Franks","winCount":6,"defeatCount":74},{"id":5,"name":"Goths","winCount":16,"defeatCount":60},{"id":6,"name":"Teutons","winCount":34,"defeatCount":62},{"id":7,"name":"Japanese","winCount":20,"defeatCount":36},{"id":8,"name":"Chinese","winCount":2,"defeatCount":28},{"id":9,"name":"Byzantines","winCount":19,"defeatCount":48},{"id":10,"name":"Persians","winCount":11,"defeatCount":83},{"id":11,"name":"Saracens","winCount":13,"defeatCount":38},{"id":12,"name":"Turks","winCount":43,"defeatCount":64},{"id":13,"name":"Vikings","winCount":6,"defeatCount":27},{"id":14,"name":"Mongols","winCount":12,"defeatCount":76},{"id":15,"name":"Celts","winCount":40,"defeatCount":42},{"id":16,"name":"Spanish","winCount":23,"defeatCount":77},{"id":17,"name":"Aztecs","winCount":6,"defeatCount":14},{"id":18,"name":"Mayans","winCount":3,"defeatCount":32},{"id":19,"name":"Huns","winCount":8,"defeatCount":58},{"id":20,"name":"Koreans","winCount":11,"defeatCount":29},{"id":21,"name":"Italians","winCount":15,"defeatCount":29},{"id":22,"name":"Hindustanis","winCount":4,"defeatCount":37},{"id":23,"name":"Incas","winCount":2,"defeatCount":28},{"id":24,"name":"Magyar","winCount":2,"defeatCount":27},{"id":25,"name":"Slavs","winCount":16,"defeatCount":40},{"id":26,"name":"Portuguese","winCount":6,"defeatCount":57},{"id":27,"name":"Ethiopians","winCount":4,"defeatCount":35},{"id":28,"name":"Malians","winCount":4,"defeatCount":31},{"id":29,"name":"Berbers","winCount":5,"defeatCount":29},{"id":30,"name":"Khmer","winCount":24,"defeatCount":70},{"id":31,"name":"Malay","winCount":7,"defeatCount":25},{"id":32,"name":"Burmese","winCount":7,"defeatCount":19},{"id":33,"name":"Vietnamese","winCount":5,"defeatCount":38},{"id":34,"name":"Bulgarians","winCount":11,"defeatCount":23},{"id":35,"name":"Tatars","winCount":3,"defeatCount":13},{"id":36,"name":"Cumans","winCount":8,"defeatCount":30},{"id":37,"name":"Lithuanians","winCount":11,"defeatCount":38},{"id":38,"name":"Random","winCount":119,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":10,"defeatCount":33},{"id":175,"name":"Sicilians","winCount":107,"defeatCount":15},{"id":184,"name":"Poles","winCount":9,"defeatCount":34},{"id":185,"name":"Bohemians","winCount":9,"defeatCount":55},{"id":195,"name":"Bengalis","winCount":4,"defeatCount":6},{"id":196,"name":"Dravidians","winCount":2,"defeatCount":12},{"id":197,"name":"Gurjaras","winCount":5,"defeatCount":21},{"id":202,"name":"Romans","winCount":42,"defeatCount":32},{"id":204,"name":"Pompeii_Assyrian","winCount":17,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":2,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":9,"defeatCount":4},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":1},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":1},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":52791,"highScoreMilitary":41621,"highScoreEconomy":24145,"highScoreTechnology":7076,"unitsKilled":137682,"unitsLost":153985,"buildingsRaised":15896,"buildingsLost":18197,"wondersBuilt":0,"castlesBuilt":1964,"trebsBuilt":1115,"farmsBuilt":32730},"user":{"userId":"","profileId":15347672,"userName":"BabaBuGim","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/8076191ad0c46c933ffd63bba02cd1d9897ce6fe_full.jpg","elo":1029,"playerStanding":0.49,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	12	-1	8	9	74.5	\N
3	Kuurenay	1633111	100	2023-02-10 01:33:33	2024-11-27 14:51:53	1	https://avatars.steamstatic.com/e11c433fff4ea10e3c70ee10d8fd0f453c40c9eb_full.jpg	[xbow] Kuurenay	1540	0	1464	{"mpStatList":{"totalMatches":221,"totalWins":134,"currentWinStreak":1},"careerStats":{"totalGames":1018,"totalWins":574,"civilizations":[{"id":3,"name":"Britons","winCount":17,"defeatCount":81},{"id":4,"name":"Franks","winCount":28,"defeatCount":113},{"id":5,"name":"Goths","winCount":4,"defeatCount":57},{"id":6,"name":"Teutons","winCount":12,"defeatCount":53},{"id":7,"name":"Japanese","winCount":12,"defeatCount":43},{"id":8,"name":"Chinese","winCount":10,"defeatCount":42},{"id":9,"name":"Byzantines","winCount":5,"defeatCount":52},{"id":10,"name":"Persians","winCount":21,"defeatCount":77},{"id":11,"name":"Saracens","winCount":17,"defeatCount":72},{"id":12,"name":"Turks","winCount":17,"defeatCount":52},{"id":13,"name":"Vikings","winCount":21,"defeatCount":71},{"id":14,"name":"Mongols","winCount":19,"defeatCount":84},{"id":15,"name":"Celts","winCount":8,"defeatCount":55},{"id":16,"name":"Spanish","winCount":21,"defeatCount":64},{"id":17,"name":"Aztecs","winCount":19,"defeatCount":51},{"id":18,"name":"Mayans","winCount":27,"defeatCount":76},{"id":19,"name":"Huns","winCount":10,"defeatCount":59},{"id":20,"name":"Koreans","winCount":15,"defeatCount":46},{"id":21,"name":"Italians","winCount":14,"defeatCount":47},{"id":22,"name":"Hindustanis","winCount":19,"defeatCount":45},{"id":23,"name":"Incas","winCount":18,"defeatCount":44},{"id":24,"name":"Magyar","winCount":48,"defeatCount":61},{"id":25,"name":"Slavs","winCount":14,"defeatCount":33},{"id":26,"name":"Portuguese","winCount":7,"defeatCount":42},{"id":27,"name":"Ethiopians","winCount":29,"defeatCount":60},{"id":28,"name":"Malians","winCount":16,"defeatCount":55},{"id":29,"name":"Berbers","winCount":6,"defeatCount":47},{"id":30,"name":"Khmer","winCount":29,"defeatCount":47},{"id":31,"name":"Malay","winCount":30,"defeatCount":50},{"id":32,"name":"Burmese","winCount":13,"defeatCount":30},{"id":33,"name":"Vietnamese","winCount":24,"defeatCount":46},{"id":34,"name":"Bulgarians","winCount":12,"defeatCount":48},{"id":35,"name":"Tatars","winCount":29,"defeatCount":38},{"id":36,"name":"Cumans","winCount":55,"defeatCount":60},{"id":37,"name":"Lithuanians","winCount":28,"defeatCount":61},{"id":38,"name":"Random","winCount":344,"defeatCount":305},{"id":174,"name":"Burgundians","winCount":9,"defeatCount":34},{"id":175,"name":"Sicilians","winCount":3,"defeatCount":34},{"id":184,"name":"Poles","winCount":9,"defeatCount":33},{"id":185,"name":"Bohemians","winCount":7,"defeatCount":48},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":27},{"id":196,"name":"Dravidians","winCount":15,"defeatCount":24},{"id":197,"name":"Gurjaras","winCount":3,"defeatCount":19},{"id":202,"name":"Romans","winCount":0,"defeatCount":13},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":43443,"highScoreMilitary":30054,"highScoreEconomy":12580,"highScoreTechnology":6401,"unitsKilled":238105,"unitsLost":162281,"buildingsRaised":23473,"buildingsLost":11194,"wondersBuilt":0,"castlesBuilt":3064,"trebsBuilt":2216,"farmsBuilt":88510},"user":{"userId":"","profileId":1633111,"userName":"[xbow] Kuurenay","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/e11c433fff4ea10e3c70ee10d8fd0f453c40c9eb_full.jpg","elo":1450,"playerStanding":0.06,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	19	-1	11	6	102.5	\N
7	Apple Cupu	2682747	90	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/848fc3264dbb34230cc4b740a07cc44f2b076653_full.jpg	Apple Cupu	1321	0	1275	{"mpStatList":{"totalMatches":764,"totalWins":369,"currentWinStreak":1},"careerStats":{"totalGames":4525,"totalWins":2208,"civilizations":[{"id":3,"name":"Britons","winCount":41,"defeatCount":267},{"id":4,"name":"Franks","winCount":110,"defeatCount":267},{"id":5,"name":"Goths","winCount":48,"defeatCount":229},{"id":6,"name":"Teutons","winCount":47,"defeatCount":212},{"id":7,"name":"Japanese","winCount":58,"defeatCount":221},{"id":8,"name":"Chinese","winCount":38,"defeatCount":204},{"id":9,"name":"Byzantines","winCount":54,"defeatCount":178},{"id":10,"name":"Persians","winCount":82,"defeatCount":260},{"id":11,"name":"Saracens","winCount":33,"defeatCount":225},{"id":12,"name":"Turks","winCount":41,"defeatCount":200},{"id":13,"name":"Vikings","winCount":78,"defeatCount":215},{"id":14,"name":"Mongols","winCount":47,"defeatCount":273},{"id":15,"name":"Celts","winCount":61,"defeatCount":211},{"id":16,"name":"Spanish","winCount":48,"defeatCount":234},{"id":17,"name":"Aztecs","winCount":40,"defeatCount":208},{"id":18,"name":"Mayans","winCount":61,"defeatCount":237},{"id":19,"name":"Huns","winCount":39,"defeatCount":200},{"id":20,"name":"Koreans","winCount":65,"defeatCount":219},{"id":21,"name":"Italians","winCount":43,"defeatCount":222},{"id":22,"name":"Hindustanis","winCount":50,"defeatCount":194},{"id":23,"name":"Incas","winCount":45,"defeatCount":194},{"id":24,"name":"Magyar","winCount":45,"defeatCount":205},{"id":25,"name":"Slavs","winCount":44,"defeatCount":188},{"id":26,"name":"Portuguese","winCount":52,"defeatCount":245},{"id":27,"name":"Ethiopians","winCount":63,"defeatCount":234},{"id":28,"name":"Malians","winCount":46,"defeatCount":208},{"id":29,"name":"Berbers","winCount":50,"defeatCount":200},{"id":30,"name":"Khmer","winCount":34,"defeatCount":218},{"id":31,"name":"Malay","winCount":37,"defeatCount":221},{"id":32,"name":"Burmese","winCount":35,"defeatCount":214},{"id":33,"name":"Vietnamese","winCount":49,"defeatCount":210},{"id":34,"name":"Bulgarians","winCount":34,"defeatCount":191},{"id":35,"name":"Tatars","winCount":47,"defeatCount":214},{"id":36,"name":"Cumans","winCount":53,"defeatCount":209},{"id":37,"name":"Lithuanians","winCount":113,"defeatCount":203},{"id":38,"name":"Random","winCount":1790,"defeatCount":1195},{"id":174,"name":"Burgundians","winCount":48,"defeatCount":146},{"id":175,"name":"Sicilians","winCount":35,"defeatCount":150},{"id":184,"name":"Poles","winCount":36,"defeatCount":139},{"id":185,"name":"Bohemians","winCount":51,"defeatCount":154},{"id":195,"name":"Bengalis","winCount":23,"defeatCount":89},{"id":196,"name":"Dravidians","winCount":32,"defeatCount":110},{"id":197,"name":"Gurjaras","winCount":53,"defeatCount":99},{"id":202,"name":"Romans","winCount":21,"defeatCount":27},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":60500,"highScoreMilitary":49246,"highScoreEconomy":16946,"highScoreTechnology":6579,"unitsKilled":1060424,"unitsLost":913324,"buildingsRaised":135677,"buildingsLost":99315,"wondersBuilt":0,"castlesBuilt":14148,"trebsBuilt":9629,"farmsBuilt":301181},"user":{"userId":"","profileId":2682747,"userName":"Apple Cupu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/848fc3264dbb34230cc4b740a07cc44f2b076653_full.jpg","elo":1271,"playerStanding":0.17,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	119	-2	9	8	90.5	\N
54	ApexNoa	218945	55	2023-02-24 07:40:49	2024-11-27 14:52:12	1	https://avatars.steamstatic.com/7b5c0cfb1423cddd3f874cbf302146358607d39d_full.jpg	ApexNoa テラー	1285	0	979	{"mpStatList":{"totalMatches":77,"totalWins":36,"currentWinStreak":0},"careerStats":{"totalGames":968,"totalWins":399,"civilizations":[{"id":3,"name":"Britons","winCount":14,"defeatCount":77},{"id":4,"name":"Franks","winCount":16,"defeatCount":70},{"id":5,"name":"Goths","winCount":23,"defeatCount":55},{"id":6,"name":"Teutons","winCount":13,"defeatCount":65},{"id":7,"name":"Japanese","winCount":14,"defeatCount":36},{"id":8,"name":"Chinese","winCount":9,"defeatCount":57},{"id":9,"name":"Byzantines","winCount":28,"defeatCount":90},{"id":10,"name":"Persians","winCount":14,"defeatCount":49},{"id":11,"name":"Saracens","winCount":15,"defeatCount":47},{"id":12,"name":"Turks","winCount":5,"defeatCount":49},{"id":13,"name":"Vikings","winCount":13,"defeatCount":36},{"id":14,"name":"Mongols","winCount":17,"defeatCount":89},{"id":15,"name":"Celts","winCount":19,"defeatCount":38},{"id":16,"name":"Spanish","winCount":15,"defeatCount":58},{"id":17,"name":"Aztecs","winCount":11,"defeatCount":48},{"id":18,"name":"Mayans","winCount":8,"defeatCount":45},{"id":19,"name":"Huns","winCount":28,"defeatCount":56},{"id":20,"name":"Koreans","winCount":11,"defeatCount":41},{"id":21,"name":"Italians","winCount":8,"defeatCount":42},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":32},{"id":23,"name":"Incas","winCount":13,"defeatCount":44},{"id":24,"name":"Magyar","winCount":12,"defeatCount":42},{"id":25,"name":"Slavs","winCount":18,"defeatCount":54},{"id":26,"name":"Portuguese","winCount":9,"defeatCount":31},{"id":27,"name":"Ethiopians","winCount":12,"defeatCount":44},{"id":28,"name":"Malians","winCount":8,"defeatCount":43},{"id":29,"name":"Berbers","winCount":9,"defeatCount":36},{"id":30,"name":"Khmer","winCount":12,"defeatCount":40},{"id":31,"name":"Malay","winCount":8,"defeatCount":44},{"id":32,"name":"Burmese","winCount":9,"defeatCount":39},{"id":33,"name":"Vietnamese","winCount":16,"defeatCount":46},{"id":34,"name":"Bulgarians","winCount":18,"defeatCount":43},{"id":35,"name":"Tatars","winCount":19,"defeatCount":65},{"id":36,"name":"Cumans","winCount":12,"defeatCount":52},{"id":37,"name":"Lithuanians","winCount":14,"defeatCount":54},{"id":38,"name":"Random","winCount":307,"defeatCount":189},{"id":174,"name":"Burgundians","winCount":21,"defeatCount":23},{"id":175,"name":"Sicilians","winCount":24,"defeatCount":18},{"id":184,"name":"Poles","winCount":18,"defeatCount":16},{"id":185,"name":"Bohemians","winCount":19,"defeatCount":29},{"id":195,"name":"Bengalis","winCount":6,"defeatCount":21},{"id":196,"name":"Dravidians","winCount":10,"defeatCount":27},{"id":197,"name":"Gurjaras","winCount":5,"defeatCount":20},{"id":202,"name":"Romans","winCount":22,"defeatCount":14},{"id":204,"name":"Pompeii_Assyrian","winCount":13,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":2,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":2,"defeatCount":1},{"id":216,"name":"Pompeii_Hittite","winCount":2,"defeatCount":4},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":2},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":1},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":46324,"highScoreMilitary":27342,"highScoreEconomy":31188,"highScoreTechnology":12444,"unitsKilled":136534,"unitsLost":126829,"buildingsRaised":16818,"buildingsLost":13301,"wondersBuilt":11,"castlesBuilt":2123,"trebsBuilt":1547,"farmsBuilt":57845},"user":{"userId":"","profileId":218945,"userName":"ApexNoa \\u30c6\\u30e9\\u30fc","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/7b5c0cfb1423cddd3f874cbf302146358607d39d_full.jpg","elo":1061,"playerStanding":0.44,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	29	2	6	11	52.5	\N
57	fundaybox	10011205	55	2023-02-10 01:33:33	2024-11-27 14:52:06	1	https://avatars.steamstatic.com/872950849e231e25e78c580da50d385b9e998f16_full.jpg	boxenangsenang	1210	0	1104	{"mpStatList":{"totalMatches":35,"totalWins":18,"currentWinStreak":0},"careerStats":{"totalGames":2235,"totalWins":896,"civilizations":[{"id":3,"name":"Britons","winCount":25,"defeatCount":109},{"id":4,"name":"Franks","winCount":37,"defeatCount":126},{"id":5,"name":"Goths","winCount":36,"defeatCount":102},{"id":6,"name":"Teutons","winCount":32,"defeatCount":92},{"id":7,"name":"Japanese","winCount":20,"defeatCount":101},{"id":8,"name":"Chinese","winCount":27,"defeatCount":81},{"id":9,"name":"Byzantines","winCount":28,"defeatCount":94},{"id":10,"name":"Persians","winCount":30,"defeatCount":92},{"id":11,"name":"Saracens","winCount":19,"defeatCount":70},{"id":12,"name":"Turks","winCount":26,"defeatCount":97},{"id":13,"name":"Vikings","winCount":25,"defeatCount":78},{"id":14,"name":"Mongols","winCount":19,"defeatCount":143},{"id":15,"name":"Celts","winCount":15,"defeatCount":80},{"id":16,"name":"Spanish","winCount":25,"defeatCount":134},{"id":17,"name":"Aztecs","winCount":27,"defeatCount":84},{"id":18,"name":"Mayans","winCount":24,"defeatCount":79},{"id":19,"name":"Huns","winCount":22,"defeatCount":140},{"id":20,"name":"Koreans","winCount":28,"defeatCount":84},{"id":21,"name":"Italians","winCount":35,"defeatCount":78},{"id":22,"name":"Hindustanis","winCount":29,"defeatCount":90},{"id":23,"name":"Incas","winCount":20,"defeatCount":67},{"id":24,"name":"Magyar","winCount":32,"defeatCount":105},{"id":25,"name":"Slavs","winCount":25,"defeatCount":79},{"id":26,"name":"Portuguese","winCount":29,"defeatCount":81},{"id":27,"name":"Ethiopians","winCount":21,"defeatCount":101},{"id":28,"name":"Malians","winCount":21,"defeatCount":70},{"id":29,"name":"Berbers","winCount":24,"defeatCount":70},{"id":30,"name":"Khmer","winCount":27,"defeatCount":103},{"id":31,"name":"Malay","winCount":21,"defeatCount":74},{"id":32,"name":"Burmese","winCount":18,"defeatCount":67},{"id":33,"name":"Vietnamese","winCount":29,"defeatCount":79},{"id":34,"name":"Bulgarians","winCount":24,"defeatCount":82},{"id":35,"name":"Tatars","winCount":16,"defeatCount":77},{"id":36,"name":"Cumans","winCount":23,"defeatCount":89},{"id":37,"name":"Lithuanians","winCount":42,"defeatCount":77},{"id":38,"name":"Random","winCount":891,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":22,"defeatCount":67},{"id":175,"name":"Sicilians","winCount":12,"defeatCount":44},{"id":184,"name":"Poles","winCount":21,"defeatCount":55},{"id":185,"name":"Bohemians","winCount":15,"defeatCount":62},{"id":195,"name":"Bengalis","winCount":14,"defeatCount":47},{"id":196,"name":"Dravidians","winCount":20,"defeatCount":51},{"id":197,"name":"Gurjaras","winCount":15,"defeatCount":46},{"id":202,"name":"Romans","winCount":0,"defeatCount":24},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":44769,"highScoreMilitary":29845,"highScoreEconomy":14342,"highScoreTechnology":6682,"unitsKilled":234210,"unitsLost":203978,"buildingsRaised":20696,"buildingsLost":32326,"wondersBuilt":0,"castlesBuilt":4672,"trebsBuilt":3417,"farmsBuilt":100443},"user":{"userId":"","profileId":10011205,"userName":"boxenangsenang","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/872950849e231e25e78c580da50d385b9e998f16_full.jpg","elo":1091,"playerStanding":0.39,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	70	-2	6	11	52.5	\N
1061	stmboat	15133012	60	\N	2024-11-27 14:58:13	1	https://avatars.steamstatic.com/3be8541d9639e41c21f9fbcac08961af1d487eda_full.jpg	[Vesper]-Stmboat-	1236	0	1110	{"mpStatList":{"totalMatches":771,"totalWins":412,"currentWinStreak":1},"careerStats":{"totalGames":1415,"totalWins":751,"civilizations":[{"id":3,"name":"Britons","winCount":45,"defeatCount":167},{"id":4,"name":"Franks","winCount":160,"defeatCount":193},{"id":5,"name":"Goths","winCount":24,"defeatCount":131},{"id":6,"name":"Teutons","winCount":17,"defeatCount":133},{"id":7,"name":"Japanese","winCount":7,"defeatCount":80},{"id":8,"name":"Chinese","winCount":9,"defeatCount":89},{"id":9,"name":"Byzantines","winCount":19,"defeatCount":94},{"id":10,"name":"Persians","winCount":122,"defeatCount":169},{"id":11,"name":"Saracens","winCount":21,"defeatCount":78},{"id":12,"name":"Turks","winCount":253,"defeatCount":125},{"id":13,"name":"Vikings","winCount":25,"defeatCount":69},{"id":14,"name":"Mongols","winCount":67,"defeatCount":144},{"id":15,"name":"Celts","winCount":24,"defeatCount":118},{"id":16,"name":"Spanish","winCount":53,"defeatCount":127},{"id":17,"name":"Aztecs","winCount":26,"defeatCount":67},{"id":18,"name":"Mayans","winCount":10,"defeatCount":84},{"id":19,"name":"Huns","winCount":24,"defeatCount":100},{"id":20,"name":"Koreans","winCount":24,"defeatCount":63},{"id":21,"name":"Italians","winCount":48,"defeatCount":94},{"id":22,"name":"Hindustanis","winCount":70,"defeatCount":92},{"id":23,"name":"Incas","winCount":18,"defeatCount":67},{"id":24,"name":"Magyar","winCount":16,"defeatCount":72},{"id":25,"name":"Slavs","winCount":73,"defeatCount":85},{"id":26,"name":"Portuguese","winCount":18,"defeatCount":118},{"id":27,"name":"Ethiopians","winCount":12,"defeatCount":86},{"id":28,"name":"Malians","winCount":18,"defeatCount":50},{"id":29,"name":"Berbers","winCount":16,"defeatCount":60},{"id":30,"name":"Khmer","winCount":47,"defeatCount":180},{"id":31,"name":"Malay","winCount":11,"defeatCount":67},{"id":32,"name":"Burmese","winCount":11,"defeatCount":52},{"id":33,"name":"Vietnamese","winCount":13,"defeatCount":83},{"id":34,"name":"Bulgarians","winCount":19,"defeatCount":64},{"id":35,"name":"Tatars","winCount":14,"defeatCount":52},{"id":36,"name":"Cumans","winCount":111,"defeatCount":77},{"id":37,"name":"Lithuanians","winCount":15,"defeatCount":80},{"id":38,"name":"Random","winCount":250,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":32,"defeatCount":78},{"id":175,"name":"Sicilians","winCount":8,"defeatCount":50},{"id":184,"name":"Poles","winCount":17,"defeatCount":79},{"id":185,"name":"Bohemians","winCount":12,"defeatCount":90},{"id":195,"name":"Bengalis","winCount":12,"defeatCount":37},{"id":196,"name":"Dravidians","winCount":9,"defeatCount":36},{"id":197,"name":"Gurjaras","winCount":5,"defeatCount":38},{"id":202,"name":"Romans","winCount":25,"defeatCount":73},{"id":204,"name":"Pompeii_Assyrian","winCount":2,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":65263,"highScoreMilitary":60871,"highScoreEconomy":30262,"highScoreTechnology":7810,"unitsKilled":636236,"unitsLost":323312,"buildingsRaised":96197,"buildingsLost":18492,"wondersBuilt":17,"castlesBuilt":7310,"trebsBuilt":5414,"farmsBuilt":119183},"user":{"userId":"","profileId":15133012,"userName":"[Vesper]-Stmboat-","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/3be8541d9639e41c21f9fbcac08961af1d487eda_full.jpg","elo":919,"playerStanding":0.68,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	6	1	0	0	60	\N
49	Darryndad	\N	50	2023-02-24 07:37:55	2023-02-24 07:37:57	1			1000	0	0	\N	0	0	0	0	0	\N
12448398	Ahmadzizi	17877078	60	\N	2024-11-27 14:52:20	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	[OmG] ahmadzizi	1271	0	0	{"mpStatList":{"totalMatches":1,"totalWins":0,"currentWinStreak":0},"careerStats":{"totalGames":33,"totalWins":14,"civilizations":[{"id":3,"name":"Britons","winCount":1,"defeatCount":4},{"id":4,"name":"Franks","winCount":0,"defeatCount":3},{"id":5,"name":"Goths","winCount":0,"defeatCount":0},{"id":6,"name":"Teutons","winCount":0,"defeatCount":3},{"id":7,"name":"Japanese","winCount":1,"defeatCount":1},{"id":8,"name":"Chinese","winCount":0,"defeatCount":1},{"id":9,"name":"Byzantines","winCount":0,"defeatCount":1},{"id":10,"name":"Persians","winCount":0,"defeatCount":3},{"id":11,"name":"Saracens","winCount":0,"defeatCount":0},{"id":12,"name":"Turks","winCount":0,"defeatCount":0},{"id":13,"name":"Vikings","winCount":1,"defeatCount":1},{"id":14,"name":"Mongols","winCount":0,"defeatCount":4},{"id":15,"name":"Celts","winCount":0,"defeatCount":1},{"id":16,"name":"Spanish","winCount":0,"defeatCount":2},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":1},{"id":18,"name":"Mayans","winCount":1,"defeatCount":0},{"id":19,"name":"Huns","winCount":1,"defeatCount":0},{"id":20,"name":"Koreans","winCount":1,"defeatCount":2},{"id":21,"name":"Italians","winCount":0,"defeatCount":2},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":0},{"id":23,"name":"Incas","winCount":0,"defeatCount":1},{"id":24,"name":"Magyar","winCount":0,"defeatCount":1},{"id":25,"name":"Slavs","winCount":0,"defeatCount":0},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":0},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":0},{"id":28,"name":"Malians","winCount":2,"defeatCount":1},{"id":29,"name":"Berbers","winCount":0,"defeatCount":2},{"id":30,"name":"Khmer","winCount":2,"defeatCount":1},{"id":31,"name":"Malay","winCount":1,"defeatCount":1},{"id":32,"name":"Burmese","winCount":0,"defeatCount":0},{"id":33,"name":"Vietnamese","winCount":2,"defeatCount":0},{"id":34,"name":"Bulgarians","winCount":1,"defeatCount":4},{"id":35,"name":"Tatars","winCount":0,"defeatCount":2},{"id":36,"name":"Cumans","winCount":0,"defeatCount":3},{"id":37,"name":"Lithuanians","winCount":1,"defeatCount":1},{"id":38,"name":"Random","winCount":15,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":1},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":1},{"id":184,"name":"Poles","winCount":0,"defeatCount":2},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":0},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":1},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":1},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":17684,"highScoreMilitary":11295,"highScoreEconomy":6522,"highScoreTechnology":4380,"unitsKilled":4130,"unitsLost":5267,"buildingsRaised":637,"buildingsLost":752,"wondersBuilt":0,"castlesBuilt":82,"trebsBuilt":101,"farmsBuilt":2225},"user":{"userId":"","profileId":17877078,"userName":"[OmG] ahmadzizi","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":960,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	1	-1	9	8	60.5	\N
14	Bentang	1268183	90	2023-02-24 07:22:08	2024-11-27 14:58:45	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	Horizon cupu	1343	1508	1473	{"mpStatList":{"totalMatches":289,"totalWins":156,"currentWinStreak":0},"careerStats":{"totalGames":1796,"totalWins":1065,"civilizations":[{"id":3,"name":"Britons","winCount":67,"defeatCount":183},{"id":4,"name":"Franks","winCount":22,"defeatCount":318},{"id":5,"name":"Goths","winCount":31,"defeatCount":187},{"id":6,"name":"Teutons","winCount":25,"defeatCount":204},{"id":7,"name":"Japanese","winCount":33,"defeatCount":121},{"id":8,"name":"Chinese","winCount":35,"defeatCount":107},{"id":9,"name":"Byzantines","winCount":46,"defeatCount":181},{"id":10,"name":"Persians","winCount":31,"defeatCount":135},{"id":11,"name":"Saracens","winCount":54,"defeatCount":128},{"id":12,"name":"Turks","winCount":50,"defeatCount":144},{"id":13,"name":"Vikings","winCount":25,"defeatCount":96},{"id":14,"name":"Mongols","winCount":63,"defeatCount":220},{"id":15,"name":"Celts","winCount":17,"defeatCount":111},{"id":16,"name":"Spanish","winCount":30,"defeatCount":124},{"id":17,"name":"Aztecs","winCount":16,"defeatCount":115},{"id":18,"name":"Mayans","winCount":20,"defeatCount":122},{"id":19,"name":"Huns","winCount":29,"defeatCount":128},{"id":20,"name":"Koreans","winCount":35,"defeatCount":65},{"id":21,"name":"Italians","winCount":60,"defeatCount":161},{"id":22,"name":"Hindustanis","winCount":35,"defeatCount":120},{"id":23,"name":"Incas","winCount":19,"defeatCount":91},{"id":24,"name":"Magyar","winCount":33,"defeatCount":118},{"id":25,"name":"Slavs","winCount":13,"defeatCount":140},{"id":26,"name":"Portuguese","winCount":106,"defeatCount":77},{"id":27,"name":"Ethiopians","winCount":33,"defeatCount":161},{"id":28,"name":"Malians","winCount":34,"defeatCount":94},{"id":29,"name":"Berbers","winCount":53,"defeatCount":97},{"id":30,"name":"Khmer","winCount":40,"defeatCount":124},{"id":31,"name":"Malay","winCount":142,"defeatCount":108},{"id":32,"name":"Burmese","winCount":26,"defeatCount":90},{"id":33,"name":"Vietnamese","winCount":62,"defeatCount":99},{"id":34,"name":"Bulgarians","winCount":24,"defeatCount":91},{"id":35,"name":"Tatars","winCount":28,"defeatCount":121},{"id":36,"name":"Cumans","winCount":24,"defeatCount":126},{"id":37,"name":"Lithuanians","winCount":17,"defeatCount":126},{"id":38,"name":"Random","winCount":253,"defeatCount":548},{"id":174,"name":"Burgundians","winCount":33,"defeatCount":61},{"id":175,"name":"Sicilians","winCount":16,"defeatCount":85},{"id":184,"name":"Poles","winCount":50,"defeatCount":38},{"id":185,"name":"Bohemians","winCount":35,"defeatCount":66},{"id":195,"name":"Bengalis","winCount":23,"defeatCount":21},{"id":196,"name":"Dravidians","winCount":41,"defeatCount":30},{"id":197,"name":"Gurjaras","winCount":47,"defeatCount":30},{"id":202,"name":"Romans","winCount":0,"defeatCount":14},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":80489,"highScoreMilitary":55454,"highScoreEconomy":40275,"highScoreTechnology":15743,"unitsKilled":630454,"unitsLost":386515,"buildingsRaised":76914,"buildingsLost":28496,"wondersBuilt":94,"castlesBuilt":4590,"trebsBuilt":4709,"farmsBuilt":163426},"user":{"userId":"","profileId":1268183,"userName":"Horizon cupu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1436,"playerStanding":0.06,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	62	1	7	10	88.5	\N
18170638	SeRpenZos	912155	75	2024-10-09 01:04:58	2024-11-27 14:52:30	1	https://avatars.steamstatic.com/3187353af889d338e5aa205e57dac66e10edb7d9_full.jpg	LowElo_SeRpenZos	1340	0	1514	{"mpStatList":{"totalMatches":183,"totalWins":87,"currentWinStreak":1},"careerStats":{"totalGames":3352,"totalWins":1705,"civilizations":[{"id":3,"name":"Britons","winCount":43,"defeatCount":230},{"id":4,"name":"Franks","winCount":28,"defeatCount":255},{"id":5,"name":"Goths","winCount":39,"defeatCount":196},{"id":6,"name":"Teutons","winCount":84,"defeatCount":215},{"id":7,"name":"Japanese","winCount":53,"defeatCount":236},{"id":8,"name":"Chinese","winCount":63,"defeatCount":205},{"id":9,"name":"Byzantines","winCount":119,"defeatCount":356},{"id":10,"name":"Persians","winCount":57,"defeatCount":229},{"id":11,"name":"Saracens","winCount":90,"defeatCount":178},{"id":12,"name":"Turks","winCount":41,"defeatCount":209},{"id":13,"name":"Vikings","winCount":34,"defeatCount":183},{"id":14,"name":"Mongols","winCount":128,"defeatCount":244},{"id":15,"name":"Celts","winCount":26,"defeatCount":180},{"id":16,"name":"Spanish","winCount":67,"defeatCount":214},{"id":17,"name":"Aztecs","winCount":31,"defeatCount":248},{"id":18,"name":"Mayans","winCount":40,"defeatCount":186},{"id":19,"name":"Huns","winCount":77,"defeatCount":232},{"id":20,"name":"Koreans","winCount":57,"defeatCount":172},{"id":21,"name":"Italians","winCount":40,"defeatCount":178},{"id":22,"name":"Hindustanis","winCount":53,"defeatCount":204},{"id":23,"name":"Incas","winCount":29,"defeatCount":167},{"id":24,"name":"Magyar","winCount":82,"defeatCount":192},{"id":25,"name":"Slavs","winCount":42,"defeatCount":189},{"id":26,"name":"Portuguese","winCount":57,"defeatCount":191},{"id":27,"name":"Ethiopians","winCount":47,"defeatCount":195},{"id":28,"name":"Malians","winCount":32,"defeatCount":162},{"id":29,"name":"Berbers","winCount":36,"defeatCount":153},{"id":30,"name":"Khmer","winCount":38,"defeatCount":213},{"id":31,"name":"Malay","winCount":40,"defeatCount":193},{"id":32,"name":"Burmese","winCount":27,"defeatCount":175},{"id":33,"name":"Vietnamese","winCount":56,"defeatCount":191},{"id":34,"name":"Bulgarians","winCount":34,"defeatCount":161},{"id":35,"name":"Tatars","winCount":60,"defeatCount":212},{"id":36,"name":"Cumans","winCount":47,"defeatCount":211},{"id":37,"name":"Lithuanians","winCount":67,"defeatCount":210},{"id":38,"name":"Random","winCount":951,"defeatCount":1232},{"id":174,"name":"Burgundians","winCount":37,"defeatCount":120},{"id":175,"name":"Sicilians","winCount":38,"defeatCount":133},{"id":184,"name":"Poles","winCount":29,"defeatCount":113},{"id":185,"name":"Bohemians","winCount":36,"defeatCount":116},{"id":195,"name":"Bengalis","winCount":34,"defeatCount":77},{"id":196,"name":"Dravidians","winCount":55,"defeatCount":81},{"id":197,"name":"Gurjaras","winCount":41,"defeatCount":73},{"id":202,"name":"Romans","winCount":15,"defeatCount":29},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":1},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":2,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":88826,"highScoreMilitary":63574,"highScoreEconomy":65079,"highScoreTechnology":12355,"unitsKilled":881553,"unitsLost":640432,"buildingsRaised":92441,"buildingsLost":61400,"wondersBuilt":9,"castlesBuilt":9825,"trebsBuilt":4692,"farmsBuilt":296017},"user":{"userId":"","profileId":912155,"userName":"LowElo_SeRpenZos","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/3187353af889d338e5aa205e57dac66e10edb7d9_full.jpg","elo":1284,"playerStanding":0.16,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	452	-2	0	0	0	\N
59	Awaresness	\N	35	2023-02-24 07:40:19	2023-02-24 07:40:21	1			1000	0	0	\N	0	0	0	0	0	\N
61	Merchon	\N	35	2023-03-24 15:22:10	2023-03-24 15:22:12	1			1000	0	0	\N	0	0	0	0	0	\N
31	Gawuk Waifu	\N	65	2023-03-01 14:03:07	2023-03-01 14:03:10	1			1000	0	0	\N	0	0	0	0	0	\N
1056	kopihitam	4371847	60	\N	2024-11-27 14:52:33	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	kopihitam	1283	0	0	{"mpStatList":{"totalMatches":9,"totalWins":8,"currentWinStreak":4},"careerStats":{"totalGames":1471,"totalWins":704,"civilizations":[{"id":3,"name":"Britons","winCount":46,"defeatCount":90},{"id":4,"name":"Franks","winCount":49,"defeatCount":124},{"id":5,"name":"Goths","winCount":30,"defeatCount":86},{"id":6,"name":"Teutons","winCount":59,"defeatCount":95},{"id":7,"name":"Japanese","winCount":40,"defeatCount":90},{"id":8,"name":"Chinese","winCount":31,"defeatCount":77},{"id":9,"name":"Byzantines","winCount":24,"defeatCount":94},{"id":10,"name":"Persians","winCount":16,"defeatCount":85},{"id":11,"name":"Saracens","winCount":18,"defeatCount":87},{"id":12,"name":"Turks","winCount":39,"defeatCount":76},{"id":13,"name":"Vikings","winCount":46,"defeatCount":69},{"id":14,"name":"Mongols","winCount":53,"defeatCount":123},{"id":15,"name":"Celts","winCount":24,"defeatCount":71},{"id":16,"name":"Spanish","winCount":41,"defeatCount":103},{"id":17,"name":"Aztecs","winCount":37,"defeatCount":61},{"id":18,"name":"Mayans","winCount":43,"defeatCount":90},{"id":19,"name":"Huns","winCount":37,"defeatCount":110},{"id":20,"name":"Koreans","winCount":24,"defeatCount":73},{"id":21,"name":"Italians","winCount":30,"defeatCount":84},{"id":22,"name":"Hindustanis","winCount":26,"defeatCount":95},{"id":23,"name":"Incas","winCount":27,"defeatCount":65},{"id":24,"name":"Magyar","winCount":36,"defeatCount":77},{"id":25,"name":"Slavs","winCount":27,"defeatCount":94},{"id":26,"name":"Portuguese","winCount":35,"defeatCount":91},{"id":27,"name":"Ethiopians","winCount":31,"defeatCount":94},{"id":28,"name":"Malians","winCount":32,"defeatCount":72},{"id":29,"name":"Berbers","winCount":57,"defeatCount":91},{"id":30,"name":"Khmer","winCount":30,"defeatCount":81},{"id":31,"name":"Malay","winCount":37,"defeatCount":73},{"id":32,"name":"Burmese","winCount":24,"defeatCount":63},{"id":33,"name":"Vietnamese","winCount":32,"defeatCount":81},{"id":34,"name":"Bulgarians","winCount":25,"defeatCount":71},{"id":35,"name":"Tatars","winCount":37,"defeatCount":83},{"id":36,"name":"Cumans","winCount":46,"defeatCount":76},{"id":37,"name":"Lithuanians","winCount":28,"defeatCount":99},{"id":38,"name":"Random","winCount":921,"defeatCount":509},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":46},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":43},{"id":184,"name":"Poles","winCount":0,"defeatCount":46},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":42},{"id":195,"name":"Bengalis","winCount":1,"defeatCount":23},{"id":196,"name":"Dravidians","winCount":3,"defeatCount":24},{"id":197,"name":"Gurjaras","winCount":2,"defeatCount":26},{"id":202,"name":"Romans","winCount":0,"defeatCount":7},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":127947,"highScoreMilitary":53322,"highScoreEconomy":50324,"highScoreTechnology":11450,"unitsKilled":557696,"unitsLost":257476,"buildingsRaised":51127,"buildingsLost":20896,"wondersBuilt":3,"castlesBuilt":5319,"trebsBuilt":3137,"farmsBuilt":124104},"user":{"userId":"","profileId":4371847,"userName":"kopihitam","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1282,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	67	-1	7	10	58.5	\N
12448396	spanza	597994	35	\N	2024-11-27 14:52:26	1	https://avatars.steamstatic.com/946beda8008f454a63d109cfc472edac441011de_full.jpg	Spanza	1291	0	856	{"mpStatList":{"totalMatches":39,"totalWins":12,"currentWinStreak":0},"careerStats":{"totalGames":170,"totalWins":53,"civilizations":[{"id":3,"name":"Britons","winCount":3,"defeatCount":19},{"id":4,"name":"Franks","winCount":3,"defeatCount":14},{"id":5,"name":"Goths","winCount":2,"defeatCount":7},{"id":6,"name":"Teutons","winCount":5,"defeatCount":3},{"id":7,"name":"Japanese","winCount":0,"defeatCount":3},{"id":8,"name":"Chinese","winCount":7,"defeatCount":6},{"id":9,"name":"Byzantines","winCount":1,"defeatCount":12},{"id":10,"name":"Persians","winCount":0,"defeatCount":8},{"id":11,"name":"Saracens","winCount":2,"defeatCount":1},{"id":12,"name":"Turks","winCount":1,"defeatCount":5},{"id":13,"name":"Vikings","winCount":2,"defeatCount":4},{"id":14,"name":"Mongols","winCount":0,"defeatCount":8},{"id":15,"name":"Celts","winCount":7,"defeatCount":10},{"id":16,"name":"Spanish","winCount":0,"defeatCount":8},{"id":17,"name":"Aztecs","winCount":2,"defeatCount":5},{"id":18,"name":"Mayans","winCount":2,"defeatCount":7},{"id":19,"name":"Huns","winCount":0,"defeatCount":14},{"id":20,"name":"Koreans","winCount":3,"defeatCount":5},{"id":21,"name":"Italians","winCount":1,"defeatCount":2},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":3},{"id":23,"name":"Incas","winCount":2,"defeatCount":4},{"id":24,"name":"Magyar","winCount":0,"defeatCount":8},{"id":25,"name":"Slavs","winCount":2,"defeatCount":6},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":4},{"id":27,"name":"Ethiopians","winCount":2,"defeatCount":4},{"id":28,"name":"Malians","winCount":2,"defeatCount":3},{"id":29,"name":"Berbers","winCount":1,"defeatCount":4},{"id":30,"name":"Khmer","winCount":0,"defeatCount":7},{"id":31,"name":"Malay","winCount":3,"defeatCount":2},{"id":32,"name":"Burmese","winCount":0,"defeatCount":5},{"id":33,"name":"Vietnamese","winCount":4,"defeatCount":4},{"id":34,"name":"Bulgarians","winCount":1,"defeatCount":0},{"id":35,"name":"Tatars","winCount":0,"defeatCount":3},{"id":36,"name":"Cumans","winCount":0,"defeatCount":3},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":6},{"id":38,"name":"Random","winCount":15,"defeatCount":30},{"id":174,"name":"Burgundians","winCount":2,"defeatCount":1},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":2},{"id":184,"name":"Poles","winCount":0,"defeatCount":1},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":0},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":1},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":0},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64498,"highScoreMilitary":14143,"highScoreEconomy":62736,"highScoreTechnology":6785,"unitsKilled":8630,"unitsLost":7959,"buildingsRaised":1134,"buildingsLost":901,"wondersBuilt":0,"castlesBuilt":197,"trebsBuilt":157,"farmsBuilt":5980},"user":{"userId":"","profileId":597994,"userName":"Spanza","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/946beda8008f454a63d109cfc472edac441011de_full.jpg","elo":856,"playerStanding":0.79,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	12	-1	3	1	36	\N
15	Raurus	7333714	85	2023-02-10 01:33:33	2024-11-27 14:58:52	1	https://avatars.steamstatic.com/8b436dda7970e7707a0731ae40dd4017481dbce0_full.jpg	Capybara	1289	0	1127	{"mpStatList":{"totalMatches":32,"totalWins":24,"currentWinStreak":1},"careerStats":{"totalGames":463,"totalWins":243,"civilizations":[{"id":3,"name":"Britons","winCount":17,"defeatCount":57},{"id":4,"name":"Franks","winCount":29,"defeatCount":134},{"id":5,"name":"Goths","winCount":16,"defeatCount":71},{"id":6,"name":"Teutons","winCount":14,"defeatCount":109},{"id":7,"name":"Japanese","winCount":5,"defeatCount":36},{"id":8,"name":"Chinese","winCount":2,"defeatCount":54},{"id":9,"name":"Byzantines","winCount":14,"defeatCount":114},{"id":10,"name":"Persians","winCount":9,"defeatCount":48},{"id":11,"name":"Saracens","winCount":17,"defeatCount":67},{"id":12,"name":"Turks","winCount":8,"defeatCount":78},{"id":13,"name":"Vikings","winCount":12,"defeatCount":19},{"id":14,"name":"Mongols","winCount":56,"defeatCount":83},{"id":15,"name":"Celts","winCount":15,"defeatCount":40},{"id":16,"name":"Spanish","winCount":17,"defeatCount":63},{"id":17,"name":"Aztecs","winCount":8,"defeatCount":29},{"id":18,"name":"Mayans","winCount":10,"defeatCount":29},{"id":19,"name":"Huns","winCount":19,"defeatCount":23},{"id":20,"name":"Koreans","winCount":5,"defeatCount":14},{"id":21,"name":"Italians","winCount":6,"defeatCount":89},{"id":22,"name":"Hindustanis","winCount":17,"defeatCount":82},{"id":23,"name":"Incas","winCount":6,"defeatCount":41},{"id":24,"name":"Magyar","winCount":13,"defeatCount":42},{"id":25,"name":"Slavs","winCount":2,"defeatCount":95},{"id":26,"name":"Portuguese","winCount":15,"defeatCount":34},{"id":27,"name":"Ethiopians","winCount":33,"defeatCount":74},{"id":28,"name":"Malians","winCount":6,"defeatCount":35},{"id":29,"name":"Berbers","winCount":16,"defeatCount":46},{"id":30,"name":"Khmer","winCount":21,"defeatCount":52},{"id":31,"name":"Malay","winCount":9,"defeatCount":52},{"id":32,"name":"Burmese","winCount":14,"defeatCount":36},{"id":33,"name":"Vietnamese","winCount":8,"defeatCount":31},{"id":34,"name":"Bulgarians","winCount":12,"defeatCount":39},{"id":35,"name":"Tatars","winCount":18,"defeatCount":85},{"id":36,"name":"Cumans","winCount":13,"defeatCount":39},{"id":37,"name":"Lithuanians","winCount":19,"defeatCount":76},{"id":38,"name":"Random","winCount":79,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":12,"defeatCount":31},{"id":175,"name":"Sicilians","winCount":14,"defeatCount":32},{"id":184,"name":"Poles","winCount":26,"defeatCount":47},{"id":185,"name":"Bohemians","winCount":16,"defeatCount":54},{"id":195,"name":"Bengalis","winCount":13,"defeatCount":5},{"id":196,"name":"Dravidians","winCount":30,"defeatCount":9},{"id":197,"name":"Gurjaras","winCount":23,"defeatCount":16},{"id":202,"name":"Romans","winCount":0,"defeatCount":2},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":6},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":1},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":6},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":5,"defeatCount":8},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":1,"defeatCount":6},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":864192,"highScoreMilitary":63156,"highScoreEconomy":64836,"highScoreTechnology":12075,"unitsKilled":282462,"unitsLost":141923,"buildingsRaised":40301,"buildingsLost":6216,"wondersBuilt":14,"castlesBuilt":2404,"trebsBuilt":2176,"farmsBuilt":63786},"user":{"userId":"","profileId":7333714,"userName":"Capybara","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/8b436dda7970e7707a0731ae40dd4017481dbce0_full.jpg","elo":1127,"playerStanding":0.34,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	11	-2	3	5	84	\N
18170635	Jurig	11955124	55	2024-07-16 03:59:09	2024-11-27 14:52:45	1	https://avatars.steamstatic.com/634c25e56588efa4605704c884f652db69e5b95b_full.jpg	[OmG] 7ibRiL	1303	0	1263	{"mpStatList":{"totalMatches":21,"totalWins":15,"currentWinStreak":9},"careerStats":{"totalGames":622,"totalWins":280,"civilizations":[{"id":3,"name":"Britons","winCount":6,"defeatCount":27},{"id":4,"name":"Franks","winCount":9,"defeatCount":25},{"id":5,"name":"Goths","winCount":11,"defeatCount":27},{"id":6,"name":"Teutons","winCount":16,"defeatCount":24},{"id":7,"name":"Japanese","winCount":8,"defeatCount":31},{"id":8,"name":"Chinese","winCount":7,"defeatCount":23},{"id":9,"name":"Byzantines","winCount":12,"defeatCount":25},{"id":10,"name":"Persians","winCount":9,"defeatCount":25},{"id":11,"name":"Saracens","winCount":5,"defeatCount":44},{"id":12,"name":"Turks","winCount":7,"defeatCount":24},{"id":13,"name":"Vikings","winCount":10,"defeatCount":24},{"id":14,"name":"Mongols","winCount":6,"defeatCount":22},{"id":15,"name":"Celts","winCount":7,"defeatCount":23},{"id":16,"name":"Spanish","winCount":17,"defeatCount":36},{"id":17,"name":"Aztecs","winCount":9,"defeatCount":24},{"id":18,"name":"Mayans","winCount":11,"defeatCount":32},{"id":19,"name":"Huns","winCount":14,"defeatCount":21},{"id":20,"name":"Koreans","winCount":13,"defeatCount":28},{"id":21,"name":"Italians","winCount":6,"defeatCount":23},{"id":22,"name":"Hindustanis","winCount":11,"defeatCount":31},{"id":23,"name":"Incas","winCount":5,"defeatCount":21},{"id":24,"name":"Magyar","winCount":11,"defeatCount":17},{"id":25,"name":"Slavs","winCount":10,"defeatCount":25},{"id":26,"name":"Portuguese","winCount":14,"defeatCount":39},{"id":27,"name":"Ethiopians","winCount":11,"defeatCount":28},{"id":28,"name":"Malians","winCount":11,"defeatCount":24},{"id":29,"name":"Berbers","winCount":10,"defeatCount":37},{"id":30,"name":"Khmer","winCount":7,"defeatCount":27},{"id":31,"name":"Malay","winCount":7,"defeatCount":25},{"id":32,"name":"Burmese","winCount":11,"defeatCount":27},{"id":33,"name":"Vietnamese","winCount":8,"defeatCount":29},{"id":34,"name":"Bulgarians","winCount":12,"defeatCount":25},{"id":35,"name":"Tatars","winCount":7,"defeatCount":28},{"id":36,"name":"Cumans","winCount":12,"defeatCount":21},{"id":37,"name":"Lithuanians","winCount":16,"defeatCount":23},{"id":38,"name":"Random","winCount":337,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":8,"defeatCount":15},{"id":175,"name":"Sicilians","winCount":9,"defeatCount":17},{"id":184,"name":"Poles","winCount":0,"defeatCount":27},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":23},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":22},{"id":196,"name":"Dravidians","winCount":4,"defeatCount":25},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":11},{"id":202,"name":"Romans","winCount":0,"defeatCount":6},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":51972,"highScoreMilitary":35525,"highScoreEconomy":13968,"highScoreTechnology":6520,"unitsKilled":115467,"unitsLost":123960,"buildingsRaised":16056,"buildingsLost":17253,"wondersBuilt":0,"castlesBuilt":2102,"trebsBuilt":2292,"farmsBuilt":47748},"user":{"userId":"","profileId":11955124,"userName":"[OmG] 7ibRiL","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/634c25e56588efa4605704c884f652db69e5b95b_full.jpg","elo":1263,"playerStanding":0.18,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	18	-1	0	0	0	\N
52	barieqaotoluwa	14474131	60	2023-04-10 21:15:13	2024-11-27 14:59:15	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	Hala	1299	0	897	{"mpStatList":{"totalMatches":115,"totalWins":51,"currentWinStreak":1},"careerStats":{"totalGames":447,"totalWins":231,"civilizations":[{"id":3,"name":"Britons","winCount":16,"defeatCount":49},{"id":4,"name":"Franks","winCount":18,"defeatCount":39},{"id":5,"name":"Goths","winCount":13,"defeatCount":36},{"id":6,"name":"Teutons","winCount":9,"defeatCount":33},{"id":7,"name":"Japanese","winCount":12,"defeatCount":34},{"id":8,"name":"Chinese","winCount":10,"defeatCount":28},{"id":9,"name":"Byzantines","winCount":13,"defeatCount":42},{"id":10,"name":"Persians","winCount":20,"defeatCount":35},{"id":11,"name":"Saracens","winCount":12,"defeatCount":38},{"id":12,"name":"Turks","winCount":5,"defeatCount":41},{"id":13,"name":"Vikings","winCount":11,"defeatCount":22},{"id":14,"name":"Mongols","winCount":11,"defeatCount":37},{"id":15,"name":"Celts","winCount":8,"defeatCount":25},{"id":16,"name":"Spanish","winCount":13,"defeatCount":42},{"id":17,"name":"Aztecs","winCount":5,"defeatCount":48},{"id":18,"name":"Mayans","winCount":9,"defeatCount":35},{"id":19,"name":"Huns","winCount":7,"defeatCount":34},{"id":20,"name":"Koreans","winCount":12,"defeatCount":39},{"id":21,"name":"Italians","winCount":5,"defeatCount":21},{"id":22,"name":"Hindustanis","winCount":11,"defeatCount":33},{"id":23,"name":"Incas","winCount":14,"defeatCount":32},{"id":24,"name":"Magyar","winCount":4,"defeatCount":30},{"id":25,"name":"Slavs","winCount":13,"defeatCount":29},{"id":26,"name":"Portuguese","winCount":8,"defeatCount":33},{"id":27,"name":"Ethiopians","winCount":13,"defeatCount":39},{"id":28,"name":"Malians","winCount":14,"defeatCount":23},{"id":29,"name":"Berbers","winCount":5,"defeatCount":36},{"id":30,"name":"Khmer","winCount":16,"defeatCount":49},{"id":31,"name":"Malay","winCount":7,"defeatCount":27},{"id":32,"name":"Burmese","winCount":9,"defeatCount":32},{"id":33,"name":"Vietnamese","winCount":8,"defeatCount":26},{"id":34,"name":"Bulgarians","winCount":14,"defeatCount":20},{"id":35,"name":"Tatars","winCount":9,"defeatCount":28},{"id":36,"name":"Cumans","winCount":10,"defeatCount":25},{"id":37,"name":"Lithuanians","winCount":11,"defeatCount":36},{"id":38,"name":"Random","winCount":332,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":9,"defeatCount":27},{"id":175,"name":"Sicilians","winCount":6,"defeatCount":37},{"id":184,"name":"Poles","winCount":8,"defeatCount":40},{"id":185,"name":"Bohemians","winCount":6,"defeatCount":31},{"id":195,"name":"Bengalis","winCount":7,"defeatCount":19},{"id":196,"name":"Dravidians","winCount":12,"defeatCount":32},{"id":197,"name":"Gurjaras","winCount":8,"defeatCount":40},{"id":202,"name":"Romans","winCount":0,"defeatCount":3},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":62989,"highScoreMilitary":64594,"highScoreEconomy":18854,"highScoreTechnology":7984,"unitsKilled":273659,"unitsLost":175923,"buildingsRaised":29969,"buildingsLost":13350,"wondersBuilt":36,"castlesBuilt":2530,"trebsBuilt":1930,"farmsBuilt":42769},"user":{"userId":"","profileId":14474131,"userName":"Hala","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1028,"playerStanding":0.5,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	24	-3	5	12	56.5	\N
18	KickAss	\N	75	2023-02-24 07:22:45	2023-02-24 07:22:48	1			1000	0	0	\N	0	0	0	0	0	\N
18170630	Seven	\N	30	2024-05-24 17:58:15	2024-06-08 23:04:37	1	\N	qmaxquique	1000	0	0	{"mpStatList":{"totalMatches":0,"totalWins":0,"currentWinStreak":0},"careerStats":{"totalGames":4,"totalWins":0,"civilizations":[{"id":3,"name":"Britons","winCount":0,"defeatCount":14},{"id":4,"name":"Franks","winCount":3,"defeatCount":6},{"id":5,"name":"Goths","winCount":0,"defeatCount":2},{"id":6,"name":"Teutons","winCount":3,"defeatCount":1},{"id":7,"name":"Japanese","winCount":3,"defeatCount":0},{"id":8,"name":"Chinese","winCount":0,"defeatCount":2},{"id":9,"name":"Byzantines","winCount":0,"defeatCount":1},{"id":10,"name":"Persians","winCount":2,"defeatCount":0},{"id":11,"name":"Saracens","winCount":1,"defeatCount":2},{"id":12,"name":"Turks","winCount":1,"defeatCount":1},{"id":13,"name":"Vikings","winCount":1,"defeatCount":1},{"id":14,"name":"Mongols","winCount":0,"defeatCount":1},{"id":15,"name":"Celts","winCount":19,"defeatCount":3},{"id":16,"name":"Spanish","winCount":4,"defeatCount":2},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":2},{"id":18,"name":"Mayans","winCount":0,"defeatCount":2},{"id":19,"name":"Huns","winCount":0,"defeatCount":2},{"id":20,"name":"Koreans","winCount":0,"defeatCount":5},{"id":21,"name":"Italians","winCount":0,"defeatCount":0},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":1},{"id":23,"name":"Incas","winCount":0,"defeatCount":1},{"id":24,"name":"Magyar","winCount":0,"defeatCount":4},{"id":25,"name":"Slavs","winCount":0,"defeatCount":4},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":1},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":2},{"id":28,"name":"Malians","winCount":0,"defeatCount":1},{"id":29,"name":"Berbers","winCount":0,"defeatCount":0},{"id":30,"name":"Khmer","winCount":0,"defeatCount":3},{"id":31,"name":"Malay","winCount":0,"defeatCount":1},{"id":32,"name":"Burmese","winCount":0,"defeatCount":2},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":2},{"id":34,"name":"Bulgarians","winCount":0,"defeatCount":0},{"id":35,"name":"Tatars","winCount":0,"defeatCount":1},{"id":36,"name":"Cumans","winCount":0,"defeatCount":0},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":0},{"id":38,"name":"Random","winCount":0,"defeatCount":33},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":1},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":0},{"id":184,"name":"Poles","winCount":0,"defeatCount":0},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":0},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":0},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":20433,"highScoreMilitary":7297,"highScoreEconomy":9928,"highScoreTechnology":11887,"unitsKilled":2576,"unitsLost":2129,"buildingsRaised":811,"buildingsLost":122,"wondersBuilt":12,"castlesBuilt":45,"trebsBuilt":112,"farmsBuilt":725},"user":{"userId":"","profileId":123456,"userName":"qmaxquique","avatarUrl":null,"elo":null,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	0	0	0	0	\N
23	Mbok_Ijjah	5138019	85	2023-02-24 07:25:14	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/4ea3fa992d54c6473edc86f800d659af446e873d_full.jpg	Liereuyy	1410	1155	1373	{"mpStatList":{"totalMatches":417,"totalWins":228,"currentWinStreak":0},"careerStats":{"totalGames":1856,"totalWins":949,"civilizations":[{"id":3,"name":"Britons","winCount":17,"defeatCount":88},{"id":4,"name":"Franks","winCount":23,"defeatCount":121},{"id":5,"name":"Goths","winCount":18,"defeatCount":80},{"id":6,"name":"Teutons","winCount":11,"defeatCount":84},{"id":7,"name":"Japanese","winCount":24,"defeatCount":65},{"id":8,"name":"Chinese","winCount":15,"defeatCount":70},{"id":9,"name":"Byzantines","winCount":25,"defeatCount":66},{"id":10,"name":"Persians","winCount":16,"defeatCount":110},{"id":11,"name":"Saracens","winCount":13,"defeatCount":86},{"id":12,"name":"Turks","winCount":7,"defeatCount":71},{"id":13,"name":"Vikings","winCount":18,"defeatCount":54},{"id":14,"name":"Mongols","winCount":149,"defeatCount":128},{"id":15,"name":"Celts","winCount":20,"defeatCount":60},{"id":16,"name":"Spanish","winCount":89,"defeatCount":112},{"id":17,"name":"Aztecs","winCount":25,"defeatCount":61},{"id":18,"name":"Mayans","winCount":48,"defeatCount":81},{"id":19,"name":"Huns","winCount":75,"defeatCount":87},{"id":20,"name":"Koreans","winCount":18,"defeatCount":49},{"id":21,"name":"Italians","winCount":38,"defeatCount":91},{"id":22,"name":"Hindustanis","winCount":16,"defeatCount":69},{"id":23,"name":"Incas","winCount":15,"defeatCount":67},{"id":24,"name":"Magyar","winCount":22,"defeatCount":71},{"id":25,"name":"Slavs","winCount":22,"defeatCount":40},{"id":26,"name":"Portuguese","winCount":22,"defeatCount":72},{"id":27,"name":"Ethiopians","winCount":27,"defeatCount":83},{"id":28,"name":"Malians","winCount":29,"defeatCount":65},{"id":29,"name":"Berbers","winCount":22,"defeatCount":86},{"id":30,"name":"Khmer","winCount":21,"defeatCount":80},{"id":31,"name":"Malay","winCount":12,"defeatCount":74},{"id":32,"name":"Burmese","winCount":15,"defeatCount":62},{"id":33,"name":"Vietnamese","winCount":33,"defeatCount":81},{"id":34,"name":"Bulgarians","winCount":22,"defeatCount":68},{"id":35,"name":"Tatars","winCount":24,"defeatCount":83},{"id":36,"name":"Cumans","winCount":21,"defeatCount":74},{"id":37,"name":"Lithuanians","winCount":13,"defeatCount":68},{"id":38,"name":"Random","winCount":588,"defeatCount":389},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":60},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":39},{"id":184,"name":"Poles","winCount":0,"defeatCount":49},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":60},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":38},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":44},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":34},{"id":202,"name":"Romans","winCount":0,"defeatCount":26},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":42300,"highScoreMilitary":54730,"highScoreEconomy":11566,"highScoreTechnology":6188,"unitsKilled":286967,"unitsLost":293212,"buildingsRaised":33905,"buildingsLost":29294,"wondersBuilt":0,"castlesBuilt":4212,"trebsBuilt":1748,"farmsBuilt":66342},"user":{"userId":"","profileId":5138019,"userName":"Liereuyy","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/4ea3fa992d54c6473edc86f800d659af446e873d_full.jpg","elo":1300,"playerStanding":0.15,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	30	3	6	11	77.5	\N
46	SIS	9414798	55	2023-02-10 01:33:33	2024-11-27 14:53:01	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	PAK SLAMET	0	0	0	{"mpStatList":{"totalMatches":58,"totalWins":26,"currentWinStreak":3},"careerStats":{"totalGames":1033,"totalWins":450,"civilizations":[{"id":3,"name":"Britons","winCount":14,"defeatCount":88},{"id":4,"name":"Franks","winCount":16,"defeatCount":99},{"id":5,"name":"Goths","winCount":50,"defeatCount":56},{"id":6,"name":"Teutons","winCount":26,"defeatCount":58},{"id":7,"name":"Japanese","winCount":16,"defeatCount":53},{"id":8,"name":"Chinese","winCount":14,"defeatCount":47},{"id":9,"name":"Byzantines","winCount":10,"defeatCount":52},{"id":10,"name":"Persians","winCount":12,"defeatCount":76},{"id":11,"name":"Saracens","winCount":9,"defeatCount":60},{"id":12,"name":"Turks","winCount":11,"defeatCount":63},{"id":13,"name":"Vikings","winCount":14,"defeatCount":53},{"id":14,"name":"Mongols","winCount":22,"defeatCount":58},{"id":15,"name":"Celts","winCount":14,"defeatCount":63},{"id":16,"name":"Spanish","winCount":20,"defeatCount":82},{"id":17,"name":"Aztecs","winCount":20,"defeatCount":43},{"id":18,"name":"Mayans","winCount":11,"defeatCount":55},{"id":19,"name":"Huns","winCount":13,"defeatCount":61},{"id":20,"name":"Koreans","winCount":15,"defeatCount":48},{"id":21,"name":"Italians","winCount":17,"defeatCount":95},{"id":22,"name":"Hindustanis","winCount":12,"defeatCount":63},{"id":23,"name":"Incas","winCount":14,"defeatCount":46},{"id":24,"name":"Magyar","winCount":15,"defeatCount":60},{"id":25,"name":"Slavs","winCount":29,"defeatCount":43},{"id":26,"name":"Portuguese","winCount":31,"defeatCount":71},{"id":27,"name":"Ethiopians","winCount":15,"defeatCount":59},{"id":28,"name":"Malians","winCount":17,"defeatCount":56},{"id":29,"name":"Berbers","winCount":11,"defeatCount":53},{"id":30,"name":"Khmer","winCount":26,"defeatCount":66},{"id":31,"name":"Malay","winCount":5,"defeatCount":72},{"id":32,"name":"Burmese","winCount":16,"defeatCount":58},{"id":33,"name":"Vietnamese","winCount":16,"defeatCount":65},{"id":34,"name":"Bulgarians","winCount":18,"defeatCount":60},{"id":35,"name":"Tatars","winCount":11,"defeatCount":55},{"id":36,"name":"Cumans","winCount":5,"defeatCount":60},{"id":37,"name":"Lithuanians","winCount":19,"defeatCount":68},{"id":38,"name":"Random","winCount":333,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":23,"defeatCount":44},{"id":175,"name":"Sicilians","winCount":12,"defeatCount":66},{"id":184,"name":"Poles","winCount":50,"defeatCount":48},{"id":185,"name":"Bohemians","winCount":12,"defeatCount":47},{"id":195,"name":"Bengalis","winCount":10,"defeatCount":18},{"id":196,"name":"Dravidians","winCount":20,"defeatCount":30},{"id":197,"name":"Gurjaras","winCount":16,"defeatCount":36},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":66808,"highScoreMilitary":55918,"highScoreEconomy":37567,"highScoreTechnology":8142,"unitsKilled":334602,"unitsLost":340290,"buildingsRaised":39395,"buildingsLost":30359,"wondersBuilt":2,"castlesBuilt":4933,"trebsBuilt":6144,"farmsBuilt":121051},"user":{"userId":"","profileId":9414798,"userName":"PAK SLAMET","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1020,"playerStanding":0.51,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-1	8	9	54.5	\N
1059	Sheva	14923704	55	\N	2024-11-27 14:52:53	1	https://avatars.steamstatic.com/6de1f1bcc01d9714b4e7a9c9d75d6c85576fef1d_full.jpg	[Vesper] sheva	1170	0	1033	{"mpStatList":{"totalMatches":1095,"totalWins":543,"currentWinStreak":1},"careerStats":{"totalGames":1743,"totalWins":874,"civilizations":[{"id":3,"name":"Britons","winCount":73,"defeatCount":175},{"id":4,"name":"Franks","winCount":89,"defeatCount":187},{"id":5,"name":"Goths","winCount":81,"defeatCount":136},{"id":6,"name":"Teutons","winCount":19,"defeatCount":128},{"id":7,"name":"Japanese","winCount":5,"defeatCount":72},{"id":8,"name":"Chinese","winCount":5,"defeatCount":62},{"id":9,"name":"Byzantines","winCount":91,"defeatCount":83},{"id":10,"name":"Persians","winCount":9,"defeatCount":191},{"id":11,"name":"Saracens","winCount":7,"defeatCount":69},{"id":12,"name":"Turks","winCount":47,"defeatCount":127},{"id":13,"name":"Vikings","winCount":74,"defeatCount":88},{"id":14,"name":"Mongols","winCount":23,"defeatCount":156},{"id":15,"name":"Celts","winCount":9,"defeatCount":98},{"id":16,"name":"Spanish","winCount":23,"defeatCount":114},{"id":17,"name":"Aztecs","winCount":2,"defeatCount":39},{"id":18,"name":"Mayans","winCount":92,"defeatCount":53},{"id":19,"name":"Huns","winCount":7,"defeatCount":107},{"id":20,"name":"Koreans","winCount":3,"defeatCount":56},{"id":21,"name":"Italians","winCount":11,"defeatCount":78},{"id":22,"name":"Hindustanis","winCount":11,"defeatCount":74},{"id":23,"name":"Incas","winCount":5,"defeatCount":41},{"id":24,"name":"Magyar","winCount":2,"defeatCount":57},{"id":25,"name":"Slavs","winCount":4,"defeatCount":66},{"id":26,"name":"Portuguese","winCount":1,"defeatCount":124},{"id":27,"name":"Ethiopians","winCount":7,"defeatCount":57},{"id":28,"name":"Malians","winCount":5,"defeatCount":26},{"id":29,"name":"Berbers","winCount":2,"defeatCount":31},{"id":30,"name":"Khmer","winCount":132,"defeatCount":202},{"id":31,"name":"Malay","winCount":10,"defeatCount":46},{"id":32,"name":"Burmese","winCount":4,"defeatCount":20},{"id":33,"name":"Vietnamese","winCount":11,"defeatCount":61},{"id":34,"name":"Bulgarians","winCount":9,"defeatCount":28},{"id":35,"name":"Tatars","winCount":2,"defeatCount":39},{"id":36,"name":"Cumans","winCount":4,"defeatCount":74},{"id":37,"name":"Lithuanians","winCount":6,"defeatCount":66},{"id":38,"name":"Random","winCount":53,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":9,"defeatCount":54},{"id":175,"name":"Sicilians","winCount":3,"defeatCount":32},{"id":184,"name":"Poles","winCount":2,"defeatCount":60},{"id":185,"name":"Bohemians","winCount":6,"defeatCount":118},{"id":195,"name":"Bengalis","winCount":3,"defeatCount":17},{"id":196,"name":"Dravidians","winCount":3,"defeatCount":33},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":21},{"id":202,"name":"Romans","winCount":0,"defeatCount":83},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":61521,"highScoreMilitary":63908,"highScoreEconomy":17690,"highScoreTechnology":8208,"unitsKilled":327470,"unitsLost":326479,"buildingsRaised":42350,"buildingsLost":26403,"wondersBuilt":0,"castlesBuilt":5786,"trebsBuilt":2329,"farmsBuilt":40862},"user":{"userId":"","profileId":14923704,"userName":"[Vesper] sheva","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/6de1f1bcc01d9714b4e7a9c9d75d6c85576fef1d_full.jpg","elo":878,"playerStanding":0.75,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-6	0	0	45	\N
40	botak meringis	2481683	65	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/27d3533a5665807e70d5b46db027f2d39b9048ed_full.jpg	botak meringis	1295	0	1205	{"mpStatList":{"totalMatches":923,"totalWins":448,"currentWinStreak":1},"careerStats":{"totalGames":3104,"totalWins":1502,"civilizations":[{"id":3,"name":"Britons","winCount":49,"defeatCount":272},{"id":4,"name":"Franks","winCount":39,"defeatCount":360},{"id":5,"name":"Goths","winCount":72,"defeatCount":260},{"id":6,"name":"Teutons","winCount":30,"defeatCount":186},{"id":7,"name":"Japanese","winCount":52,"defeatCount":147},{"id":8,"name":"Chinese","winCount":23,"defeatCount":144},{"id":9,"name":"Byzantines","winCount":26,"defeatCount":198},{"id":10,"name":"Persians","winCount":48,"defeatCount":214},{"id":11,"name":"Saracens","winCount":115,"defeatCount":116},{"id":12,"name":"Turks","winCount":59,"defeatCount":187},{"id":13,"name":"Vikings","winCount":22,"defeatCount":132},{"id":14,"name":"Mongols","winCount":30,"defeatCount":298},{"id":15,"name":"Celts","winCount":33,"defeatCount":165},{"id":16,"name":"Spanish","winCount":20,"defeatCount":219},{"id":17,"name":"Aztecs","winCount":18,"defeatCount":129},{"id":18,"name":"Mayans","winCount":45,"defeatCount":188},{"id":19,"name":"Huns","winCount":68,"defeatCount":238},{"id":20,"name":"Koreans","winCount":24,"defeatCount":122},{"id":21,"name":"Italians","winCount":33,"defeatCount":145},{"id":22,"name":"Hindustanis","winCount":32,"defeatCount":129},{"id":23,"name":"Incas","winCount":28,"defeatCount":124},{"id":24,"name":"Magyar","winCount":22,"defeatCount":172},{"id":25,"name":"Slavs","winCount":38,"defeatCount":157},{"id":26,"name":"Portuguese","winCount":22,"defeatCount":130},{"id":27,"name":"Ethiopians","winCount":24,"defeatCount":171},{"id":28,"name":"Malians","winCount":30,"defeatCount":89},{"id":29,"name":"Berbers","winCount":49,"defeatCount":113},{"id":30,"name":"Khmer","winCount":22,"defeatCount":224},{"id":31,"name":"Malay","winCount":167,"defeatCount":143},{"id":32,"name":"Burmese","winCount":34,"defeatCount":110},{"id":33,"name":"Vietnamese","winCount":32,"defeatCount":167},{"id":34,"name":"Bulgarians","winCount":115,"defeatCount":144},{"id":35,"name":"Tatars","winCount":49,"defeatCount":128},{"id":36,"name":"Cumans","winCount":48,"defeatCount":164},{"id":37,"name":"Lithuanians","winCount":27,"defeatCount":153},{"id":38,"name":"Random","winCount":881,"defeatCount":863},{"id":174,"name":"Burgundians","winCount":47,"defeatCount":81},{"id":175,"name":"Sicilians","winCount":23,"defeatCount":60},{"id":184,"name":"Poles","winCount":14,"defeatCount":61},{"id":185,"name":"Bohemians","winCount":9,"defeatCount":71},{"id":195,"name":"Bengalis","winCount":13,"defeatCount":14},{"id":196,"name":"Dravidians","winCount":72,"defeatCount":32},{"id":197,"name":"Gurjaras","winCount":14,"defeatCount":34},{"id":202,"name":"Romans","winCount":0,"defeatCount":30},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":84180,"highScoreMilitary":53989,"highScoreEconomy":40203,"highScoreTechnology":9855,"unitsKilled":469409,"unitsLost":456402,"buildingsRaised":69844,"buildingsLost":52038,"wondersBuilt":53,"castlesBuilt":7048,"trebsBuilt":5177,"farmsBuilt":170790},"user":{"userId":"","profileId":2481683,"userName":"botak meringis","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/27d3533a5665807e70d5b46db027f2d39b9048ed_full.jpg","elo":1145,"playerStanding":0.32,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	80	-2	2	2	65	\N
1	Bagas	2702812	90	2023-02-10 01:33:33	2024-11-27 14:53:11	1	https://avatars.steamstatic.com/1cf51dcd454dee67b8317ed9232bc9e0e3978488_full.jpg	[xbow] Gogaaas	1388	0	1490	{"mpStatList":{"totalMatches":283,"totalWins":172,"currentWinStreak":3},"careerStats":{"totalGames":1618,"totalWins":902,"civilizations":[{"id":3,"name":"Britons","winCount":41,"defeatCount":91},{"id":4,"name":"Franks","winCount":36,"defeatCount":114},{"id":5,"name":"Goths","winCount":32,"defeatCount":85},{"id":6,"name":"Teutons","winCount":21,"defeatCount":82},{"id":7,"name":"Japanese","winCount":21,"defeatCount":68},{"id":8,"name":"Chinese","winCount":18,"defeatCount":76},{"id":9,"name":"Byzantines","winCount":22,"defeatCount":79},{"id":10,"name":"Persians","winCount":22,"defeatCount":90},{"id":11,"name":"Saracens","winCount":17,"defeatCount":70},{"id":12,"name":"Turks","winCount":15,"defeatCount":60},{"id":13,"name":"Vikings","winCount":28,"defeatCount":84},{"id":14,"name":"Mongols","winCount":69,"defeatCount":119},{"id":15,"name":"Celts","winCount":25,"defeatCount":73},{"id":16,"name":"Spanish","winCount":44,"defeatCount":106},{"id":17,"name":"Aztecs","winCount":37,"defeatCount":82},{"id":18,"name":"Mayans","winCount":38,"defeatCount":96},{"id":19,"name":"Huns","winCount":29,"defeatCount":78},{"id":20,"name":"Koreans","winCount":26,"defeatCount":74},{"id":21,"name":"Italians","winCount":19,"defeatCount":73},{"id":22,"name":"Hindustanis","winCount":19,"defeatCount":93},{"id":23,"name":"Incas","winCount":20,"defeatCount":69},{"id":24,"name":"Magyar","winCount":28,"defeatCount":81},{"id":25,"name":"Slavs","winCount":23,"defeatCount":59},{"id":26,"name":"Portuguese","winCount":18,"defeatCount":76},{"id":27,"name":"Ethiopians","winCount":47,"defeatCount":73},{"id":28,"name":"Malians","winCount":16,"defeatCount":69},{"id":29,"name":"Berbers","winCount":20,"defeatCount":78},{"id":30,"name":"Khmer","winCount":16,"defeatCount":84},{"id":31,"name":"Malay","winCount":20,"defeatCount":72},{"id":32,"name":"Burmese","winCount":21,"defeatCount":61},{"id":33,"name":"Vietnamese","winCount":25,"defeatCount":79},{"id":34,"name":"Bulgarians","winCount":23,"defeatCount":68},{"id":35,"name":"Tatars","winCount":20,"defeatCount":78},{"id":36,"name":"Cumans","winCount":36,"defeatCount":86},{"id":37,"name":"Lithuanians","winCount":18,"defeatCount":81},{"id":38,"name":"Random","winCount":531,"defeatCount":798},{"id":174,"name":"Burgundians","winCount":15,"defeatCount":38},{"id":175,"name":"Sicilians","winCount":29,"defeatCount":43},{"id":184,"name":"Poles","winCount":14,"defeatCount":34},{"id":185,"name":"Bohemians","winCount":9,"defeatCount":51},{"id":195,"name":"Bengalis","winCount":10,"defeatCount":17},{"id":196,"name":"Dravidians","winCount":13,"defeatCount":29},{"id":197,"name":"Gurjaras","winCount":7,"defeatCount":24},{"id":202,"name":"Romans","winCount":0,"defeatCount":6},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":47993,"highScoreMilitary":38636,"highScoreEconomy":10564,"highScoreTechnology":5952,"unitsKilled":328001,"unitsLost":289476,"buildingsRaised":37827,"buildingsLost":20178,"wondersBuilt":0,"castlesBuilt":3947,"trebsBuilt":3931,"farmsBuilt":105031},"user":{"userId":"","profileId":2702812,"userName":"[xbow] Gogaaas","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/1cf51dcd454dee67b8317ed9232bc9e0e3978488_full.jpg","elo":1484,"playerStanding":0.05,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	33	-1	14	3	90.5	01JBDYET9FTW8PHJR227TNZ1N3.png
2	Theobald	6830736	105	2023-02-24 07:30:22	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/ed5a918e467cfc880c61b6f65b48f4d75aae3231_full.jpg	| Bifi | Theobald	1397	0	1561	{"mpStatList":{"totalMatches":53,"totalWins":40,"currentWinStreak":5},"careerStats":{"totalGames":1204,"totalWins":725,"civilizations":[{"id":3,"name":"Britons","winCount":18,"defeatCount":103},{"id":4,"name":"Franks","winCount":37,"defeatCount":151},{"id":5,"name":"Goths","winCount":33,"defeatCount":114},{"id":6,"name":"Teutons","winCount":22,"defeatCount":128},{"id":7,"name":"Japanese","winCount":16,"defeatCount":89},{"id":8,"name":"Chinese","winCount":18,"defeatCount":74},{"id":9,"name":"Byzantines","winCount":24,"defeatCount":164},{"id":10,"name":"Persians","winCount":29,"defeatCount":105},{"id":11,"name":"Saracens","winCount":33,"defeatCount":93},{"id":12,"name":"Turks","winCount":25,"defeatCount":90},{"id":13,"name":"Vikings","winCount":20,"defeatCount":68},{"id":14,"name":"Mongols","winCount":21,"defeatCount":116},{"id":15,"name":"Celts","winCount":34,"defeatCount":97},{"id":16,"name":"Spanish","winCount":23,"defeatCount":95},{"id":17,"name":"Aztecs","winCount":24,"defeatCount":87},{"id":18,"name":"Mayans","winCount":14,"defeatCount":67},{"id":19,"name":"Huns","winCount":36,"defeatCount":62},{"id":20,"name":"Koreans","winCount":18,"defeatCount":66},{"id":21,"name":"Italians","winCount":19,"defeatCount":140},{"id":22,"name":"Hindustanis","winCount":21,"defeatCount":95},{"id":23,"name":"Incas","winCount":16,"defeatCount":75},{"id":24,"name":"Magyar","winCount":24,"defeatCount":69},{"id":25,"name":"Slavs","winCount":20,"defeatCount":92},{"id":26,"name":"Portuguese","winCount":28,"defeatCount":75},{"id":27,"name":"Ethiopians","winCount":23,"defeatCount":97},{"id":28,"name":"Malians","winCount":21,"defeatCount":80},{"id":29,"name":"Berbers","winCount":23,"defeatCount":73},{"id":30,"name":"Khmer","winCount":32,"defeatCount":86},{"id":31,"name":"Malay","winCount":20,"defeatCount":78},{"id":32,"name":"Burmese","winCount":14,"defeatCount":82},{"id":33,"name":"Vietnamese","winCount":14,"defeatCount":90},{"id":34,"name":"Bulgarians","winCount":18,"defeatCount":69},{"id":35,"name":"Tatars","winCount":25,"defeatCount":98},{"id":36,"name":"Cumans","winCount":18,"defeatCount":68},{"id":37,"name":"Lithuanians","winCount":17,"defeatCount":94},{"id":38,"name":"Random","winCount":493,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":38,"defeatCount":66},{"id":175,"name":"Sicilians","winCount":20,"defeatCount":72},{"id":184,"name":"Poles","winCount":33,"defeatCount":67},{"id":185,"name":"Bohemians","winCount":20,"defeatCount":93},{"id":195,"name":"Bengalis","winCount":34,"defeatCount":46},{"id":196,"name":"Dravidians","winCount":32,"defeatCount":62},{"id":197,"name":"Gurjaras","winCount":57,"defeatCount":50},{"id":202,"name":"Romans","winCount":26,"defeatCount":34},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":117775,"highScoreMilitary":64715,"highScoreEconomy":40266,"highScoreTechnology":16278,"unitsKilled":967603,"unitsLost":470266,"buildingsRaised":141259,"buildingsLost":14402,"wondersBuilt":19,"castlesBuilt":5084,"trebsBuilt":2396,"farmsBuilt":98055},"user":{"userId":"","profileId":6830736,"userName":"| Bifi | Theobald","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/ed5a918e467cfc880c61b6f65b48f4d75aae3231_full.jpg","elo":1411,"playerStanding":0.07,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	39	-1	9	8	105.5	\N
44	lelembut	3540345	70	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/f6a95a1b54962d97d331592d82689b22a644c330_full.jpg	Lelembut [LC] Cupu	1308	0	1244	{"mpStatList":{"totalMatches":67,"totalWins":33,"currentWinStreak":3},"careerStats":{"totalGames":3036,"totalWins":1431,"civilizations":[{"id":3,"name":"Britons","winCount":39,"defeatCount":162},{"id":4,"name":"Franks","winCount":56,"defeatCount":132},{"id":5,"name":"Goths","winCount":44,"defeatCount":148},{"id":6,"name":"Teutons","winCount":39,"defeatCount":120},{"id":7,"name":"Japanese","winCount":28,"defeatCount":117},{"id":8,"name":"Chinese","winCount":44,"defeatCount":143},{"id":9,"name":"Byzantines","winCount":43,"defeatCount":137},{"id":10,"name":"Persians","winCount":31,"defeatCount":145},{"id":11,"name":"Saracens","winCount":36,"defeatCount":138},{"id":12,"name":"Turks","winCount":34,"defeatCount":140},{"id":13,"name":"Vikings","winCount":34,"defeatCount":133},{"id":14,"name":"Mongols","winCount":30,"defeatCount":140},{"id":15,"name":"Celts","winCount":45,"defeatCount":122},{"id":16,"name":"Spanish","winCount":35,"defeatCount":132},{"id":17,"name":"Aztecs","winCount":38,"defeatCount":131},{"id":18,"name":"Mayans","winCount":31,"defeatCount":121},{"id":19,"name":"Huns","winCount":39,"defeatCount":133},{"id":20,"name":"Koreans","winCount":37,"defeatCount":109},{"id":21,"name":"Italians","winCount":34,"defeatCount":127},{"id":22,"name":"Hindustanis","winCount":36,"defeatCount":130},{"id":23,"name":"Incas","winCount":41,"defeatCount":116},{"id":24,"name":"Magyar","winCount":29,"defeatCount":134},{"id":25,"name":"Slavs","winCount":37,"defeatCount":102},{"id":26,"name":"Portuguese","winCount":31,"defeatCount":161},{"id":27,"name":"Ethiopians","winCount":22,"defeatCount":158},{"id":28,"name":"Malians","winCount":29,"defeatCount":108},{"id":29,"name":"Berbers","winCount":29,"defeatCount":129},{"id":30,"name":"Khmer","winCount":33,"defeatCount":130},{"id":31,"name":"Malay","winCount":26,"defeatCount":141},{"id":32,"name":"Burmese","winCount":38,"defeatCount":136},{"id":33,"name":"Vietnamese","winCount":33,"defeatCount":162},{"id":34,"name":"Bulgarians","winCount":35,"defeatCount":127},{"id":35,"name":"Tatars","winCount":32,"defeatCount":144},{"id":36,"name":"Cumans","winCount":55,"defeatCount":133},{"id":37,"name":"Lithuanians","winCount":29,"defeatCount":130},{"id":38,"name":"Random","winCount":1342,"defeatCount":1099},{"id":174,"name":"Burgundians","winCount":27,"defeatCount":78},{"id":175,"name":"Sicilians","winCount":23,"defeatCount":108},{"id":184,"name":"Poles","winCount":25,"defeatCount":72},{"id":185,"name":"Bohemians","winCount":19,"defeatCount":89},{"id":195,"name":"Bengalis","winCount":25,"defeatCount":54},{"id":196,"name":"Dravidians","winCount":15,"defeatCount":52},{"id":197,"name":"Gurjaras","winCount":39,"defeatCount":51},{"id":202,"name":"Romans","winCount":18,"defeatCount":8},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":45948,"highScoreMilitary":34177,"highScoreEconomy":11694,"highScoreTechnology":6004,"unitsKilled":384126,"unitsLost":466041,"buildingsRaised":50316,"buildingsLost":63606,"wondersBuilt":0,"castlesBuilt":6547,"trebsBuilt":5593,"farmsBuilt":198859},"user":{"userId":"","profileId":3540345,"userName":"Lelembut [LC] Cupu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/f6a95a1b54962d97d331592d82689b22a644c330_full.jpg","elo":1224,"playerStanding":0.22,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	114	-1	5	12	66.5	\N
25	Nukasep	2776978	75	2023-02-10 01:33:33	2024-11-27 14:53:26	1	https://avatars.steamstatic.com/4f333d8c5b198cd1b1cf877290c6e1529cca9453_full.jpg	[OmG] Nukasep	1368	1129	1275	{"mpStatList":{"totalMatches":174,"totalWins":95,"currentWinStreak":0},"careerStats":{"totalGames":1764,"totalWins":907,"civilizations":[{"id":3,"name":"Britons","winCount":23,"defeatCount":97},{"id":4,"name":"Franks","winCount":54,"defeatCount":92},{"id":5,"name":"Goths","winCount":29,"defeatCount":91},{"id":6,"name":"Teutons","winCount":31,"defeatCount":80},{"id":7,"name":"Japanese","winCount":24,"defeatCount":76},{"id":8,"name":"Chinese","winCount":12,"defeatCount":76},{"id":9,"name":"Byzantines","winCount":13,"defeatCount":68},{"id":10,"name":"Persians","winCount":26,"defeatCount":64},{"id":11,"name":"Saracens","winCount":19,"defeatCount":76},{"id":12,"name":"Turks","winCount":17,"defeatCount":51},{"id":13,"name":"Vikings","winCount":18,"defeatCount":55},{"id":14,"name":"Mongols","winCount":34,"defeatCount":92},{"id":15,"name":"Celts","winCount":23,"defeatCount":54},{"id":16,"name":"Spanish","winCount":22,"defeatCount":82},{"id":17,"name":"Aztecs","winCount":21,"defeatCount":75},{"id":18,"name":"Mayans","winCount":23,"defeatCount":83},{"id":19,"name":"Huns","winCount":43,"defeatCount":89},{"id":20,"name":"Koreans","winCount":24,"defeatCount":57},{"id":21,"name":"Italians","winCount":24,"defeatCount":63},{"id":22,"name":"Hindustanis","winCount":16,"defeatCount":56},{"id":23,"name":"Incas","winCount":15,"defeatCount":49},{"id":24,"name":"Magyar","winCount":69,"defeatCount":78},{"id":25,"name":"Slavs","winCount":17,"defeatCount":74},{"id":26,"name":"Portuguese","winCount":17,"defeatCount":59},{"id":27,"name":"Ethiopians","winCount":11,"defeatCount":80},{"id":28,"name":"Malians","winCount":17,"defeatCount":57},{"id":29,"name":"Berbers","winCount":18,"defeatCount":64},{"id":30,"name":"Khmer","winCount":22,"defeatCount":67},{"id":31,"name":"Malay","winCount":25,"defeatCount":55},{"id":32,"name":"Burmese","winCount":24,"defeatCount":58},{"id":33,"name":"Vietnamese","winCount":35,"defeatCount":75},{"id":34,"name":"Bulgarians","winCount":18,"defeatCount":56},{"id":35,"name":"Tatars","winCount":21,"defeatCount":63},{"id":36,"name":"Cumans","winCount":35,"defeatCount":73},{"id":37,"name":"Lithuanians","winCount":12,"defeatCount":78},{"id":38,"name":"Random","winCount":580,"defeatCount":677},{"id":174,"name":"Burgundians","winCount":11,"defeatCount":29},{"id":175,"name":"Sicilians","winCount":8,"defeatCount":38},{"id":184,"name":"Poles","winCount":8,"defeatCount":28},{"id":185,"name":"Bohemians","winCount":5,"defeatCount":30},{"id":195,"name":"Bengalis","winCount":10,"defeatCount":23},{"id":196,"name":"Dravidians","winCount":5,"defeatCount":20},{"id":197,"name":"Gurjaras","winCount":9,"defeatCount":29},{"id":202,"name":"Romans","winCount":9,"defeatCount":4},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64876,"highScoreMilitary":47450,"highScoreEconomy":20903,"highScoreTechnology":9376,"unitsKilled":337915,"unitsLost":291777,"buildingsRaised":45786,"buildingsLost":37638,"wondersBuilt":0,"castlesBuilt":3024,"trebsBuilt":2784,"farmsBuilt":111052},"user":{"userId":"","profileId":2776978,"userName":"[OmG] Nukasep","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/4f333d8c5b198cd1b1cf877290c6e1529cca9453_full.jpg","elo":1234,"playerStanding":0.21,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	30	5	6	11	72.5	\N
53	UwakJojo	6269989	50	2023-02-10 01:33:33	2024-11-27 14:53:33	1	https://avatars.steamstatic.com/036042ac6e76f4c40b59c28d5d3e57ea08d51d42_full.jpg	UwakJojo Cupu	1242	0	872	{"mpStatList":{"totalMatches":1186,"totalWins":579,"currentWinStreak":0},"careerStats":{"totalGames":2242,"totalWins":1034,"civilizations":[{"id":3,"name":"Britons","winCount":37,"defeatCount":191},{"id":4,"name":"Franks","winCount":26,"defeatCount":277},{"id":5,"name":"Goths","winCount":159,"defeatCount":182},{"id":6,"name":"Teutons","winCount":28,"defeatCount":147},{"id":7,"name":"Japanese","winCount":32,"defeatCount":90},{"id":8,"name":"Chinese","winCount":55,"defeatCount":90},{"id":9,"name":"Byzantines","winCount":51,"defeatCount":170},{"id":10,"name":"Persians","winCount":13,"defeatCount":136},{"id":11,"name":"Saracens","winCount":17,"defeatCount":101},{"id":12,"name":"Turks","winCount":17,"defeatCount":115},{"id":13,"name":"Vikings","winCount":27,"defeatCount":63},{"id":14,"name":"Mongols","winCount":25,"defeatCount":156},{"id":15,"name":"Celts","winCount":22,"defeatCount":92},{"id":16,"name":"Spanish","winCount":40,"defeatCount":164},{"id":17,"name":"Aztecs","winCount":16,"defeatCount":61},{"id":18,"name":"Mayans","winCount":10,"defeatCount":80},{"id":19,"name":"Huns","winCount":20,"defeatCount":118},{"id":20,"name":"Koreans","winCount":17,"defeatCount":61},{"id":21,"name":"Italians","winCount":38,"defeatCount":129},{"id":22,"name":"Hindustanis","winCount":19,"defeatCount":94},{"id":23,"name":"Incas","winCount":25,"defeatCount":85},{"id":24,"name":"Magyar","winCount":40,"defeatCount":94},{"id":25,"name":"Slavs","winCount":63,"defeatCount":101},{"id":26,"name":"Portuguese","winCount":24,"defeatCount":91},{"id":27,"name":"Ethiopians","winCount":41,"defeatCount":113},{"id":28,"name":"Malians","winCount":27,"defeatCount":50},{"id":29,"name":"Berbers","winCount":30,"defeatCount":66},{"id":30,"name":"Khmer","winCount":22,"defeatCount":145},{"id":31,"name":"Malay","winCount":48,"defeatCount":81},{"id":32,"name":"Burmese","winCount":13,"defeatCount":52},{"id":33,"name":"Vietnamese","winCount":33,"defeatCount":80},{"id":34,"name":"Bulgarians","winCount":19,"defeatCount":65},{"id":35,"name":"Tatars","winCount":19,"defeatCount":52},{"id":36,"name":"Cumans","winCount":24,"defeatCount":87},{"id":37,"name":"Lithuanians","winCount":83,"defeatCount":93},{"id":38,"name":"Random","winCount":407,"defeatCount":5},{"id":174,"name":"Burgundians","winCount":9,"defeatCount":93},{"id":175,"name":"Sicilians","winCount":2,"defeatCount":51},{"id":184,"name":"Poles","winCount":0,"defeatCount":67},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":70},{"id":195,"name":"Bengalis","winCount":1,"defeatCount":31},{"id":196,"name":"Dravidians","winCount":6,"defeatCount":33},{"id":197,"name":"Gurjaras","winCount":14,"defeatCount":57},{"id":202,"name":"Romans","winCount":0,"defeatCount":19},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":83779,"highScoreMilitary":47149,"highScoreEconomy":24250,"highScoreTechnology":11730,"unitsKilled":318829,"unitsLost":299237,"buildingsRaised":41453,"buildingsLost":21445,"wondersBuilt":24,"castlesBuilt":7429,"trebsBuilt":4914,"farmsBuilt":144200},"user":{"userId":"","profileId":6269989,"userName":"UwakJojo Cupu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/036042ac6e76f4c40b59c28d5d3e57ea08d51d42_full.jpg","elo":958,"playerStanding":0.61,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	16	-1	5	6	49.5	\N
4	pianiskadabra	19579387	70	\N	2024-11-27 14:53:24	1	https://avatars.steamstatic.com/8db57c4cf448fd7a84852af081b18ac2e2ae6e61_full.jpg	[xbow] pianiskadabra	1292	1194	1298	{"mpStatList":{"totalMatches":26,"totalWins":14,"currentWinStreak":1},"careerStats":{"totalGames":391,"totalWins":204,"civilizations":[{"id":3,"name":"Britons","winCount":4,"defeatCount":22},{"id":4,"name":"Franks","winCount":16,"defeatCount":24},{"id":5,"name":"Goths","winCount":4,"defeatCount":10},{"id":6,"name":"Teutons","winCount":7,"defeatCount":16},{"id":7,"name":"Japanese","winCount":4,"defeatCount":14},{"id":8,"name":"Chinese","winCount":3,"defeatCount":17},{"id":9,"name":"Byzantines","winCount":5,"defeatCount":18},{"id":10,"name":"Persians","winCount":17,"defeatCount":31},{"id":11,"name":"Saracens","winCount":0,"defeatCount":20},{"id":12,"name":"Turks","winCount":14,"defeatCount":15},{"id":13,"name":"Vikings","winCount":8,"defeatCount":20},{"id":14,"name":"Mongols","winCount":21,"defeatCount":31},{"id":15,"name":"Celts","winCount":10,"defeatCount":7},{"id":16,"name":"Spanish","winCount":9,"defeatCount":17},{"id":17,"name":"Aztecs","winCount":8,"defeatCount":12},{"id":18,"name":"Mayans","winCount":14,"defeatCount":23},{"id":19,"name":"Huns","winCount":10,"defeatCount":18},{"id":20,"name":"Koreans","winCount":2,"defeatCount":15},{"id":21,"name":"Italians","winCount":10,"defeatCount":25},{"id":22,"name":"Hindustanis","winCount":10,"defeatCount":24},{"id":23,"name":"Incas","winCount":6,"defeatCount":16},{"id":24,"name":"Magyar","winCount":14,"defeatCount":16},{"id":25,"name":"Slavs","winCount":6,"defeatCount":8},{"id":26,"name":"Portuguese","winCount":5,"defeatCount":22},{"id":27,"name":"Ethiopians","winCount":6,"defeatCount":28},{"id":28,"name":"Malians","winCount":6,"defeatCount":19},{"id":29,"name":"Berbers","winCount":4,"defeatCount":15},{"id":30,"name":"Khmer","winCount":11,"defeatCount":25},{"id":31,"name":"Malay","winCount":3,"defeatCount":12},{"id":32,"name":"Burmese","winCount":3,"defeatCount":9},{"id":33,"name":"Vietnamese","winCount":5,"defeatCount":19},{"id":34,"name":"Bulgarians","winCount":3,"defeatCount":14},{"id":35,"name":"Tatars","winCount":4,"defeatCount":13},{"id":36,"name":"Cumans","winCount":9,"defeatCount":17},{"id":37,"name":"Lithuanians","winCount":8,"defeatCount":14},{"id":38,"name":"Random","winCount":93,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":15},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":12},{"id":184,"name":"Poles","winCount":0,"defeatCount":5},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":15},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":12},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":5},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":7},{"id":202,"name":"Romans","winCount":0,"defeatCount":6},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":50840,"highScoreMilitary":59135,"highScoreEconomy":22663,"highScoreTechnology":8636,"unitsKilled":77453,"unitsLost":71510,"buildingsRaised":6109,"buildingsLost":4805,"wondersBuilt":0,"castlesBuilt":629,"trebsBuilt":329,"farmsBuilt":1168},"user":{"userId":"","profileId":19579387,"userName":"[xbow] pianiskadabra","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/8db57c4cf448fd7a84852af081b18ac2e2ae6e61_full.jpg","elo":1178,"playerStanding":0.28,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	29	-2	7	10	68.5	\N
16	zhOMbhie	5556319	80	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/044504f2bba8ad71692e8cbf02f1d189ebaeed65_full.jpg	[Datuk] Cupu	1367	1130	1323	{"mpStatList":{"totalMatches":519,"totalWins":273,"currentWinStreak":0},"careerStats":{"totalGames":2426,"totalWins":1205,"civilizations":[{"id":3,"name":"Britons","winCount":29,"defeatCount":122},{"id":4,"name":"Franks","winCount":101,"defeatCount":142},{"id":5,"name":"Goths","winCount":54,"defeatCount":86},{"id":6,"name":"Teutons","winCount":33,"defeatCount":106},{"id":7,"name":"Japanese","winCount":16,"defeatCount":107},{"id":8,"name":"Chinese","winCount":16,"defeatCount":91},{"id":9,"name":"Byzantines","winCount":24,"defeatCount":102},{"id":10,"name":"Persians","winCount":48,"defeatCount":123},{"id":11,"name":"Saracens","winCount":22,"defeatCount":95},{"id":12,"name":"Turks","winCount":25,"defeatCount":102},{"id":13,"name":"Vikings","winCount":27,"defeatCount":105},{"id":14,"name":"Mongols","winCount":25,"defeatCount":166},{"id":15,"name":"Celts","winCount":23,"defeatCount":75},{"id":16,"name":"Spanish","winCount":47,"defeatCount":127},{"id":17,"name":"Aztecs","winCount":27,"defeatCount":89},{"id":18,"name":"Mayans","winCount":26,"defeatCount":95},{"id":19,"name":"Huns","winCount":26,"defeatCount":103},{"id":20,"name":"Koreans","winCount":29,"defeatCount":97},{"id":21,"name":"Italians","winCount":47,"defeatCount":108},{"id":22,"name":"Hindustanis","winCount":26,"defeatCount":102},{"id":23,"name":"Incas","winCount":10,"defeatCount":86},{"id":24,"name":"Magyar","winCount":33,"defeatCount":105},{"id":25,"name":"Slavs","winCount":24,"defeatCount":87},{"id":26,"name":"Portuguese","winCount":24,"defeatCount":120},{"id":27,"name":"Ethiopians","winCount":22,"defeatCount":108},{"id":28,"name":"Malians","winCount":31,"defeatCount":107},{"id":29,"name":"Berbers","winCount":25,"defeatCount":104},{"id":30,"name":"Khmer","winCount":34,"defeatCount":100},{"id":31,"name":"Malay","winCount":25,"defeatCount":99},{"id":32,"name":"Burmese","winCount":21,"defeatCount":80},{"id":33,"name":"Vietnamese","winCount":20,"defeatCount":103},{"id":34,"name":"Bulgarians","winCount":25,"defeatCount":89},{"id":35,"name":"Tatars","winCount":14,"defeatCount":98},{"id":36,"name":"Cumans","winCount":40,"defeatCount":109},{"id":37,"name":"Lithuanians","winCount":43,"defeatCount":79},{"id":38,"name":"Random","winCount":829,"defeatCount":129},{"id":174,"name":"Burgundians","winCount":48,"defeatCount":70},{"id":175,"name":"Sicilians","winCount":19,"defeatCount":74},{"id":184,"name":"Poles","winCount":22,"defeatCount":73},{"id":185,"name":"Bohemians","winCount":18,"defeatCount":57},{"id":195,"name":"Bengalis","winCount":15,"defeatCount":29},{"id":196,"name":"Dravidians","winCount":21,"defeatCount":41},{"id":197,"name":"Gurjaras","winCount":25,"defeatCount":39},{"id":202,"name":"Romans","winCount":3,"defeatCount":13},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":43833,"highScoreMilitary":31323,"highScoreEconomy":16316,"highScoreTechnology":5786,"unitsKilled":305314,"unitsLost":313025,"buildingsRaised":43667,"buildingsLost":35386,"wondersBuilt":0,"castlesBuilt":6625,"trebsBuilt":4695,"farmsBuilt":130239},"user":{"userId":"","profileId":5556319,"userName":"[Datuk] Cupu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/044504f2bba8ad71692e8cbf02f1d189ebaeed65_full.jpg","elo":1259,"playerStanding":0.19,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	60	1	7	10	78.5	\N
56	BebanNegara	11895655	35	2023-02-10 01:33:33	2024-11-27 14:53:48	1	https://avatars.steamstatic.com/cb8f9a9b83c9593975cb09af549bf19cb1681ef7_full.jpg	BebanNegara	1353	0	0	{"mpStatList":{"totalMatches":10,"totalWins":4,"currentWinStreak":1},"careerStats":{"totalGames":195,"totalWins":82,"civilizations":[{"id":3,"name":"Britons","winCount":5,"defeatCount":17},{"id":4,"name":"Franks","winCount":0,"defeatCount":18},{"id":5,"name":"Goths","winCount":2,"defeatCount":11},{"id":6,"name":"Teutons","winCount":1,"defeatCount":8},{"id":7,"name":"Japanese","winCount":6,"defeatCount":7},{"id":8,"name":"Chinese","winCount":0,"defeatCount":10},{"id":9,"name":"Byzantines","winCount":5,"defeatCount":4},{"id":10,"name":"Persians","winCount":3,"defeatCount":14},{"id":11,"name":"Saracens","winCount":0,"defeatCount":5},{"id":12,"name":"Turks","winCount":0,"defeatCount":16},{"id":13,"name":"Vikings","winCount":1,"defeatCount":5},{"id":14,"name":"Mongols","winCount":2,"defeatCount":13},{"id":15,"name":"Celts","winCount":1,"defeatCount":8},{"id":16,"name":"Spanish","winCount":2,"defeatCount":12},{"id":17,"name":"Aztecs","winCount":1,"defeatCount":4},{"id":18,"name":"Mayans","winCount":1,"defeatCount":5},{"id":19,"name":"Huns","winCount":1,"defeatCount":13},{"id":20,"name":"Koreans","winCount":2,"defeatCount":7},{"id":21,"name":"Italians","winCount":0,"defeatCount":4},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":7},{"id":23,"name":"Incas","winCount":0,"defeatCount":3},{"id":24,"name":"Magyar","winCount":1,"defeatCount":10},{"id":25,"name":"Slavs","winCount":3,"defeatCount":6},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":4},{"id":27,"name":"Ethiopians","winCount":1,"defeatCount":10},{"id":28,"name":"Malians","winCount":0,"defeatCount":5},{"id":29,"name":"Berbers","winCount":2,"defeatCount":8},{"id":30,"name":"Khmer","winCount":0,"defeatCount":14},{"id":31,"name":"Malay","winCount":3,"defeatCount":3},{"id":32,"name":"Burmese","winCount":9,"defeatCount":5},{"id":33,"name":"Vietnamese","winCount":4,"defeatCount":8},{"id":34,"name":"Bulgarians","winCount":4,"defeatCount":7},{"id":35,"name":"Tatars","winCount":0,"defeatCount":4},{"id":36,"name":"Cumans","winCount":2,"defeatCount":7},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":6},{"id":38,"name":"Random","winCount":10,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":2,"defeatCount":7},{"id":175,"name":"Sicilians","winCount":2,"defeatCount":3},{"id":184,"name":"Poles","winCount":6,"defeatCount":9},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":7},{"id":195,"name":"Bengalis","winCount":2,"defeatCount":2},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":4},{"id":197,"name":"Gurjaras","winCount":5,"defeatCount":9},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":55151,"highScoreMilitary":36481,"highScoreEconomy":17914,"highScoreTechnology":13649,"unitsKilled":30482,"unitsLost":25776,"buildingsRaised":3115,"buildingsLost":1424,"wondersBuilt":0,"castlesBuilt":426,"trebsBuilt":412,"farmsBuilt":13103},"user":{"userId":"","profileId":11895655,"userName":"BebanNegara","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/cb8f9a9b83c9593975cb09af549bf19cb1681ef7_full.jpg","elo":1058,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	2	-1	3	1	36	\N
18170643	Abay Jampang	4367953	70	2024-10-15 03:27:34	2024-11-27 14:53:55	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	Abay-Jampang	1995	0	0	{"mpStatList":{"totalMatches":38,"totalWins":21,"currentWinStreak":2},"careerStats":{"totalGames":204,"totalWins":118,"civilizations":[{"id":3,"name":"Britons","winCount":7,"defeatCount":13},{"id":4,"name":"Franks","winCount":24,"defeatCount":20},{"id":5,"name":"Goths","winCount":9,"defeatCount":15},{"id":6,"name":"Teutons","winCount":2,"defeatCount":16},{"id":7,"name":"Japanese","winCount":6,"defeatCount":18},{"id":8,"name":"Chinese","winCount":3,"defeatCount":15},{"id":9,"name":"Byzantines","winCount":7,"defeatCount":9},{"id":10,"name":"Persians","winCount":6,"defeatCount":8},{"id":11,"name":"Saracens","winCount":5,"defeatCount":16},{"id":12,"name":"Turks","winCount":2,"defeatCount":16},{"id":13,"name":"Vikings","winCount":7,"defeatCount":14},{"id":14,"name":"Mongols","winCount":13,"defeatCount":15},{"id":15,"name":"Celts","winCount":6,"defeatCount":13},{"id":16,"name":"Spanish","winCount":5,"defeatCount":18},{"id":17,"name":"Aztecs","winCount":5,"defeatCount":17},{"id":18,"name":"Mayans","winCount":7,"defeatCount":22},{"id":19,"name":"Huns","winCount":11,"defeatCount":14},{"id":20,"name":"Koreans","winCount":6,"defeatCount":8},{"id":21,"name":"Italians","winCount":4,"defeatCount":10},{"id":22,"name":"Hindustanis","winCount":3,"defeatCount":13},{"id":23,"name":"Incas","winCount":1,"defeatCount":14},{"id":24,"name":"Magyar","winCount":5,"defeatCount":12},{"id":25,"name":"Slavs","winCount":2,"defeatCount":14},{"id":26,"name":"Portuguese","winCount":5,"defeatCount":17},{"id":27,"name":"Ethiopians","winCount":9,"defeatCount":16},{"id":28,"name":"Malians","winCount":9,"defeatCount":17},{"id":29,"name":"Berbers","winCount":4,"defeatCount":14},{"id":30,"name":"Khmer","winCount":15,"defeatCount":14},{"id":31,"name":"Malay","winCount":3,"defeatCount":10},{"id":32,"name":"Burmese","winCount":5,"defeatCount":15},{"id":33,"name":"Vietnamese","winCount":5,"defeatCount":9},{"id":34,"name":"Bulgarians","winCount":3,"defeatCount":10},{"id":35,"name":"Tatars","winCount":5,"defeatCount":13},{"id":36,"name":"Cumans","winCount":7,"defeatCount":14},{"id":37,"name":"Lithuanians","winCount":6,"defeatCount":15},{"id":38,"name":"Random","winCount":138,"defeatCount":352},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":9},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":8},{"id":184,"name":"Poles","winCount":0,"defeatCount":3},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":1},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":1,"defeatCount":0},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":36464,"highScoreMilitary":22381,"highScoreEconomy":11568,"highScoreTechnology":6121,"unitsKilled":57164,"unitsLost":37618,"buildingsRaised":5869,"buildingsLost":3476,"wondersBuilt":0,"castlesBuilt":589,"trebsBuilt":263,"farmsBuilt":26124},"user":{"userId":"","profileId":4367953,"userName":"Abay-Jampang","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1202,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	3	1	0	0	0	\N
18170642	Rieyuuk	20031688	50	2024-10-09 01:40:05	2024-11-27 14:54:02	1	https://avatars.steamstatic.com/61fa1bc9f1dc8b9b8696d2524e9d8878cc98ec56_full.jpg	Rieyuuuk	0	670	1135	{"mpStatList":{"totalMatches":651,"totalWins":294,"currentWinStreak":0},"careerStats":{"totalGames":640,"totalWins":290,"civilizations":[{"id":3,"name":"Britons","winCount":13,"defeatCount":43},{"id":4,"name":"Franks","winCount":14,"defeatCount":65},{"id":5,"name":"Goths","winCount":13,"defeatCount":43},{"id":6,"name":"Teutons","winCount":18,"defeatCount":52},{"id":7,"name":"Japanese","winCount":6,"defeatCount":29},{"id":8,"name":"Chinese","winCount":2,"defeatCount":18},{"id":9,"name":"Byzantines","winCount":9,"defeatCount":36},{"id":10,"name":"Persians","winCount":14,"defeatCount":56},{"id":11,"name":"Saracens","winCount":9,"defeatCount":21},{"id":12,"name":"Turks","winCount":27,"defeatCount":40},{"id":13,"name":"Vikings","winCount":2,"defeatCount":24},{"id":14,"name":"Mongols","winCount":9,"defeatCount":58},{"id":15,"name":"Celts","winCount":30,"defeatCount":29},{"id":16,"name":"Spanish","winCount":15,"defeatCount":39},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":10},{"id":18,"name":"Mayans","winCount":0,"defeatCount":16},{"id":19,"name":"Huns","winCount":11,"defeatCount":39},{"id":20,"name":"Koreans","winCount":5,"defeatCount":12},{"id":21,"name":"Italians","winCount":11,"defeatCount":31},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":31},{"id":23,"name":"Incas","winCount":2,"defeatCount":15},{"id":24,"name":"Magyar","winCount":15,"defeatCount":21},{"id":25,"name":"Slavs","winCount":7,"defeatCount":19},{"id":26,"name":"Portuguese","winCount":7,"defeatCount":29},{"id":27,"name":"Ethiopians","winCount":8,"defeatCount":24},{"id":28,"name":"Malians","winCount":2,"defeatCount":12},{"id":29,"name":"Berbers","winCount":0,"defeatCount":9},{"id":30,"name":"Khmer","winCount":10,"defeatCount":48},{"id":31,"name":"Malay","winCount":14,"defeatCount":13},{"id":32,"name":"Burmese","winCount":0,"defeatCount":11},{"id":33,"name":"Vietnamese","winCount":6,"defeatCount":25},{"id":34,"name":"Bulgarians","winCount":12,"defeatCount":15},{"id":35,"name":"Tatars","winCount":2,"defeatCount":11},{"id":36,"name":"Cumans","winCount":3,"defeatCount":30},{"id":37,"name":"Lithuanians","winCount":10,"defeatCount":20},{"id":38,"name":"Random","winCount":3,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":6,"defeatCount":17},{"id":175,"name":"Sicilians","winCount":3,"defeatCount":1},{"id":184,"name":"Poles","winCount":12,"defeatCount":21},{"id":185,"name":"Bohemians","winCount":2,"defeatCount":30},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":9},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":8},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":13},{"id":202,"name":"Romans","winCount":4,"defeatCount":25},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":41583,"highScoreMilitary":26618,"highScoreEconomy":16990,"highScoreTechnology":6749,"unitsKilled":69557,"unitsLost":88296,"buildingsRaised":7463,"buildingsLost":10176,"wondersBuilt":0,"castlesBuilt":1383,"trebsBuilt":346,"farmsBuilt":1211},"user":{"userId":"","profileId":20031688,"userName":"Rieyuuuk","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/61fa1bc9f1dc8b9b8696d2524e9d8878cc98ec56_full.jpg","elo":1152,"playerStanding":0.32,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-1	0	0	0	\N
50	DUNGDE	2696529	60	2023-02-10 01:33:33	2024-11-27 14:54:14	1	https://avatars.steamstatic.com/798b7d41c769468a7613ea566e25b5c920dacf84_full.jpg	| BiFi | DUNGDE	1340	0	993	{"mpStatList":{"totalMatches":2629,"totalWins":1303,"currentWinStreak":0},"careerStats":{"totalGames":3621,"totalWins":1761,"civilizations":[{"id":3,"name":"Britons","winCount":21,"defeatCount":319},{"id":4,"name":"Franks","winCount":69,"defeatCount":448},{"id":5,"name":"Goths","winCount":28,"defeatCount":331},{"id":6,"name":"Teutons","winCount":25,"defeatCount":227},{"id":7,"name":"Japanese","winCount":25,"defeatCount":171},{"id":8,"name":"Chinese","winCount":19,"defeatCount":177},{"id":9,"name":"Byzantines","winCount":25,"defeatCount":229},{"id":10,"name":"Persians","winCount":28,"defeatCount":197},{"id":11,"name":"Saracens","winCount":27,"defeatCount":188},{"id":12,"name":"Turks","winCount":67,"defeatCount":221},{"id":13,"name":"Vikings","winCount":34,"defeatCount":202},{"id":14,"name":"Mongols","winCount":42,"defeatCount":310},{"id":15,"name":"Celts","winCount":25,"defeatCount":192},{"id":16,"name":"Spanish","winCount":26,"defeatCount":290},{"id":17,"name":"Aztecs","winCount":25,"defeatCount":159},{"id":18,"name":"Mayans","winCount":24,"defeatCount":229},{"id":19,"name":"Huns","winCount":31,"defeatCount":230},{"id":20,"name":"Koreans","winCount":25,"defeatCount":142},{"id":21,"name":"Italians","winCount":38,"defeatCount":199},{"id":22,"name":"Hindustanis","winCount":327,"defeatCount":210},{"id":23,"name":"Incas","winCount":20,"defeatCount":142},{"id":24,"name":"Magyar","winCount":23,"defeatCount":206},{"id":25,"name":"Slavs","winCount":28,"defeatCount":134},{"id":26,"name":"Portuguese","winCount":23,"defeatCount":179},{"id":27,"name":"Ethiopians","winCount":28,"defeatCount":239},{"id":28,"name":"Malians","winCount":24,"defeatCount":135},{"id":29,"name":"Berbers","winCount":27,"defeatCount":156},{"id":30,"name":"Khmer","winCount":16,"defeatCount":225},{"id":31,"name":"Malay","winCount":27,"defeatCount":132},{"id":32,"name":"Burmese","winCount":25,"defeatCount":107},{"id":33,"name":"Vietnamese","winCount":27,"defeatCount":170},{"id":34,"name":"Bulgarians","winCount":28,"defeatCount":144},{"id":35,"name":"Tatars","winCount":18,"defeatCount":120},{"id":36,"name":"Cumans","winCount":29,"defeatCount":187},{"id":37,"name":"Lithuanians","winCount":34,"defeatCount":214},{"id":38,"name":"Random","winCount":808,"defeatCount":251},{"id":174,"name":"Burgundians","winCount":560,"defeatCount":159},{"id":175,"name":"Sicilians","winCount":23,"defeatCount":139},{"id":184,"name":"Poles","winCount":168,"defeatCount":171},{"id":185,"name":"Bohemians","winCount":61,"defeatCount":176},{"id":195,"name":"Bengalis","winCount":24,"defeatCount":92},{"id":196,"name":"Dravidians","winCount":20,"defeatCount":74},{"id":197,"name":"Gurjaras","winCount":38,"defeatCount":95},{"id":202,"name":"Romans","winCount":0,"defeatCount":11},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":116003,"highScoreMilitary":59448,"highScoreEconomy":17108,"highScoreTechnology":7908,"unitsKilled":772510,"unitsLost":499083,"buildingsRaised":94647,"buildingsLost":64436,"wondersBuilt":8,"castlesBuilt":10689,"trebsBuilt":9080,"farmsBuilt":286227},"user":{"userId":"","profileId":2696529,"userName":"| BiFi | DUNGDE","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/798b7d41c769468a7613ea566e25b5c920dacf84_full.jpg","elo":1010,"playerStanding":0.53,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	14	1	7	10	58.5	\N
35	_ShiFu_	2682333	60	2023-02-24 07:24:01	2024-11-27 14:54:20	1	https://avatars.steamstatic.com/e5060a6671b5cb8446895b089de5a7d4e1a9f755_full.jpg	_ShiFu_	0	0	0	{"mpStatList":{"totalMatches":414,"totalWins":188,"currentWinStreak":0},"careerStats":{"totalGames":2510,"totalWins":1362,"civilizations":[{"id":3,"name":"Britons","winCount":33,"defeatCount":120},{"id":4,"name":"Franks","winCount":260,"defeatCount":250},{"id":5,"name":"Goths","winCount":103,"defeatCount":120},{"id":6,"name":"Teutons","winCount":6,"defeatCount":95},{"id":7,"name":"Japanese","winCount":0,"defeatCount":52},{"id":8,"name":"Chinese","winCount":5,"defeatCount":65},{"id":9,"name":"Byzantines","winCount":1,"defeatCount":73},{"id":10,"name":"Persians","winCount":24,"defeatCount":106},{"id":11,"name":"Saracens","winCount":9,"defeatCount":56},{"id":12,"name":"Turks","winCount":8,"defeatCount":62},{"id":13,"name":"Vikings","winCount":2,"defeatCount":54},{"id":14,"name":"Mongols","winCount":252,"defeatCount":150},{"id":15,"name":"Celts","winCount":12,"defeatCount":124},{"id":16,"name":"Spanish","winCount":2,"defeatCount":93},{"id":17,"name":"Aztecs","winCount":6,"defeatCount":41},{"id":18,"name":"Mayans","winCount":31,"defeatCount":72},{"id":19,"name":"Huns","winCount":279,"defeatCount":162},{"id":20,"name":"Koreans","winCount":9,"defeatCount":54},{"id":21,"name":"Italians","winCount":3,"defeatCount":34},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":56},{"id":23,"name":"Incas","winCount":1,"defeatCount":36},{"id":24,"name":"Magyar","winCount":53,"defeatCount":68},{"id":25,"name":"Slavs","winCount":96,"defeatCount":78},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":49},{"id":27,"name":"Ethiopians","winCount":16,"defeatCount":58},{"id":28,"name":"Malians","winCount":4,"defeatCount":37},{"id":29,"name":"Berbers","winCount":2,"defeatCount":33},{"id":30,"name":"Khmer","winCount":31,"defeatCount":119},{"id":31,"name":"Malay","winCount":1,"defeatCount":26},{"id":32,"name":"Burmese","winCount":4,"defeatCount":21},{"id":33,"name":"Vietnamese","winCount":8,"defeatCount":40},{"id":34,"name":"Bulgarians","winCount":0,"defeatCount":40},{"id":35,"name":"Tatars","winCount":6,"defeatCount":34},{"id":36,"name":"Cumans","winCount":56,"defeatCount":54},{"id":37,"name":"Lithuanians","winCount":1,"defeatCount":62},{"id":38,"name":"Random","winCount":57,"defeatCount":163},{"id":174,"name":"Burgundians","winCount":9,"defeatCount":39},{"id":175,"name":"Sicilians","winCount":1,"defeatCount":14},{"id":184,"name":"Poles","winCount":8,"defeatCount":37},{"id":185,"name":"Bohemians","winCount":1,"defeatCount":35},{"id":195,"name":"Bengalis","winCount":2,"defeatCount":3},{"id":196,"name":"Dravidians","winCount":1,"defeatCount":4},{"id":197,"name":"Gurjaras","winCount":9,"defeatCount":9},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":141395,"highScoreMilitary":61475,"highScoreEconomy":39980,"highScoreTechnology":8346,"unitsKilled":673755,"unitsLost":651321,"buildingsRaised":48404,"buildingsLost":19822,"wondersBuilt":3,"castlesBuilt":9847,"trebsBuilt":7770,"farmsBuilt":136494},"user":{"userId":"","profileId":2682333,"userName":"_ShiFu_","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/e5060a6671b5cb8446895b089de5a7d4e1a9f755_full.jpg","elo":1035,"playerStanding":0.48,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-1	0	1	59.5	\N
36	Hakuna Matata	2793927	65	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/148ff422f2245ab66abfeabf3f7506861d6b703b_full.jpg	[OmG] Imperial Noob	1191	1079	1194	{"mpStatList":{"totalMatches":245,"totalWins":125,"currentWinStreak":0},"careerStats":{"totalGames":1845,"totalWins":888,"civilizations":[{"id":3,"name":"Britons","winCount":30,"defeatCount":122},{"id":4,"name":"Franks","winCount":45,"defeatCount":139},{"id":5,"name":"Goths","winCount":70,"defeatCount":117},{"id":6,"name":"Teutons","winCount":22,"defeatCount":92},{"id":7,"name":"Japanese","winCount":37,"defeatCount":89},{"id":8,"name":"Chinese","winCount":12,"defeatCount":61},{"id":9,"name":"Byzantines","winCount":20,"defeatCount":74},{"id":10,"name":"Persians","winCount":14,"defeatCount":128},{"id":11,"name":"Saracens","winCount":11,"defeatCount":66},{"id":12,"name":"Turks","winCount":12,"defeatCount":81},{"id":13,"name":"Vikings","winCount":27,"defeatCount":63},{"id":14,"name":"Mongols","winCount":49,"defeatCount":127},{"id":15,"name":"Celts","winCount":21,"defeatCount":76},{"id":16,"name":"Spanish","winCount":24,"defeatCount":100},{"id":17,"name":"Aztecs","winCount":22,"defeatCount":59},{"id":18,"name":"Mayans","winCount":17,"defeatCount":101},{"id":19,"name":"Huns","winCount":27,"defeatCount":127},{"id":20,"name":"Koreans","winCount":12,"defeatCount":71},{"id":21,"name":"Italians","winCount":19,"defeatCount":58},{"id":22,"name":"Hindustanis","winCount":26,"defeatCount":78},{"id":23,"name":"Incas","winCount":15,"defeatCount":46},{"id":24,"name":"Magyar","winCount":35,"defeatCount":76},{"id":25,"name":"Slavs","winCount":36,"defeatCount":58},{"id":26,"name":"Portuguese","winCount":18,"defeatCount":79},{"id":27,"name":"Ethiopians","winCount":9,"defeatCount":68},{"id":28,"name":"Malians","winCount":21,"defeatCount":57},{"id":29,"name":"Berbers","winCount":19,"defeatCount":69},{"id":30,"name":"Khmer","winCount":22,"defeatCount":90},{"id":31,"name":"Malay","winCount":34,"defeatCount":69},{"id":32,"name":"Burmese","winCount":19,"defeatCount":61},{"id":33,"name":"Vietnamese","winCount":14,"defeatCount":86},{"id":34,"name":"Bulgarians","winCount":15,"defeatCount":62},{"id":35,"name":"Tatars","winCount":23,"defeatCount":62},{"id":36,"name":"Cumans","winCount":18,"defeatCount":82},{"id":37,"name":"Lithuanians","winCount":29,"defeatCount":80},{"id":38,"name":"Random","winCount":460,"defeatCount":525},{"id":174,"name":"Burgundians","winCount":19,"defeatCount":40},{"id":175,"name":"Sicilians","winCount":11,"defeatCount":34},{"id":184,"name":"Poles","winCount":16,"defeatCount":30},{"id":185,"name":"Bohemians","winCount":13,"defeatCount":52},{"id":195,"name":"Bengalis","winCount":7,"defeatCount":21},{"id":196,"name":"Dravidians","winCount":10,"defeatCount":16},{"id":197,"name":"Gurjaras","winCount":4,"defeatCount":25},{"id":202,"name":"Romans","winCount":6,"defeatCount":17},{"id":204,"name":"Pompeii_Assyrian","winCount":4,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":6},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":1},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":2},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":4,"defeatCount":7},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":60131,"highScoreMilitary":41453,"highScoreEconomy":20135,"highScoreTechnology":6647,"unitsKilled":285382,"unitsLost":295393,"buildingsRaised":38402,"buildingsLost":31963,"wondersBuilt":0,"castlesBuilt":3766,"trebsBuilt":3515,"farmsBuilt":121341},"user":{"userId":"","profileId":2793927,"userName":"[OmG] Imperial Noob","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/148ff422f2245ab66abfeabf3f7506861d6b703b_full.jpg","elo":1172,"playerStanding":0.28,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	33	-3	9	8	65.5	\N
19	Putri Cantik	3975785	75	2023-02-24 07:31:48	2024-11-27 14:54:26	1	https://avatars.steamstatic.com/0115026c94bca1407f88d7bf095ab49be1efb128_full.jpg	[xbow] Putri Cantik	1500	0	1328	{"mpStatList":{"totalMatches":283,"totalWins":162,"currentWinStreak":3},"careerStats":{"totalGames":2257,"totalWins":1122,"civilizations":[{"id":3,"name":"Britons","winCount":36,"defeatCount":121},{"id":4,"name":"Franks","winCount":22,"defeatCount":147},{"id":5,"name":"Goths","winCount":59,"defeatCount":100},{"id":6,"name":"Teutons","winCount":32,"defeatCount":106},{"id":7,"name":"Japanese","winCount":24,"defeatCount":83},{"id":8,"name":"Chinese","winCount":19,"defeatCount":75},{"id":9,"name":"Byzantines","winCount":27,"defeatCount":94},{"id":10,"name":"Persians","winCount":62,"defeatCount":120},{"id":11,"name":"Saracens","winCount":19,"defeatCount":112},{"id":12,"name":"Turks","winCount":30,"defeatCount":120},{"id":13,"name":"Vikings","winCount":48,"defeatCount":94},{"id":14,"name":"Mongols","winCount":14,"defeatCount":125},{"id":15,"name":"Celts","winCount":40,"defeatCount":89},{"id":16,"name":"Spanish","winCount":28,"defeatCount":119},{"id":17,"name":"Aztecs","winCount":22,"defeatCount":100},{"id":18,"name":"Mayans","winCount":39,"defeatCount":98},{"id":19,"name":"Huns","winCount":40,"defeatCount":118},{"id":20,"name":"Koreans","winCount":22,"defeatCount":81},{"id":21,"name":"Italians","winCount":27,"defeatCount":95},{"id":22,"name":"Hindustanis","winCount":77,"defeatCount":100},{"id":23,"name":"Incas","winCount":32,"defeatCount":83},{"id":24,"name":"Magyar","winCount":19,"defeatCount":95},{"id":25,"name":"Slavs","winCount":18,"defeatCount":98},{"id":26,"name":"Portuguese","winCount":23,"defeatCount":100},{"id":27,"name":"Ethiopians","winCount":29,"defeatCount":92},{"id":28,"name":"Malians","winCount":30,"defeatCount":82},{"id":29,"name":"Berbers","winCount":20,"defeatCount":95},{"id":30,"name":"Khmer","winCount":20,"defeatCount":103},{"id":31,"name":"Malay","winCount":26,"defeatCount":101},{"id":32,"name":"Burmese","winCount":17,"defeatCount":95},{"id":33,"name":"Vietnamese","winCount":27,"defeatCount":113},{"id":34,"name":"Bulgarians","winCount":34,"defeatCount":66},{"id":35,"name":"Tatars","winCount":18,"defeatCount":98},{"id":36,"name":"Cumans","winCount":48,"defeatCount":100},{"id":37,"name":"Lithuanians","winCount":24,"defeatCount":88},{"id":38,"name":"Random","winCount":848,"defeatCount":759},{"id":174,"name":"Burgundians","winCount":13,"defeatCount":75},{"id":175,"name":"Sicilians","winCount":21,"defeatCount":49},{"id":184,"name":"Poles","winCount":19,"defeatCount":49},{"id":185,"name":"Bohemians","winCount":16,"defeatCount":80},{"id":195,"name":"Bengalis","winCount":18,"defeatCount":45},{"id":196,"name":"Dravidians","winCount":14,"defeatCount":48},{"id":197,"name":"Gurjaras","winCount":15,"defeatCount":46},{"id":202,"name":"Romans","winCount":0,"defeatCount":27},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":53855,"highScoreMilitary":61971,"highScoreEconomy":13748,"highScoreTechnology":5802,"unitsKilled":433120,"unitsLost":446580,"buildingsRaised":51338,"buildingsLost":35650,"wondersBuilt":0,"castlesBuilt":5365,"trebsBuilt":4331,"farmsBuilt":144125},"user":{"userId":"","profileId":3975785,"userName":"[xbow] Putri Cantik","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/0115026c94bca1407f88d7bf095ab49be1efb128_full.jpg","elo":1261,"playerStanding":0.19,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	33	1	10	7	77.5	\N
1058	Great Gali Djowo	14551949	50	\N	2024-11-27 14:54:32	1	https://avatars.steamstatic.com/8a4c9e6e6737fee85115bd4938d70aafae2ca3de_full.jpg	[Vesper] Great Gali Djowo	1190	939	945	{"mpStatList":{"totalMatches":1692,"totalWins":832,"currentWinStreak":3},"careerStats":{"totalGames":2743,"totalWins":1380,"civilizations":[{"id":3,"name":"Britons","winCount":36,"defeatCount":226},{"id":4,"name":"Franks","winCount":62,"defeatCount":287},{"id":5,"name":"Goths","winCount":163,"defeatCount":216},{"id":6,"name":"Teutons","winCount":13,"defeatCount":189},{"id":7,"name":"Japanese","winCount":46,"defeatCount":94},{"id":8,"name":"Chinese","winCount":3,"defeatCount":110},{"id":9,"name":"Byzantines","winCount":16,"defeatCount":120},{"id":10,"name":"Persians","winCount":99,"defeatCount":276},{"id":11,"name":"Saracens","winCount":3,"defeatCount":83},{"id":12,"name":"Turks","winCount":39,"defeatCount":211},{"id":13,"name":"Vikings","winCount":12,"defeatCount":94},{"id":14,"name":"Mongols","winCount":18,"defeatCount":219},{"id":15,"name":"Celts","winCount":205,"defeatCount":127},{"id":16,"name":"Spanish","winCount":3,"defeatCount":189},{"id":17,"name":"Aztecs","winCount":9,"defeatCount":55},{"id":18,"name":"Mayans","winCount":6,"defeatCount":83},{"id":19,"name":"Huns","winCount":15,"defeatCount":161},{"id":20,"name":"Koreans","winCount":11,"defeatCount":64},{"id":21,"name":"Italians","winCount":25,"defeatCount":93},{"id":22,"name":"Hindustanis","winCount":41,"defeatCount":114},{"id":23,"name":"Incas","winCount":35,"defeatCount":66},{"id":24,"name":"Magyar","winCount":3,"defeatCount":82},{"id":25,"name":"Slavs","winCount":120,"defeatCount":104},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":151},{"id":27,"name":"Ethiopians","winCount":3,"defeatCount":109},{"id":28,"name":"Malians","winCount":9,"defeatCount":47},{"id":29,"name":"Berbers","winCount":5,"defeatCount":38},{"id":30,"name":"Khmer","winCount":48,"defeatCount":235},{"id":31,"name":"Malay","winCount":20,"defeatCount":79},{"id":32,"name":"Burmese","winCount":1,"defeatCount":39},{"id":33,"name":"Vietnamese","winCount":13,"defeatCount":94},{"id":34,"name":"Bulgarians","winCount":5,"defeatCount":66},{"id":35,"name":"Tatars","winCount":2,"defeatCount":64},{"id":36,"name":"Cumans","winCount":8,"defeatCount":93},{"id":37,"name":"Lithuanians","winCount":5,"defeatCount":104},{"id":38,"name":"Random","winCount":78,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":15,"defeatCount":86},{"id":175,"name":"Sicilians","winCount":8,"defeatCount":49},{"id":184,"name":"Poles","winCount":54,"defeatCount":91},{"id":185,"name":"Bohemians","winCount":22,"defeatCount":170},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":28},{"id":196,"name":"Dravidians","winCount":32,"defeatCount":32},{"id":197,"name":"Gurjaras","winCount":9,"defeatCount":52},{"id":202,"name":"Romans","winCount":159,"defeatCount":113},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64033,"highScoreMilitary":61118,"highScoreEconomy":26964,"highScoreTechnology":7719,"unitsKilled":388566,"unitsLost":390627,"buildingsRaised":48670,"buildingsLost":35204,"wondersBuilt":0,"castlesBuilt":7010,"trebsBuilt":4916,"farmsBuilt":121218},"user":{"userId":"","profileId":14551949,"userName":"[Vesper] Great Gali Djowo","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/8a4c9e6e6737fee85115bd4938d70aafae2ca3de_full.jpg","elo":922,"playerStanding":0.68,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	10	1	0	1	44.5	\N
1053	Nusantara	14619943	45	2023-02-10 01:33:33	2024-11-27 14:53:07	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	Nusantara	1356	0	0	{"mpStatList":{"totalMatches":9,"totalWins":7,"currentWinStreak":1},"careerStats":{"totalGames":57,"totalWins":33,"civilizations":[{"id":3,"name":"Britons","winCount":2,"defeatCount":3},{"id":4,"name":"Franks","winCount":1,"defeatCount":8},{"id":5,"name":"Goths","winCount":2,"defeatCount":6},{"id":6,"name":"Teutons","winCount":0,"defeatCount":1},{"id":7,"name":"Japanese","winCount":1,"defeatCount":0},{"id":8,"name":"Chinese","winCount":0,"defeatCount":2},{"id":9,"name":"Byzantines","winCount":1,"defeatCount":6},{"id":10,"name":"Persians","winCount":0,"defeatCount":5},{"id":11,"name":"Saracens","winCount":0,"defeatCount":3},{"id":12,"name":"Turks","winCount":2,"defeatCount":5},{"id":13,"name":"Vikings","winCount":1,"defeatCount":2},{"id":14,"name":"Mongols","winCount":2,"defeatCount":7},{"id":15,"name":"Celts","winCount":0,"defeatCount":2},{"id":16,"name":"Spanish","winCount":1,"defeatCount":7},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":0},{"id":18,"name":"Mayans","winCount":1,"defeatCount":4},{"id":19,"name":"Huns","winCount":0,"defeatCount":4},{"id":20,"name":"Koreans","winCount":0,"defeatCount":5},{"id":21,"name":"Italians","winCount":2,"defeatCount":1},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":2},{"id":23,"name":"Incas","winCount":1,"defeatCount":2},{"id":24,"name":"Magyar","winCount":4,"defeatCount":3},{"id":25,"name":"Slavs","winCount":1,"defeatCount":4},{"id":26,"name":"Portuguese","winCount":1,"defeatCount":2},{"id":27,"name":"Ethiopians","winCount":1,"defeatCount":3},{"id":28,"name":"Malians","winCount":0,"defeatCount":2},{"id":29,"name":"Berbers","winCount":2,"defeatCount":3},{"id":30,"name":"Khmer","winCount":1,"defeatCount":1},{"id":31,"name":"Malay","winCount":1,"defeatCount":3},{"id":32,"name":"Burmese","winCount":0,"defeatCount":1},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":3},{"id":34,"name":"Bulgarians","winCount":0,"defeatCount":0},{"id":35,"name":"Tatars","winCount":1,"defeatCount":4},{"id":36,"name":"Cumans","winCount":1,"defeatCount":2},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":2},{"id":38,"name":"Random","winCount":13,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":2,"defeatCount":1},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":0},{"id":184,"name":"Poles","winCount":0,"defeatCount":2},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":1},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":2},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":2},{"id":197,"name":"Gurjaras","winCount":1,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":32122,"highScoreMilitary":49766,"highScoreEconomy":18702,"highScoreTechnology":5721,"unitsKilled":10399,"unitsLost":8839,"buildingsRaised":1362,"buildingsLost":465,"wondersBuilt":0,"castlesBuilt":142,"trebsBuilt":232,"farmsBuilt":3708},"user":{"userId":"","profileId":14619943,"userName":"Nusantara","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1199,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	2	1	5	4	45.5	\N
58	Irene	6139075	40	2023-02-10 01:33:33	2024-11-27 14:54:37	1	https://avatars.steamstatic.com/a735c4846683e50c6ba6e77a485a72d114b8c2d6_full.jpg	Irene	0	0	0	{"mpStatList":{"totalMatches":35,"totalWins":19,"currentWinStreak":0},"careerStats":{"totalGames":313,"totalWins":145,"civilizations":[{"id":3,"name":"Britons","winCount":2,"defeatCount":11},{"id":4,"name":"Franks","winCount":4,"defeatCount":33},{"id":5,"name":"Goths","winCount":10,"defeatCount":17},{"id":6,"name":"Teutons","winCount":4,"defeatCount":14},{"id":7,"name":"Japanese","winCount":5,"defeatCount":16},{"id":8,"name":"Chinese","winCount":3,"defeatCount":13},{"id":9,"name":"Byzantines","winCount":13,"defeatCount":9},{"id":10,"name":"Persians","winCount":3,"defeatCount":19},{"id":11,"name":"Saracens","winCount":6,"defeatCount":16},{"id":12,"name":"Turks","winCount":0,"defeatCount":14},{"id":13,"name":"Vikings","winCount":4,"defeatCount":13},{"id":14,"name":"Mongols","winCount":8,"defeatCount":26},{"id":15,"name":"Celts","winCount":2,"defeatCount":13},{"id":16,"name":"Spanish","winCount":6,"defeatCount":23},{"id":17,"name":"Aztecs","winCount":8,"defeatCount":12},{"id":18,"name":"Mayans","winCount":3,"defeatCount":19},{"id":19,"name":"Huns","winCount":3,"defeatCount":23},{"id":20,"name":"Koreans","winCount":6,"defeatCount":10},{"id":21,"name":"Italians","winCount":1,"defeatCount":12},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":16},{"id":23,"name":"Incas","winCount":6,"defeatCount":6},{"id":24,"name":"Magyar","winCount":19,"defeatCount":22},{"id":25,"name":"Slavs","winCount":0,"defeatCount":10},{"id":26,"name":"Portuguese","winCount":3,"defeatCount":10},{"id":27,"name":"Ethiopians","winCount":11,"defeatCount":20},{"id":28,"name":"Malians","winCount":7,"defeatCount":13},{"id":29,"name":"Berbers","winCount":8,"defeatCount":15},{"id":30,"name":"Khmer","winCount":7,"defeatCount":21},{"id":31,"name":"Malay","winCount":7,"defeatCount":16},{"id":32,"name":"Burmese","winCount":3,"defeatCount":8},{"id":33,"name":"Vietnamese","winCount":9,"defeatCount":17},{"id":34,"name":"Bulgarians","winCount":4,"defeatCount":9},{"id":35,"name":"Tatars","winCount":2,"defeatCount":14},{"id":36,"name":"Cumans","winCount":5,"defeatCount":13},{"id":37,"name":"Lithuanians","winCount":2,"defeatCount":11},{"id":38,"name":"Random","winCount":98,"defeatCount":96},{"id":174,"name":"Burgundians","winCount":2,"defeatCount":7},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":12},{"id":184,"name":"Poles","winCount":3,"defeatCount":13},{"id":185,"name":"Bohemians","winCount":3,"defeatCount":18},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":3},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":7},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":6},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":52055,"highScoreMilitary":41392,"highScoreEconomy":15604,"highScoreTechnology":6121,"unitsKilled":52409,"unitsLost":48793,"buildingsRaised":4382,"buildingsLost":5382,"wondersBuilt":0,"castlesBuilt":557,"trebsBuilt":313,"farmsBuilt":21947},"user":{"userId":"","profileId":6139075,"userName":"Irene","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/a735c4846683e50c6ba6e77a485a72d114b8c2d6_full.jpg","elo":1011,"playerStanding":0.53,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	1	10	7	41.5	\N
1051	Mpiz	15675211	25	\N	2024-11-27 14:54:41	1	https://avatars.steamstatic.com/86aaf22e31d636d8ca33accbd4eda0327c34acd8_full.jpg	TongcaiAsin	1106	0	0	{"mpStatList":{"totalMatches":5,"totalWins":3,"currentWinStreak":0},"careerStats":{"totalGames":128,"totalWins":33,"civilizations":[{"id":3,"name":"Britons","winCount":2,"defeatCount":7},{"id":4,"name":"Franks","winCount":1,"defeatCount":4},{"id":5,"name":"Goths","winCount":0,"defeatCount":4},{"id":6,"name":"Teutons","winCount":0,"defeatCount":5},{"id":7,"name":"Japanese","winCount":1,"defeatCount":2},{"id":8,"name":"Chinese","winCount":0,"defeatCount":6},{"id":9,"name":"Byzantines","winCount":1,"defeatCount":4},{"id":10,"name":"Persians","winCount":0,"defeatCount":3},{"id":11,"name":"Saracens","winCount":0,"defeatCount":3},{"id":12,"name":"Turks","winCount":2,"defeatCount":2},{"id":13,"name":"Vikings","winCount":0,"defeatCount":2},{"id":14,"name":"Mongols","winCount":1,"defeatCount":9},{"id":15,"name":"Celts","winCount":5,"defeatCount":3},{"id":16,"name":"Spanish","winCount":4,"defeatCount":4},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":4},{"id":18,"name":"Mayans","winCount":0,"defeatCount":8},{"id":19,"name":"Huns","winCount":1,"defeatCount":4},{"id":20,"name":"Koreans","winCount":0,"defeatCount":2},{"id":21,"name":"Italians","winCount":0,"defeatCount":2},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":5},{"id":23,"name":"Incas","winCount":1,"defeatCount":3},{"id":24,"name":"Magyar","winCount":7,"defeatCount":2},{"id":25,"name":"Slavs","winCount":0,"defeatCount":0},{"id":26,"name":"Portuguese","winCount":3,"defeatCount":3},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":3},{"id":28,"name":"Malians","winCount":0,"defeatCount":1},{"id":29,"name":"Berbers","winCount":0,"defeatCount":3},{"id":30,"name":"Khmer","winCount":9,"defeatCount":5},{"id":31,"name":"Malay","winCount":0,"defeatCount":1},{"id":32,"name":"Burmese","winCount":1,"defeatCount":1},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":4},{"id":34,"name":"Bulgarians","winCount":0,"defeatCount":4},{"id":35,"name":"Tatars","winCount":2,"defeatCount":3},{"id":36,"name":"Cumans","winCount":0,"defeatCount":2},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":6},{"id":38,"name":"Random","winCount":5,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":2},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":1},{"id":184,"name":"Poles","winCount":0,"defeatCount":1},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":0},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":2},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":2},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":1},{"id":202,"name":"Romans","winCount":0,"defeatCount":4},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":29722,"highScoreMilitary":11911,"highScoreEconomy":13640,"highScoreTechnology":6088,"unitsKilled":7590,"unitsLost":10980,"buildingsRaised":1805,"buildingsLost":1876,"wondersBuilt":0,"castlesBuilt":126,"trebsBuilt":217,"farmsBuilt":5837},"user":{"userId":"","profileId":15675211,"userName":"TongcaiAsin","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/86aaf22e31d636d8ca33accbd4eda0327c34acd8_full.jpg","elo":1033,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	9	-2	2	5	23.5	\N
32	_WOWER_	19749740	65	2023-02-10 01:33:33	2024-11-27 14:54:56	1	https://avatars.steamstatic.com/831332a8dc11a85af95390bea857327a780777ed_full.jpg	[xbow] _WOWER_	1300	0	1321	{"mpStatList":{"totalMatches":16,"totalWins":11,"currentWinStreak":2},"careerStats":{"totalGames":555,"totalWins":270,"civilizations":[{"id":3,"name":"Britons","winCount":7,"defeatCount":21},{"id":4,"name":"Franks","winCount":28,"defeatCount":28},{"id":5,"name":"Goths","winCount":20,"defeatCount":18},{"id":6,"name":"Teutons","winCount":10,"defeatCount":31},{"id":7,"name":"Japanese","winCount":9,"defeatCount":29},{"id":8,"name":"Chinese","winCount":6,"defeatCount":16},{"id":9,"name":"Byzantines","winCount":6,"defeatCount":29},{"id":10,"name":"Persians","winCount":8,"defeatCount":23},{"id":11,"name":"Saracens","winCount":5,"defeatCount":25},{"id":12,"name":"Turks","winCount":9,"defeatCount":17},{"id":13,"name":"Vikings","winCount":9,"defeatCount":25},{"id":14,"name":"Mongols","winCount":11,"defeatCount":20},{"id":15,"name":"Celts","winCount":9,"defeatCount":19},{"id":16,"name":"Spanish","winCount":9,"defeatCount":34},{"id":17,"name":"Aztecs","winCount":11,"defeatCount":20},{"id":18,"name":"Mayans","winCount":5,"defeatCount":22},{"id":19,"name":"Huns","winCount":5,"defeatCount":24},{"id":20,"name":"Koreans","winCount":9,"defeatCount":25},{"id":21,"name":"Italians","winCount":5,"defeatCount":36},{"id":22,"name":"Hindustanis","winCount":13,"defeatCount":21},{"id":23,"name":"Incas","winCount":5,"defeatCount":27},{"id":24,"name":"Magyar","winCount":7,"defeatCount":23},{"id":25,"name":"Slavs","winCount":7,"defeatCount":15},{"id":26,"name":"Portuguese","winCount":15,"defeatCount":34},{"id":27,"name":"Ethiopians","winCount":8,"defeatCount":30},{"id":28,"name":"Malians","winCount":5,"defeatCount":26},{"id":29,"name":"Berbers","winCount":6,"defeatCount":30},{"id":30,"name":"Khmer","winCount":8,"defeatCount":24},{"id":31,"name":"Malay","winCount":8,"defeatCount":29},{"id":32,"name":"Burmese","winCount":10,"defeatCount":34},{"id":33,"name":"Vietnamese","winCount":10,"defeatCount":31},{"id":34,"name":"Bulgarians","winCount":5,"defeatCount":18},{"id":35,"name":"Tatars","winCount":6,"defeatCount":31},{"id":36,"name":"Cumans","winCount":8,"defeatCount":17},{"id":37,"name":"Lithuanians","winCount":10,"defeatCount":23},{"id":38,"name":"Random","winCount":223,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":26},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":15},{"id":184,"name":"Poles","winCount":0,"defeatCount":15},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":20},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":15},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":18},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":20},{"id":202,"name":"Romans","winCount":0,"defeatCount":10},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":50852,"highScoreMilitary":38406,"highScoreEconomy":11313,"highScoreTechnology":5898,"unitsKilled":80317,"unitsLost":87234,"buildingsRaised":12763,"buildingsLost":10425,"wondersBuilt":4,"castlesBuilt":1344,"trebsBuilt":444,"farmsBuilt":1277},"user":{"userId":"","profileId":19749740,"userName":"[xbow] _WOWER_","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/831332a8dc11a85af95390bea857327a780777ed_full.jpg","elo":1348,"playerStanding":0.12,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	21	-1	10	7	66.5	\N
47	Eldarsono	2886619	60	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/0a1e49e78292d147eb5a5b78edfecc380811b547_full.jpg	| Biji | Bifi Fufufafa	1385	1025	1242	{"mpStatList":{"totalMatches":370,"totalWins":187,"currentWinStreak":2},"careerStats":{"totalGames":4159,"totalWins":2033,"civilizations":[{"id":3,"name":"Britons","winCount":113,"defeatCount":217},{"id":4,"name":"Franks","winCount":95,"defeatCount":260},{"id":5,"name":"Goths","winCount":200,"defeatCount":201},{"id":6,"name":"Teutons","winCount":40,"defeatCount":177},{"id":7,"name":"Japanese","winCount":49,"defeatCount":165},{"id":8,"name":"Chinese","winCount":27,"defeatCount":164},{"id":9,"name":"Byzantines","winCount":43,"defeatCount":173},{"id":10,"name":"Persians","winCount":41,"defeatCount":205},{"id":11,"name":"Saracens","winCount":38,"defeatCount":145},{"id":12,"name":"Turks","winCount":83,"defeatCount":175},{"id":13,"name":"Vikings","winCount":95,"defeatCount":150},{"id":14,"name":"Mongols","winCount":35,"defeatCount":239},{"id":15,"name":"Celts","winCount":37,"defeatCount":140},{"id":16,"name":"Spanish","winCount":41,"defeatCount":246},{"id":17,"name":"Aztecs","winCount":31,"defeatCount":165},{"id":18,"name":"Mayans","winCount":69,"defeatCount":181},{"id":19,"name":"Huns","winCount":34,"defeatCount":207},{"id":20,"name":"Koreans","winCount":66,"defeatCount":164},{"id":21,"name":"Italians","winCount":96,"defeatCount":161},{"id":22,"name":"Hindustanis","winCount":46,"defeatCount":172},{"id":23,"name":"Incas","winCount":44,"defeatCount":123},{"id":24,"name":"Magyar","winCount":37,"defeatCount":160},{"id":25,"name":"Slavs","winCount":35,"defeatCount":138},{"id":26,"name":"Portuguese","winCount":39,"defeatCount":191},{"id":27,"name":"Ethiopians","winCount":38,"defeatCount":206},{"id":28,"name":"Malians","winCount":41,"defeatCount":164},{"id":29,"name":"Berbers","winCount":28,"defeatCount":141},{"id":30,"name":"Khmer","winCount":43,"defeatCount":195},{"id":31,"name":"Malay","winCount":52,"defeatCount":138},{"id":32,"name":"Burmese","winCount":38,"defeatCount":142},{"id":33,"name":"Vietnamese","winCount":74,"defeatCount":165},{"id":34,"name":"Bulgarians","winCount":57,"defeatCount":131},{"id":35,"name":"Tatars","winCount":27,"defeatCount":150},{"id":36,"name":"Cumans","winCount":39,"defeatCount":186},{"id":37,"name":"Lithuanians","winCount":28,"defeatCount":164},{"id":38,"name":"Random","winCount":1264,"defeatCount":107},{"id":174,"name":"Burgundians","winCount":42,"defeatCount":132},{"id":175,"name":"Sicilians","winCount":39,"defeatCount":131},{"id":184,"name":"Poles","winCount":43,"defeatCount":118},{"id":185,"name":"Bohemians","winCount":25,"defeatCount":123},{"id":195,"name":"Bengalis","winCount":26,"defeatCount":80},{"id":196,"name":"Dravidians","winCount":23,"defeatCount":79},{"id":197,"name":"Gurjaras","winCount":35,"defeatCount":81},{"id":202,"name":"Romans","winCount":0,"defeatCount":37},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":77259,"highScoreMilitary":57860,"highScoreEconomy":17808,"highScoreTechnology":6384,"unitsKilled":629694,"unitsLost":607897,"buildingsRaised":83090,"buildingsLost":73386,"wondersBuilt":6,"castlesBuilt":9772,"trebsBuilt":6737,"farmsBuilt":222336},"user":{"userId":"","profileId":2886619,"userName":"| Biji | Bifi Fufufafa","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/0a1e49e78292d147eb5a5b78edfecc380811b547_full.jpg","elo":1059,"playerStanding":0.44,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	141	2	9	8	65.5	\N
18170628	Deri_indra	11682652	65	2024-05-12 10:58:30	2024-11-27 14:53:39	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	| Bifi | Deri_indra	1444	1080	1202	{"mpStatList":{"totalMatches":1086,"totalWins":505,"currentWinStreak":2},"careerStats":{"totalGames":1502,"totalWins":777,"civilizations":[{"id":3,"name":"Britons","winCount":17,"defeatCount":123},{"id":4,"name":"Franks","winCount":14,"defeatCount":161},{"id":5,"name":"Goths","winCount":12,"defeatCount":108},{"id":6,"name":"Teutons","winCount":301,"defeatCount":61},{"id":7,"name":"Japanese","winCount":7,"defeatCount":49},{"id":8,"name":"Chinese","winCount":7,"defeatCount":47},{"id":9,"name":"Byzantines","winCount":33,"defeatCount":71},{"id":10,"name":"Persians","winCount":29,"defeatCount":98},{"id":11,"name":"Saracens","winCount":14,"defeatCount":66},{"id":12,"name":"Turks","winCount":20,"defeatCount":103},{"id":13,"name":"Vikings","winCount":11,"defeatCount":55},{"id":14,"name":"Mongols","winCount":7,"defeatCount":148},{"id":15,"name":"Celts","winCount":15,"defeatCount":87},{"id":16,"name":"Spanish","winCount":25,"defeatCount":119},{"id":17,"name":"Aztecs","winCount":7,"defeatCount":59},{"id":18,"name":"Mayans","winCount":14,"defeatCount":84},{"id":19,"name":"Huns","winCount":144,"defeatCount":101},{"id":20,"name":"Koreans","winCount":18,"defeatCount":52},{"id":21,"name":"Italians","winCount":27,"defeatCount":76},{"id":22,"name":"Hindustanis","winCount":14,"defeatCount":91},{"id":23,"name":"Incas","winCount":13,"defeatCount":51},{"id":24,"name":"Magyar","winCount":9,"defeatCount":69},{"id":25,"name":"Slavs","winCount":7,"defeatCount":57},{"id":26,"name":"Portuguese","winCount":18,"defeatCount":91},{"id":27,"name":"Ethiopians","winCount":11,"defeatCount":65},{"id":28,"name":"Malians","winCount":12,"defeatCount":65},{"id":29,"name":"Berbers","winCount":4,"defeatCount":62},{"id":30,"name":"Khmer","winCount":10,"defeatCount":117},{"id":31,"name":"Malay","winCount":5,"defeatCount":52},{"id":32,"name":"Burmese","winCount":3,"defeatCount":49},{"id":33,"name":"Vietnamese","winCount":15,"defeatCount":83},{"id":34,"name":"Bulgarians","winCount":13,"defeatCount":63},{"id":35,"name":"Tatars","winCount":6,"defeatCount":45},{"id":36,"name":"Cumans","winCount":8,"defeatCount":70},{"id":37,"name":"Lithuanians","winCount":13,"defeatCount":77},{"id":38,"name":"Random","winCount":252,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":69},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":34},{"id":184,"name":"Poles","winCount":0,"defeatCount":67},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":55},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":32},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":27},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":39},{"id":202,"name":"Romans","winCount":0,"defeatCount":34},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64391,"highScoreMilitary":61375,"highScoreEconomy":33056,"highScoreTechnology":10263,"unitsKilled":294862,"unitsLost":240333,"buildingsRaised":40716,"buildingsLost":15454,"wondersBuilt":0,"castlesBuilt":3855,"trebsBuilt":2423,"farmsBuilt":72763},"user":{"userId":"","profileId":11682652,"userName":"| Bifi | Deri_indra","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1125,"playerStanding":0.34,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	73	1	12	5	68.5	\N
12448403	Mangonel	410377	45	\N	2024-11-27 14:55:05	1	https://avatars.steamstatic.com/63350feb3ba9b671034ac666eb714578b1b1c688_full.jpg	Mangonel	1222	0	0	{"mpStatList":{"totalMatches":0,"totalWins":0,"currentWinStreak":0},"careerStats":{"totalGames":44,"totalWins":28,"civilizations":[{"id":3,"name":"Britons","winCount":1,"defeatCount":14},{"id":4,"name":"Franks","winCount":1,"defeatCount":8},{"id":5,"name":"Goths","winCount":9,"defeatCount":20},{"id":6,"name":"Teutons","winCount":1,"defeatCount":8},{"id":7,"name":"Japanese","winCount":3,"defeatCount":9},{"id":8,"name":"Chinese","winCount":2,"defeatCount":7},{"id":9,"name":"Byzantines","winCount":2,"defeatCount":18},{"id":10,"name":"Persians","winCount":2,"defeatCount":7},{"id":11,"name":"Saracens","winCount":0,"defeatCount":12},{"id":12,"name":"Turks","winCount":1,"defeatCount":3},{"id":13,"name":"Vikings","winCount":2,"defeatCount":2},{"id":14,"name":"Mongols","winCount":5,"defeatCount":15},{"id":15,"name":"Celts","winCount":7,"defeatCount":4},{"id":16,"name":"Spanish","winCount":2,"defeatCount":12},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":5},{"id":18,"name":"Mayans","winCount":3,"defeatCount":5},{"id":19,"name":"Huns","winCount":0,"defeatCount":5},{"id":20,"name":"Koreans","winCount":3,"defeatCount":9},{"id":21,"name":"Italians","winCount":1,"defeatCount":6},{"id":22,"name":"Hindustanis","winCount":1,"defeatCount":3},{"id":23,"name":"Incas","winCount":6,"defeatCount":30},{"id":24,"name":"Magyar","winCount":0,"defeatCount":7},{"id":25,"name":"Slavs","winCount":1,"defeatCount":12},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":6},{"id":27,"name":"Ethiopians","winCount":2,"defeatCount":13},{"id":28,"name":"Malians","winCount":1,"defeatCount":3},{"id":29,"name":"Berbers","winCount":7,"defeatCount":6},{"id":30,"name":"Khmer","winCount":2,"defeatCount":9},{"id":31,"name":"Malay","winCount":3,"defeatCount":11},{"id":32,"name":"Burmese","winCount":3,"defeatCount":8},{"id":33,"name":"Vietnamese","winCount":2,"defeatCount":7},{"id":34,"name":"Bulgarians","winCount":5,"defeatCount":12},{"id":35,"name":"Tatars","winCount":2,"defeatCount":13},{"id":36,"name":"Cumans","winCount":6,"defeatCount":11},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":6},{"id":38,"name":"Random","winCount":5,"defeatCount":93},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":2},{"id":175,"name":"Sicilians","winCount":6,"defeatCount":1},{"id":184,"name":"Poles","winCount":0,"defeatCount":0},{"id":185,"name":"Bohemians","winCount":3,"defeatCount":1},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":3},{"id":196,"name":"Dravidians","winCount":2,"defeatCount":4},{"id":197,"name":"Gurjaras","winCount":1,"defeatCount":1},{"id":202,"name":"Romans","winCount":2,"defeatCount":5},{"id":204,"name":"Pompeii_Assyrian","winCount":20,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":1,"defeatCount":1},{"id":210,"name":"Pompeii_Choson","winCount":1,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":12,"defeatCount":7},{"id":216,"name":"Pompeii_Hittite","winCount":1,"defeatCount":5},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":1,"defeatCount":1},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":2},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":2},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":4},{"id":230,"name":"Pompeii_Shang","winCount":1,"defeatCount":5},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":1,"defeatCount":7},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":63879,"highScoreMilitary":60258,"highScoreEconomy":20083,"highScoreTechnology":20928,"unitsKilled":46356,"unitsLost":19465,"buildingsRaised":9655,"buildingsLost":735,"wondersBuilt":11,"castlesBuilt":323,"trebsBuilt":279,"farmsBuilt":7501},"user":{"userId":"","profileId":410377,"userName":"Mangonel","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/63350feb3ba9b671034ac666eb714578b1b1c688_full.jpg","elo":null,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-3	0	3	43.5	\N
18170645	Kudabinal	17842551	45	2024-10-21 05:22:25	2024-11-27 14:55:20	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	(Vesper) kudabinal	1054	0	939	{"mpStatList":{"totalMatches":327,"totalWins":149,"currentWinStreak":4},"careerStats":{"totalGames":470,"totalWins":218,"civilizations":[{"id":3,"name":"Britons","winCount":4,"defeatCount":42},{"id":4,"name":"Franks","winCount":59,"defeatCount":47},{"id":5,"name":"Goths","winCount":9,"defeatCount":37},{"id":6,"name":"Teutons","winCount":1,"defeatCount":29},{"id":7,"name":"Japanese","winCount":0,"defeatCount":22},{"id":8,"name":"Chinese","winCount":0,"defeatCount":18},{"id":9,"name":"Byzantines","winCount":10,"defeatCount":21},{"id":10,"name":"Persians","winCount":2,"defeatCount":55},{"id":11,"name":"Saracens","winCount":12,"defeatCount":17},{"id":12,"name":"Turks","winCount":13,"defeatCount":32},{"id":13,"name":"Vikings","winCount":0,"defeatCount":12},{"id":14,"name":"Mongols","winCount":0,"defeatCount":39},{"id":15,"name":"Celts","winCount":15,"defeatCount":28},{"id":16,"name":"Spanish","winCount":2,"defeatCount":39},{"id":17,"name":"Aztecs","winCount":9,"defeatCount":13},{"id":18,"name":"Mayans","winCount":1,"defeatCount":16},{"id":19,"name":"Huns","winCount":51,"defeatCount":25},{"id":20,"name":"Koreans","winCount":3,"defeatCount":9},{"id":21,"name":"Italians","winCount":7,"defeatCount":18},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":16},{"id":23,"name":"Incas","winCount":5,"defeatCount":8},{"id":24,"name":"Magyar","winCount":0,"defeatCount":8},{"id":25,"name":"Slavs","winCount":0,"defeatCount":27},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":29},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":9},{"id":28,"name":"Malians","winCount":0,"defeatCount":11},{"id":29,"name":"Berbers","winCount":2,"defeatCount":7},{"id":30,"name":"Khmer","winCount":8,"defeatCount":52},{"id":31,"name":"Malay","winCount":0,"defeatCount":12},{"id":32,"name":"Burmese","winCount":0,"defeatCount":8},{"id":33,"name":"Vietnamese","winCount":2,"defeatCount":18},{"id":34,"name":"Bulgarians","winCount":2,"defeatCount":7},{"id":35,"name":"Tatars","winCount":0,"defeatCount":12},{"id":36,"name":"Cumans","winCount":5,"defeatCount":18},{"id":37,"name":"Lithuanians","winCount":6,"defeatCount":19},{"id":38,"name":"Random","winCount":11,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":16},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":3},{"id":184,"name":"Poles","winCount":0,"defeatCount":13},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":31},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":5},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":5},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":6},{"id":202,"name":"Romans","winCount":0,"defeatCount":19},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":54358,"highScoreMilitary":36576,"highScoreEconomy":14840,"highScoreTechnology":6348,"unitsKilled":78024,"unitsLost":101574,"buildingsRaised":6180,"buildingsLost":9272,"wondersBuilt":0,"castlesBuilt":838,"trebsBuilt":606,"farmsBuilt":15305},"user":{"userId":"","profileId":17842551,"userName":"(Vesper) kudabinal","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":955,"playerStanding":0.62,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-2	0	0	0	\N
20	Aruba	5060982	80	2023-02-10 01:33:33	2024-11-27 14:55:30	1	https://avatars.steamstatic.com/75abe115b031cd7aa0e18157f65e6fe931913182_full.jpg	Aruba	1503	1193	1102	{"mpStatList":{"totalMatches":546,"totalWins":287,"currentWinStreak":3},"careerStats":{"totalGames":1420,"totalWins":763,"civilizations":[{"id":3,"name":"Britons","winCount":26,"defeatCount":142},{"id":4,"name":"Franks","winCount":33,"defeatCount":159},{"id":5,"name":"Goths","winCount":18,"defeatCount":92},{"id":6,"name":"Teutons","winCount":31,"defeatCount":83},{"id":7,"name":"Japanese","winCount":30,"defeatCount":86},{"id":8,"name":"Chinese","winCount":28,"defeatCount":76},{"id":9,"name":"Byzantines","winCount":17,"defeatCount":72},{"id":10,"name":"Persians","winCount":37,"defeatCount":114},{"id":11,"name":"Saracens","winCount":13,"defeatCount":79},{"id":12,"name":"Turks","winCount":23,"defeatCount":69},{"id":13,"name":"Vikings","winCount":31,"defeatCount":73},{"id":14,"name":"Mongols","winCount":46,"defeatCount":139},{"id":15,"name":"Celts","winCount":10,"defeatCount":76},{"id":16,"name":"Spanish","winCount":20,"defeatCount":112},{"id":17,"name":"Aztecs","winCount":13,"defeatCount":57},{"id":18,"name":"Mayans","winCount":24,"defeatCount":80},{"id":19,"name":"Huns","winCount":32,"defeatCount":99},{"id":20,"name":"Koreans","winCount":49,"defeatCount":70},{"id":21,"name":"Italians","winCount":14,"defeatCount":80},{"id":22,"name":"Hindustanis","winCount":55,"defeatCount":76},{"id":23,"name":"Incas","winCount":15,"defeatCount":56},{"id":24,"name":"Magyar","winCount":24,"defeatCount":77},{"id":25,"name":"Slavs","winCount":28,"defeatCount":54},{"id":26,"name":"Portuguese","winCount":19,"defeatCount":79},{"id":27,"name":"Ethiopians","winCount":29,"defeatCount":98},{"id":28,"name":"Malians","winCount":27,"defeatCount":72},{"id":29,"name":"Berbers","winCount":16,"defeatCount":64},{"id":30,"name":"Khmer","winCount":27,"defeatCount":105},{"id":31,"name":"Malay","winCount":24,"defeatCount":71},{"id":32,"name":"Burmese","winCount":20,"defeatCount":62},{"id":33,"name":"Vietnamese","winCount":24,"defeatCount":80},{"id":34,"name":"Bulgarians","winCount":24,"defeatCount":75},{"id":35,"name":"Tatars","winCount":15,"defeatCount":61},{"id":36,"name":"Cumans","winCount":31,"defeatCount":79},{"id":37,"name":"Lithuanians","winCount":30,"defeatCount":80},{"id":38,"name":"Random","winCount":400,"defeatCount":290},{"id":174,"name":"Burgundians","winCount":12,"defeatCount":72},{"id":175,"name":"Sicilians","winCount":29,"defeatCount":60},{"id":184,"name":"Poles","winCount":18,"defeatCount":70},{"id":185,"name":"Bohemians","winCount":19,"defeatCount":71},{"id":195,"name":"Bengalis","winCount":11,"defeatCount":36},{"id":196,"name":"Dravidians","winCount":14,"defeatCount":37},{"id":197,"name":"Gurjaras","winCount":23,"defeatCount":28},{"id":202,"name":"Romans","winCount":14,"defeatCount":6},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":49151,"highScoreMilitary":30866,"highScoreEconomy":14685,"highScoreTechnology":6691,"unitsKilled":265799,"unitsLost":186413,"buildingsRaised":34883,"buildingsLost":10545,"wondersBuilt":0,"castlesBuilt":3157,"trebsBuilt":2682,"farmsBuilt":96442},"user":{"userId":"","profileId":5060982,"userName":"Aruba","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/75abe115b031cd7aa0e18157f65e6fe931913182_full.jpg","elo":1286,"playerStanding":0.16,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	23	-3	9	4	82.5	\N
18170631	House Rahadian	6160315	45	2024-05-26 07:40:36	2024-11-27 14:55:43	1	https://avatars.steamstatic.com/136036548525dfc8bff6506408669f6a10ed1b97_full.jpg	[Vesper] House Rahadian	1088	0	886	{"mpStatList":{"totalMatches":870,"totalWins":416,"currentWinStreak":0},"careerStats":{"totalGames":1272,"totalWins":623,"civilizations":[{"id":3,"name":"Britons","winCount":3,"defeatCount":116},{"id":4,"name":"Franks","winCount":3,"defeatCount":138},{"id":5,"name":"Goths","winCount":4,"defeatCount":94},{"id":6,"name":"Teutons","winCount":0,"defeatCount":84},{"id":7,"name":"Japanese","winCount":3,"defeatCount":55},{"id":8,"name":"Chinese","winCount":0,"defeatCount":49},{"id":9,"name":"Byzantines","winCount":0,"defeatCount":46},{"id":10,"name":"Persians","winCount":3,"defeatCount":142},{"id":11,"name":"Saracens","winCount":0,"defeatCount":26},{"id":12,"name":"Turks","winCount":144,"defeatCount":95},{"id":13,"name":"Vikings","winCount":0,"defeatCount":53},{"id":14,"name":"Mongols","winCount":3,"defeatCount":82},{"id":15,"name":"Celts","winCount":2,"defeatCount":70},{"id":16,"name":"Spanish","winCount":0,"defeatCount":97},{"id":17,"name":"Aztecs","winCount":1,"defeatCount":24},{"id":18,"name":"Mayans","winCount":2,"defeatCount":38},{"id":19,"name":"Huns","winCount":1,"defeatCount":90},{"id":20,"name":"Koreans","winCount":2,"defeatCount":38},{"id":21,"name":"Italians","winCount":224,"defeatCount":55},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":54},{"id":23,"name":"Incas","winCount":2,"defeatCount":31},{"id":24,"name":"Magyar","winCount":1,"defeatCount":29},{"id":25,"name":"Slavs","winCount":0,"defeatCount":42},{"id":26,"name":"Portuguese","winCount":1,"defeatCount":86},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":36},{"id":28,"name":"Malians","winCount":0,"defeatCount":16},{"id":29,"name":"Berbers","winCount":3,"defeatCount":18},{"id":30,"name":"Khmer","winCount":7,"defeatCount":151},{"id":31,"name":"Malay","winCount":85,"defeatCount":44},{"id":32,"name":"Burmese","winCount":0,"defeatCount":13},{"id":33,"name":"Vietnamese","winCount":2,"defeatCount":54},{"id":34,"name":"Bulgarians","winCount":3,"defeatCount":19},{"id":35,"name":"Tatars","winCount":10,"defeatCount":23},{"id":36,"name":"Cumans","winCount":28,"defeatCount":42},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":51},{"id":38,"name":"Random","winCount":12,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":72,"defeatCount":30},{"id":175,"name":"Sicilians","winCount":20,"defeatCount":22},{"id":184,"name":"Poles","winCount":5,"defeatCount":36},{"id":185,"name":"Bohemians","winCount":2,"defeatCount":63},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":12},{"id":196,"name":"Dravidians","winCount":5,"defeatCount":20},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":19},{"id":202,"name":"Romans","winCount":0,"defeatCount":55},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":1},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":1},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":2,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64600,"highScoreMilitary":63655,"highScoreEconomy":22884,"highScoreTechnology":6963,"unitsKilled":212370,"unitsLost":218061,"buildingsRaised":23492,"buildingsLost":16081,"wondersBuilt":0,"castlesBuilt":4105,"trebsBuilt":4116,"farmsBuilt":42061},"user":{"userId":"","profileId":6160315,"userName":"[Vesper] House Rahadian","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/136036548525dfc8bff6506408669f6a10ed1b97_full.jpg","elo":862,"playerStanding":0.77,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-2	2	1	45.5	\N
18170626	tutu	18170626	30	\N	2024-11-27 14:54:06	1	https://avatars.steamstatic.com/475f9905fbd23c47f47bdb7ad3e8fd77b2646654_full.jpg	tutu	0	0	0	{"mpStatList":{"totalMatches":0,"totalWins":0,"currentWinStreak":0},"careerStats":{"totalGames":4,"totalWins":2,"civilizations":[{"id":3,"name":"Britons","winCount":1,"defeatCount":8},{"id":4,"name":"Franks","winCount":2,"defeatCount":0},{"id":5,"name":"Goths","winCount":2,"defeatCount":0},{"id":6,"name":"Teutons","winCount":1,"defeatCount":2},{"id":7,"name":"Japanese","winCount":0,"defeatCount":2},{"id":8,"name":"Chinese","winCount":1,"defeatCount":3},{"id":9,"name":"Byzantines","winCount":2,"defeatCount":3},{"id":10,"name":"Persians","winCount":0,"defeatCount":1},{"id":11,"name":"Saracens","winCount":0,"defeatCount":2},{"id":12,"name":"Turks","winCount":4,"defeatCount":1},{"id":13,"name":"Vikings","winCount":0,"defeatCount":1},{"id":14,"name":"Mongols","winCount":0,"defeatCount":2},{"id":15,"name":"Celts","winCount":10,"defeatCount":1},{"id":16,"name":"Spanish","winCount":2,"defeatCount":0},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":2},{"id":18,"name":"Mayans","winCount":0,"defeatCount":0},{"id":19,"name":"Huns","winCount":2,"defeatCount":3},{"id":20,"name":"Koreans","winCount":3,"defeatCount":2},{"id":21,"name":"Italians","winCount":2,"defeatCount":0},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":2},{"id":23,"name":"Incas","winCount":0,"defeatCount":2},{"id":24,"name":"Magyar","winCount":0,"defeatCount":0},{"id":25,"name":"Slavs","winCount":0,"defeatCount":2},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":3},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":1},{"id":28,"name":"Malians","winCount":1,"defeatCount":0},{"id":29,"name":"Berbers","winCount":1,"defeatCount":0},{"id":30,"name":"Khmer","winCount":2,"defeatCount":1},{"id":31,"name":"Malay","winCount":1,"defeatCount":2},{"id":32,"name":"Burmese","winCount":0,"defeatCount":1},{"id":33,"name":"Vietnamese","winCount":2,"defeatCount":1},{"id":34,"name":"Bulgarians","winCount":1,"defeatCount":1},{"id":35,"name":"Tatars","winCount":1,"defeatCount":0},{"id":36,"name":"Cumans","winCount":1,"defeatCount":2},{"id":37,"name":"Lithuanians","winCount":1,"defeatCount":0},{"id":38,"name":"Random","winCount":15,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":0},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":0},{"id":184,"name":"Poles","winCount":0,"defeatCount":0},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":0},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":0},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":19556,"highScoreMilitary":9736,"highScoreEconomy":5448,"highScoreTechnology":4611,"unitsKilled":3688,"unitsLost":3189,"buildingsRaised":584,"buildingsLost":36,"wondersBuilt":0,"castlesBuilt":24,"trebsBuilt":55,"farmsBuilt":1902},"user":{"userId":"","profileId":18170626,"userName":"tutu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/475f9905fbd23c47f47bdb7ad3e8fd77b2646654_full.jpg","elo":null,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	1	1	0	30.5	\N
8	Satpol PP	2670727	85	2023-02-24 07:19:59	2024-11-27 14:54:12	1	https://avatars.steamstatic.com/69af268d9d5c766ec7d26c718c9181df4fd865b2_full.jpg	Satpol PP	1351	1393	1425	{"mpStatList":{"totalMatches":1196,"totalWins":605,"currentWinStreak":2},"careerStats":{"totalGames":4840,"totalWins":2352,"civilizations":[{"id":3,"name":"Britons","winCount":48,"defeatCount":227},{"id":4,"name":"Franks","winCount":143,"defeatCount":276},{"id":5,"name":"Goths","winCount":68,"defeatCount":192},{"id":6,"name":"Teutons","winCount":44,"defeatCount":175},{"id":7,"name":"Japanese","winCount":48,"defeatCount":157},{"id":8,"name":"Chinese","winCount":38,"defeatCount":152},{"id":9,"name":"Byzantines","winCount":36,"defeatCount":161},{"id":10,"name":"Persians","winCount":52,"defeatCount":262},{"id":11,"name":"Saracens","winCount":43,"defeatCount":177},{"id":12,"name":"Turks","winCount":63,"defeatCount":169},{"id":13,"name":"Vikings","winCount":49,"defeatCount":197},{"id":14,"name":"Mongols","winCount":58,"defeatCount":308},{"id":15,"name":"Celts","winCount":66,"defeatCount":163},{"id":16,"name":"Spanish","winCount":118,"defeatCount":261},{"id":17,"name":"Aztecs","winCount":101,"defeatCount":149},{"id":18,"name":"Mayans","winCount":139,"defeatCount":215},{"id":19,"name":"Huns","winCount":188,"defeatCount":199},{"id":20,"name":"Koreans","winCount":49,"defeatCount":170},{"id":21,"name":"Italians","winCount":51,"defeatCount":166},{"id":22,"name":"Hindustanis","winCount":48,"defeatCount":196},{"id":23,"name":"Incas","winCount":77,"defeatCount":156},{"id":24,"name":"Magyar","winCount":94,"defeatCount":223},{"id":25,"name":"Slavs","winCount":41,"defeatCount":140},{"id":26,"name":"Portuguese","winCount":39,"defeatCount":178},{"id":27,"name":"Ethiopians","winCount":26,"defeatCount":183},{"id":28,"name":"Malians","winCount":49,"defeatCount":182},{"id":29,"name":"Berbers","winCount":37,"defeatCount":189},{"id":30,"name":"Khmer","winCount":45,"defeatCount":213},{"id":31,"name":"Malay","winCount":44,"defeatCount":148},{"id":32,"name":"Burmese","winCount":41,"defeatCount":160},{"id":33,"name":"Vietnamese","winCount":51,"defeatCount":190},{"id":34,"name":"Bulgarians","winCount":67,"defeatCount":142},{"id":35,"name":"Tatars","winCount":37,"defeatCount":164},{"id":36,"name":"Cumans","winCount":77,"defeatCount":178},{"id":37,"name":"Lithuanians","winCount":69,"defeatCount":236},{"id":38,"name":"Random","winCount":1315,"defeatCount":1646},{"id":174,"name":"Burgundians","winCount":34,"defeatCount":111},{"id":175,"name":"Sicilians","winCount":31,"defeatCount":110},{"id":184,"name":"Poles","winCount":16,"defeatCount":61},{"id":185,"name":"Bohemians","winCount":16,"defeatCount":74},{"id":195,"name":"Bengalis","winCount":12,"defeatCount":49},{"id":196,"name":"Dravidians","winCount":10,"defeatCount":47},{"id":197,"name":"Gurjaras","winCount":11,"defeatCount":45},{"id":202,"name":"Romans","winCount":0,"defeatCount":5},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":47963,"highScoreMilitary":55095,"highScoreEconomy":11827,"highScoreTechnology":6563,"unitsKilled":724012,"unitsLost":693247,"buildingsRaised":81910,"buildingsLost":55489,"wondersBuilt":0,"castlesBuilt":8750,"trebsBuilt":5368,"farmsBuilt":303264},"user":{"userId":"","profileId":2670727,"userName":"Satpol PP","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/69af268d9d5c766ec7d26c718c9181df4fd865b2_full.jpg","elo":1436,"playerStanding":0.07,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	45	5	8	9	84.5	\N
13	KC	2923822	85	2023-05-06 00:22:00	2024-11-27 14:54:24	1	https://avatars.steamstatic.com/9aed079d9ab88ecbb764b8f19b1d720fe8e7cf9f_full.jpg	KC	1556	1424	0	{"mpStatList":{"totalMatches":401,"totalWins":222,"currentWinStreak":1},"careerStats":{"totalGames":1193,"totalWins":661,"civilizations":[{"id":3,"name":"Britons","winCount":13,"defeatCount":69},{"id":4,"name":"Franks","winCount":13,"defeatCount":107},{"id":5,"name":"Goths","winCount":10,"defeatCount":47},{"id":6,"name":"Teutons","winCount":16,"defeatCount":28},{"id":7,"name":"Japanese","winCount":18,"defeatCount":28},{"id":8,"name":"Chinese","winCount":6,"defeatCount":25},{"id":9,"name":"Byzantines","winCount":19,"defeatCount":31},{"id":10,"name":"Persians","winCount":8,"defeatCount":47},{"id":11,"name":"Saracens","winCount":12,"defeatCount":34},{"id":12,"name":"Turks","winCount":12,"defeatCount":29},{"id":13,"name":"Vikings","winCount":17,"defeatCount":27},{"id":14,"name":"Mongols","winCount":57,"defeatCount":72},{"id":15,"name":"Celts","winCount":29,"defeatCount":19},{"id":16,"name":"Spanish","winCount":13,"defeatCount":44},{"id":17,"name":"Aztecs","winCount":27,"defeatCount":19},{"id":18,"name":"Mayans","winCount":34,"defeatCount":48},{"id":19,"name":"Huns","winCount":14,"defeatCount":37},{"id":20,"name":"Koreans","winCount":11,"defeatCount":24},{"id":21,"name":"Italians","winCount":22,"defeatCount":26},{"id":22,"name":"Hindustanis","winCount":16,"defeatCount":50},{"id":23,"name":"Incas","winCount":11,"defeatCount":24},{"id":24,"name":"Magyar","winCount":1,"defeatCount":36},{"id":25,"name":"Slavs","winCount":8,"defeatCount":19},{"id":26,"name":"Portuguese","winCount":13,"defeatCount":35},{"id":27,"name":"Ethiopians","winCount":10,"defeatCount":54},{"id":28,"name":"Malians","winCount":13,"defeatCount":26},{"id":29,"name":"Berbers","winCount":8,"defeatCount":24},{"id":30,"name":"Khmer","winCount":11,"defeatCount":43},{"id":31,"name":"Malay","winCount":14,"defeatCount":24},{"id":32,"name":"Burmese","winCount":9,"defeatCount":16},{"id":33,"name":"Vietnamese","winCount":9,"defeatCount":30},{"id":34,"name":"Bulgarians","winCount":8,"defeatCount":26},{"id":35,"name":"Tatars","winCount":16,"defeatCount":22},{"id":36,"name":"Cumans","winCount":8,"defeatCount":35},{"id":37,"name":"Lithuanians","winCount":23,"defeatCount":41},{"id":38,"name":"Random","winCount":276,"defeatCount":21},{"id":174,"name":"Burgundians","winCount":18,"defeatCount":26},{"id":175,"name":"Sicilians","winCount":7,"defeatCount":17},{"id":184,"name":"Poles","winCount":28,"defeatCount":40},{"id":185,"name":"Bohemians","winCount":14,"defeatCount":29},{"id":195,"name":"Bengalis","winCount":8,"defeatCount":13},{"id":196,"name":"Dravidians","winCount":9,"defeatCount":10},{"id":197,"name":"Gurjaras","winCount":23,"defeatCount":9},{"id":202,"name":"Romans","winCount":0,"defeatCount":2},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":51933,"highScoreMilitary":38399,"highScoreEconomy":10266,"highScoreTechnology":6165,"unitsKilled":119748,"unitsLost":120341,"buildingsRaised":8223,"buildingsLost":8022,"wondersBuilt":0,"castlesBuilt":1859,"trebsBuilt":1881,"farmsBuilt":72383},"user":{"userId":"","profileId":2923822,"userName":"KC","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/9aed079d9ab88ecbb764b8f19b1d720fe8e7cf9f_full.jpg","elo":1479,"playerStanding":0.05,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	1	-1	4	1	86.5	\N
18170648	Patrick	18841242	75	2024-10-23 04:42:52	2024-11-27 14:55:56	1	https://avatars.steamstatic.com/63087dd8c8325ceb7f08922ada2c80dc46147091_full.jpg	[OmG] Mr. Patrick	1447	0	1372	{"mpStatList":{"totalMatches":63,"totalWins":35,"currentWinStreak":3},"careerStats":{"totalGames":1363,"totalWins":654,"civilizations":[{"id":3,"name":"Britons","winCount":27,"defeatCount":82},{"id":4,"name":"Franks","winCount":12,"defeatCount":82},{"id":5,"name":"Goths","winCount":17,"defeatCount":71},{"id":6,"name":"Teutons","winCount":13,"defeatCount":79},{"id":7,"name":"Japanese","winCount":10,"defeatCount":58},{"id":8,"name":"Chinese","winCount":14,"defeatCount":46},{"id":9,"name":"Byzantines","winCount":17,"defeatCount":67},{"id":10,"name":"Persians","winCount":14,"defeatCount":89},{"id":11,"name":"Saracens","winCount":14,"defeatCount":72},{"id":12,"name":"Turks","winCount":14,"defeatCount":60},{"id":13,"name":"Vikings","winCount":23,"defeatCount":38},{"id":14,"name":"Mongols","winCount":200,"defeatCount":82},{"id":15,"name":"Celts","winCount":12,"defeatCount":57},{"id":16,"name":"Spanish","winCount":20,"defeatCount":91},{"id":17,"name":"Aztecs","winCount":14,"defeatCount":41},{"id":18,"name":"Mayans","winCount":37,"defeatCount":59},{"id":19,"name":"Huns","winCount":10,"defeatCount":81},{"id":20,"name":"Koreans","winCount":12,"defeatCount":58},{"id":21,"name":"Italians","winCount":17,"defeatCount":72},{"id":22,"name":"Hindustanis","winCount":12,"defeatCount":62},{"id":23,"name":"Incas","winCount":13,"defeatCount":69},{"id":24,"name":"Magyar","winCount":19,"defeatCount":61},{"id":25,"name":"Slavs","winCount":15,"defeatCount":64},{"id":26,"name":"Portuguese","winCount":14,"defeatCount":58},{"id":27,"name":"Ethiopians","winCount":13,"defeatCount":53},{"id":28,"name":"Malians","winCount":14,"defeatCount":53},{"id":29,"name":"Berbers","winCount":11,"defeatCount":49},{"id":30,"name":"Khmer","winCount":10,"defeatCount":71},{"id":31,"name":"Malay","winCount":15,"defeatCount":59},{"id":32,"name":"Burmese","winCount":10,"defeatCount":47},{"id":33,"name":"Vietnamese","winCount":17,"defeatCount":57},{"id":34,"name":"Bulgarians","winCount":17,"defeatCount":52},{"id":35,"name":"Tatars","winCount":12,"defeatCount":50},{"id":36,"name":"Cumans","winCount":11,"defeatCount":53},{"id":37,"name":"Lithuanians","winCount":14,"defeatCount":53},{"id":38,"name":"Random","winCount":408,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":22},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":35},{"id":184,"name":"Poles","winCount":0,"defeatCount":37},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":33},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":24},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":37},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":34},{"id":202,"name":"Romans","winCount":0,"defeatCount":21},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64668,"highScoreMilitary":54667,"highScoreEconomy":34186,"highScoreTechnology":7481,"unitsKilled":198736,"unitsLost":199574,"buildingsRaised":18205,"buildingsLost":16130,"wondersBuilt":0,"castlesBuilt":3673,"trebsBuilt":491,"farmsBuilt":10662},"user":{"userId":"","profileId":18841242,"userName":"[OmG] Mr. Patrick","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/63087dd8c8325ceb7f08922ada2c80dc46147091_full.jpg","elo":1379,"playerStanding":0.1,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	59	-1	0	0	0	\N
27	Kaipang	6215044	70	2023-02-10 01:33:33	2024-11-27 14:54:34	1	https://avatars.steamstatic.com/f1127d6776255af38cbe900b1dc3997fee81c9db_full.jpg	[OmG] Kaipang	1442	0	1313	{"mpStatList":{"totalMatches":172,"totalWins":113,"currentWinStreak":1},"careerStats":{"totalGames":872,"totalWins":464,"civilizations":[{"id":3,"name":"Britons","winCount":7,"defeatCount":51},{"id":4,"name":"Franks","winCount":9,"defeatCount":59},{"id":5,"name":"Goths","winCount":10,"defeatCount":43},{"id":6,"name":"Teutons","winCount":13,"defeatCount":33},{"id":7,"name":"Japanese","winCount":10,"defeatCount":33},{"id":8,"name":"Chinese","winCount":6,"defeatCount":33},{"id":9,"name":"Byzantines","winCount":10,"defeatCount":43},{"id":10,"name":"Persians","winCount":29,"defeatCount":65},{"id":11,"name":"Saracens","winCount":10,"defeatCount":39},{"id":12,"name":"Turks","winCount":9,"defeatCount":38},{"id":13,"name":"Vikings","winCount":33,"defeatCount":43},{"id":14,"name":"Mongols","winCount":7,"defeatCount":46},{"id":15,"name":"Celts","winCount":18,"defeatCount":38},{"id":16,"name":"Spanish","winCount":13,"defeatCount":50},{"id":17,"name":"Aztecs","winCount":10,"defeatCount":35},{"id":18,"name":"Mayans","winCount":9,"defeatCount":42},{"id":19,"name":"Huns","winCount":11,"defeatCount":29},{"id":20,"name":"Koreans","winCount":7,"defeatCount":39},{"id":21,"name":"Italians","winCount":2,"defeatCount":27},{"id":22,"name":"Hindustanis","winCount":22,"defeatCount":38},{"id":23,"name":"Incas","winCount":5,"defeatCount":34},{"id":24,"name":"Magyar","winCount":4,"defeatCount":40},{"id":25,"name":"Slavs","winCount":7,"defeatCount":38},{"id":26,"name":"Portuguese","winCount":7,"defeatCount":29},{"id":27,"name":"Ethiopians","winCount":12,"defeatCount":49},{"id":28,"name":"Malians","winCount":11,"defeatCount":42},{"id":29,"name":"Berbers","winCount":4,"defeatCount":32},{"id":30,"name":"Khmer","winCount":16,"defeatCount":42},{"id":31,"name":"Malay","winCount":8,"defeatCount":51},{"id":32,"name":"Burmese","winCount":8,"defeatCount":36},{"id":33,"name":"Vietnamese","winCount":11,"defeatCount":45},{"id":34,"name":"Bulgarians","winCount":16,"defeatCount":33},{"id":35,"name":"Tatars","winCount":13,"defeatCount":39},{"id":36,"name":"Cumans","winCount":24,"defeatCount":49},{"id":37,"name":"Lithuanians","winCount":11,"defeatCount":38},{"id":38,"name":"Random","winCount":319,"defeatCount":174},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":28},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":36},{"id":184,"name":"Poles","winCount":10,"defeatCount":33},{"id":185,"name":"Bohemians","winCount":21,"defeatCount":34},{"id":195,"name":"Bengalis","winCount":6,"defeatCount":21},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":13},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":13},{"id":202,"name":"Romans","winCount":0,"defeatCount":4},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":59683,"highScoreMilitary":44398,"highScoreEconomy":10947,"highScoreTechnology":5955,"unitsKilled":170023,"unitsLost":160982,"buildingsRaised":21326,"buildingsLost":13600,"wondersBuilt":0,"castlesBuilt":2316,"trebsBuilt":2407,"farmsBuilt":84970},"user":{"userId":"","profileId":6215044,"userName":"[OmG] Kaipang","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/f1127d6776255af38cbe900b1dc3997fee81c9db_full.jpg","elo":1334,"playerStanding":0.12,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	18	1	5	6	69.5	\N
39	Swarthoid	4256064	70	2023-02-24 07:37:11	2024-11-27 14:54:45	1	https://avatars.steamstatic.com/c7ce7bab3a352d27b2675b8327b9585c88ed8a79_full.jpg	[OmG]swarthoid_gooner	1365	1123	1176	{"mpStatList":{"totalMatches":217,"totalWins":113,"currentWinStreak":1},"careerStats":{"totalGames":1512,"totalWins":772,"civilizations":[{"id":3,"name":"Britons","winCount":14,"defeatCount":106},{"id":4,"name":"Franks","winCount":29,"defeatCount":156},{"id":5,"name":"Goths","winCount":37,"defeatCount":99},{"id":6,"name":"Teutons","winCount":12,"defeatCount":74},{"id":7,"name":"Japanese","winCount":15,"defeatCount":54},{"id":8,"name":"Chinese","winCount":9,"defeatCount":82},{"id":9,"name":"Byzantines","winCount":23,"defeatCount":99},{"id":10,"name":"Persians","winCount":14,"defeatCount":61},{"id":11,"name":"Saracens","winCount":33,"defeatCount":81},{"id":12,"name":"Turks","winCount":30,"defeatCount":63},{"id":13,"name":"Vikings","winCount":28,"defeatCount":39},{"id":14,"name":"Mongols","winCount":65,"defeatCount":105},{"id":15,"name":"Celts","winCount":40,"defeatCount":47},{"id":16,"name":"Spanish","winCount":14,"defeatCount":75},{"id":17,"name":"Aztecs","winCount":34,"defeatCount":49},{"id":18,"name":"Mayans","winCount":22,"defeatCount":62},{"id":19,"name":"Huns","winCount":22,"defeatCount":64},{"id":20,"name":"Koreans","winCount":9,"defeatCount":53},{"id":21,"name":"Italians","winCount":12,"defeatCount":89},{"id":22,"name":"Hindustanis","winCount":34,"defeatCount":56},{"id":23,"name":"Incas","winCount":42,"defeatCount":70},{"id":24,"name":"Magyar","winCount":16,"defeatCount":60},{"id":25,"name":"Slavs","winCount":18,"defeatCount":70},{"id":26,"name":"Portuguese","winCount":22,"defeatCount":51},{"id":27,"name":"Ethiopians","winCount":23,"defeatCount":93},{"id":28,"name":"Malians","winCount":125,"defeatCount":49},{"id":29,"name":"Berbers","winCount":18,"defeatCount":59},{"id":30,"name":"Khmer","winCount":14,"defeatCount":57},{"id":31,"name":"Malay","winCount":15,"defeatCount":79},{"id":32,"name":"Burmese","winCount":19,"defeatCount":48},{"id":33,"name":"Vietnamese","winCount":15,"defeatCount":55},{"id":34,"name":"Bulgarians","winCount":61,"defeatCount":65},{"id":35,"name":"Tatars","winCount":34,"defeatCount":54},{"id":36,"name":"Cumans","winCount":40,"defeatCount":64},{"id":37,"name":"Lithuanians","winCount":34,"defeatCount":70},{"id":38,"name":"Random","winCount":235,"defeatCount":153},{"id":174,"name":"Burgundians","winCount":15,"defeatCount":50},{"id":175,"name":"Sicilians","winCount":26,"defeatCount":45},{"id":184,"name":"Poles","winCount":24,"defeatCount":34},{"id":185,"name":"Bohemians","winCount":21,"defeatCount":32},{"id":195,"name":"Bengalis","winCount":8,"defeatCount":14},{"id":196,"name":"Dravidians","winCount":33,"defeatCount":26},{"id":197,"name":"Gurjaras","winCount":15,"defeatCount":41},{"id":202,"name":"Romans","winCount":23,"defeatCount":12},{"id":204,"name":"Pompeii_Assyrian","winCount":2,"defeatCount":1},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":1,"defeatCount":1},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":1,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":1,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":1,"defeatCount":1},{"id":218,"name":"Pompeii_Macedonian","winCount":1,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":1},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":1},{"id":224,"name":"Pompeii_Persian","winCount":1,"defeatCount":1},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":1},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":78880,"highScoreMilitary":46391,"highScoreEconomy":33946,"highScoreTechnology":12469,"unitsKilled":485023,"unitsLost":268047,"buildingsRaised":60286,"buildingsLost":20988,"wondersBuilt":24,"castlesBuilt":5062,"trebsBuilt":3133,"farmsBuilt":106887},"user":{"userId":"","profileId":4256064,"userName":"[OmG]swarthoid_gooner","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/c7ce7bab3a352d27b2675b8327b9585c88ed8a79_full.jpg","elo":1188,"playerStanding":0.26,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	37	-1	7	10	68.5	\N
5	Energic_Duck	1101756	95	2023-02-10 01:33:33	2024-11-27 14:56:09	1	https://avatars.steamstatic.com/b2d73d6106b4b2dbf4f103e403ef225ea32eee58_full.jpg	Energic_Duck	1591	1493	0	{"mpStatList":{"totalMatches":488,"totalWins":256,"currentWinStreak":1},"careerStats":{"totalGames":1191,"totalWins":675,"civilizations":[{"id":3,"name":"Britons","winCount":33,"defeatCount":64},{"id":4,"name":"Franks","winCount":39,"defeatCount":132},{"id":5,"name":"Goths","winCount":79,"defeatCount":61},{"id":6,"name":"Teutons","winCount":35,"defeatCount":79},{"id":7,"name":"Japanese","winCount":23,"defeatCount":28},{"id":8,"name":"Chinese","winCount":4,"defeatCount":36},{"id":9,"name":"Byzantines","winCount":9,"defeatCount":52},{"id":10,"name":"Persians","winCount":14,"defeatCount":62},{"id":11,"name":"Saracens","winCount":21,"defeatCount":39},{"id":12,"name":"Turks","winCount":8,"defeatCount":36},{"id":13,"name":"Vikings","winCount":20,"defeatCount":39},{"id":14,"name":"Mongols","winCount":43,"defeatCount":95},{"id":15,"name":"Celts","winCount":6,"defeatCount":40},{"id":16,"name":"Spanish","winCount":21,"defeatCount":41},{"id":17,"name":"Aztecs","winCount":10,"defeatCount":27},{"id":18,"name":"Mayans","winCount":11,"defeatCount":63},{"id":19,"name":"Huns","winCount":28,"defeatCount":38},{"id":20,"name":"Koreans","winCount":20,"defeatCount":17},{"id":21,"name":"Italians","winCount":12,"defeatCount":36},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":38},{"id":23,"name":"Incas","winCount":7,"defeatCount":30},{"id":24,"name":"Magyar","winCount":31,"defeatCount":51},{"id":25,"name":"Slavs","winCount":8,"defeatCount":69},{"id":26,"name":"Portuguese","winCount":7,"defeatCount":25},{"id":27,"name":"Ethiopians","winCount":31,"defeatCount":40},{"id":28,"name":"Malians","winCount":8,"defeatCount":17},{"id":29,"name":"Berbers","winCount":2,"defeatCount":23},{"id":30,"name":"Khmer","winCount":16,"defeatCount":53},{"id":31,"name":"Malay","winCount":11,"defeatCount":25},{"id":32,"name":"Burmese","winCount":17,"defeatCount":22},{"id":33,"name":"Vietnamese","winCount":8,"defeatCount":28},{"id":34,"name":"Bulgarians","winCount":25,"defeatCount":28},{"id":35,"name":"Tatars","winCount":14,"defeatCount":42},{"id":36,"name":"Cumans","winCount":28,"defeatCount":47},{"id":37,"name":"Lithuanians","winCount":64,"defeatCount":63},{"id":38,"name":"Random","winCount":131,"defeatCount":261},{"id":174,"name":"Burgundians","winCount":15,"defeatCount":12},{"id":175,"name":"Sicilians","winCount":15,"defeatCount":30},{"id":184,"name":"Poles","winCount":16,"defeatCount":8},{"id":185,"name":"Bohemians","winCount":8,"defeatCount":17},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":1},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":51590,"highScoreMilitary":36806,"highScoreEconomy":19819,"highScoreTechnology":6130,"unitsKilled":229975,"unitsLost":170430,"buildingsRaised":18871,"buildingsLost":9709,"wondersBuilt":10,"castlesBuilt":2684,"trebsBuilt":2746,"farmsBuilt":70808},"user":{"userId":"","profileId":1101756,"userName":"Energic_Duck","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/b2d73d6106b4b2dbf4f103e403ef225ea32eee58_full.jpg","elo":1399,"playerStanding":0.08,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	18	1	9	8	95.5	\N
43	Pev	421538	60	2023-02-10 01:33:33	2024-11-27 14:56:17	1	https://avatars.steamstatic.com/12754a73d164d92afc60d3db9bbe2714db659efd_full.jpg	[NoClan] Pev	1302	0	0	{"mpStatList":{"totalMatches":14,"totalWins":7,"currentWinStreak":2},"careerStats":{"totalGames":544,"totalWins":257,"civilizations":[{"id":3,"name":"Britons","winCount":86,"defeatCount":169},{"id":4,"name":"Franks","winCount":60,"defeatCount":249},{"id":5,"name":"Goths","winCount":44,"defeatCount":148},{"id":6,"name":"Teutons","winCount":141,"defeatCount":223},{"id":7,"name":"Japanese","winCount":108,"defeatCount":143},{"id":8,"name":"Chinese","winCount":16,"defeatCount":110},{"id":9,"name":"Byzantines","winCount":32,"defeatCount":171},{"id":10,"name":"Persians","winCount":10,"defeatCount":110},{"id":11,"name":"Saracens","winCount":28,"defeatCount":176},{"id":12,"name":"Turks","winCount":19,"defeatCount":135},{"id":13,"name":"Vikings","winCount":61,"defeatCount":106},{"id":14,"name":"Mongols","winCount":38,"defeatCount":121},{"id":15,"name":"Celts","winCount":27,"defeatCount":150},{"id":16,"name":"Spanish","winCount":28,"defeatCount":126},{"id":17,"name":"Aztecs","winCount":22,"defeatCount":89},{"id":18,"name":"Mayans","winCount":15,"defeatCount":93},{"id":19,"name":"Huns","winCount":44,"defeatCount":153},{"id":20,"name":"Koreans","winCount":12,"defeatCount":89},{"id":21,"name":"Italians","winCount":29,"defeatCount":139},{"id":22,"name":"Hindustanis","winCount":12,"defeatCount":122},{"id":23,"name":"Incas","winCount":11,"defeatCount":86},{"id":24,"name":"Magyar","winCount":44,"defeatCount":107},{"id":25,"name":"Slavs","winCount":22,"defeatCount":109},{"id":26,"name":"Portuguese","winCount":5,"defeatCount":109},{"id":27,"name":"Ethiopians","winCount":11,"defeatCount":130},{"id":28,"name":"Malians","winCount":7,"defeatCount":93},{"id":29,"name":"Berbers","winCount":16,"defeatCount":143},{"id":30,"name":"Khmer","winCount":15,"defeatCount":112},{"id":31,"name":"Malay","winCount":11,"defeatCount":144},{"id":32,"name":"Burmese","winCount":4,"defeatCount":105},{"id":33,"name":"Vietnamese","winCount":17,"defeatCount":109},{"id":34,"name":"Bulgarians","winCount":27,"defeatCount":137},{"id":35,"name":"Tatars","winCount":22,"defeatCount":144},{"id":36,"name":"Cumans","winCount":14,"defeatCount":119},{"id":37,"name":"Lithuanians","winCount":41,"defeatCount":130},{"id":38,"name":"Random","winCount":217,"defeatCount":1859},{"id":174,"name":"Burgundians","winCount":31,"defeatCount":100},{"id":175,"name":"Sicilians","winCount":66,"defeatCount":76},{"id":184,"name":"Poles","winCount":13,"defeatCount":43},{"id":185,"name":"Bohemians","winCount":18,"defeatCount":41},{"id":195,"name":"Bengalis","winCount":5,"defeatCount":9},{"id":196,"name":"Dravidians","winCount":1,"defeatCount":13},{"id":197,"name":"Gurjaras","winCount":1,"defeatCount":12},{"id":202,"name":"Romans","winCount":12,"defeatCount":8},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":66363,"highScoreMilitary":58332,"highScoreEconomy":22596,"highScoreTechnology":7810,"unitsKilled":810215,"unitsLost":317026,"buildingsRaised":161368,"buildingsLost":10182,"wondersBuilt":5,"castlesBuilt":5296,"trebsBuilt":3346,"farmsBuilt":139773},"user":{"userId":"","profileId":421538,"userName":"[NoClan] Pev","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/12754a73d164d92afc60d3db9bbe2714db659efd_full.jpg","elo":1031,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	30	-2	9	8	60.5	\N
41	Atsumu Miya	11443540	80	2023-03-16 21:59:28	2024-11-27 14:56:26	1	https://avatars.steamstatic.com/8c3a0aa77be130ee5a6bb57579c95a6ef79d7767_full.jpg	LowElo_Atsumu	1360	1238	1286	{"mpStatList":{"totalMatches":120,"totalWins":65,"currentWinStreak":4},"careerStats":{"totalGames":2307,"totalWins":1195,"civilizations":[{"id":3,"name":"Britons","winCount":220,"defeatCount":86},{"id":4,"name":"Franks","winCount":118,"defeatCount":135},{"id":5,"name":"Goths","winCount":24,"defeatCount":83},{"id":6,"name":"Teutons","winCount":44,"defeatCount":68},{"id":7,"name":"Japanese","winCount":36,"defeatCount":65},{"id":8,"name":"Chinese","winCount":20,"defeatCount":47},{"id":9,"name":"Byzantines","winCount":36,"defeatCount":86},{"id":10,"name":"Persians","winCount":34,"defeatCount":98},{"id":11,"name":"Saracens","winCount":18,"defeatCount":46},{"id":12,"name":"Turks","winCount":16,"defeatCount":63},{"id":13,"name":"Vikings","winCount":37,"defeatCount":41},{"id":14,"name":"Mongols","winCount":62,"defeatCount":150},{"id":15,"name":"Celts","winCount":22,"defeatCount":49},{"id":16,"name":"Spanish","winCount":26,"defeatCount":104},{"id":17,"name":"Aztecs","winCount":31,"defeatCount":45},{"id":18,"name":"Mayans","winCount":61,"defeatCount":73},{"id":19,"name":"Huns","winCount":54,"defeatCount":101},{"id":20,"name":"Koreans","winCount":16,"defeatCount":42},{"id":21,"name":"Italians","winCount":15,"defeatCount":53},{"id":22,"name":"Hindustanis","winCount":52,"defeatCount":64},{"id":23,"name":"Incas","winCount":8,"defeatCount":43},{"id":24,"name":"Magyar","winCount":47,"defeatCount":77},{"id":25,"name":"Slavs","winCount":17,"defeatCount":38},{"id":26,"name":"Portuguese","winCount":12,"defeatCount":70},{"id":27,"name":"Ethiopians","winCount":75,"defeatCount":61},{"id":28,"name":"Malians","winCount":14,"defeatCount":38},{"id":29,"name":"Berbers","winCount":24,"defeatCount":44},{"id":30,"name":"Khmer","winCount":32,"defeatCount":90},{"id":31,"name":"Malay","winCount":15,"defeatCount":54},{"id":32,"name":"Burmese","winCount":6,"defeatCount":32},{"id":33,"name":"Vietnamese","winCount":27,"defeatCount":53},{"id":34,"name":"Bulgarians","winCount":7,"defeatCount":44},{"id":35,"name":"Tatars","winCount":10,"defeatCount":59},{"id":36,"name":"Cumans","winCount":18,"defeatCount":55},{"id":37,"name":"Lithuanians","winCount":19,"defeatCount":50},{"id":38,"name":"Random","winCount":267,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":42},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":27},{"id":184,"name":"Poles","winCount":0,"defeatCount":53},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":49},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":14},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":24},{"id":197,"name":"Gurjaras","winCount":6,"defeatCount":40},{"id":202,"name":"Romans","winCount":0,"defeatCount":22},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":63373,"highScoreMilitary":61157,"highScoreEconomy":29012,"highScoreTechnology":7859,"unitsKilled":243621,"unitsLost":198647,"buildingsRaised":23510,"buildingsLost":10523,"wondersBuilt":4,"castlesBuilt":3746,"trebsBuilt":2129,"farmsBuilt":89180},"user":{"userId":"","profileId":11443540,"userName":"LowElo_Atsumu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/8c3a0aa77be130ee5a6bb57579c95a6ef79d7767_full.jpg","elo":1210,"playerStanding":0.24,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	33	3	9	8	80.5	\N
18170639	KODOMO SAKIT	20067454	65	2024-10-09 01:05:57	2024-11-27 14:54:51	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	KABINET MERAH PUTIH	1142	0	1038	{"mpStatList":{"totalMatches":1196,"totalWins":595,"currentWinStreak":0},"careerStats":{"totalGames":1116,"totalWins":571,"civilizations":[{"id":3,"name":"Britons","winCount":14,"defeatCount":76},{"id":4,"name":"Franks","winCount":12,"defeatCount":140},{"id":5,"name":"Goths","winCount":6,"defeatCount":77},{"id":6,"name":"Teutons","winCount":8,"defeatCount":80},{"id":7,"name":"Japanese","winCount":7,"defeatCount":47},{"id":8,"name":"Chinese","winCount":14,"defeatCount":54},{"id":9,"name":"Byzantines","winCount":10,"defeatCount":56},{"id":10,"name":"Persians","winCount":52,"defeatCount":128},{"id":11,"name":"Saracens","winCount":18,"defeatCount":50},{"id":12,"name":"Turks","winCount":21,"defeatCount":81},{"id":13,"name":"Vikings","winCount":4,"defeatCount":39},{"id":14,"name":"Mongols","winCount":79,"defeatCount":116},{"id":15,"name":"Celts","winCount":5,"defeatCount":60},{"id":16,"name":"Spanish","winCount":35,"defeatCount":98},{"id":17,"name":"Aztecs","winCount":4,"defeatCount":15},{"id":18,"name":"Mayans","winCount":13,"defeatCount":34},{"id":19,"name":"Huns","winCount":22,"defeatCount":102},{"id":20,"name":"Koreans","winCount":4,"defeatCount":39},{"id":21,"name":"Italians","winCount":16,"defeatCount":52},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":50},{"id":23,"name":"Incas","winCount":6,"defeatCount":31},{"id":24,"name":"Magyar","winCount":4,"defeatCount":57},{"id":25,"name":"Slavs","winCount":5,"defeatCount":31},{"id":26,"name":"Portuguese","winCount":24,"defeatCount":56},{"id":27,"name":"Ethiopians","winCount":35,"defeatCount":50},{"id":28,"name":"Malians","winCount":3,"defeatCount":28},{"id":29,"name":"Berbers","winCount":10,"defeatCount":28},{"id":30,"name":"Khmer","winCount":25,"defeatCount":87},{"id":31,"name":"Malay","winCount":9,"defeatCount":39},{"id":32,"name":"Burmese","winCount":2,"defeatCount":11},{"id":33,"name":"Vietnamese","winCount":32,"defeatCount":63},{"id":34,"name":"Bulgarians","winCount":2,"defeatCount":27},{"id":35,"name":"Tatars","winCount":3,"defeatCount":30},{"id":36,"name":"Cumans","winCount":8,"defeatCount":55},{"id":37,"name":"Lithuanians","winCount":23,"defeatCount":40},{"id":38,"name":"Random","winCount":42,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":46},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":26},{"id":184,"name":"Poles","winCount":17,"defeatCount":39},{"id":185,"name":"Bohemians","winCount":40,"defeatCount":56},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":18},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":21},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":21},{"id":202,"name":"Romans","winCount":44,"defeatCount":43},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":6},{"id":206,"name":"Pompeii_Babylonian","winCount":2,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":2},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":1},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":2,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":1},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":1},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":1},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":57220,"highScoreMilitary":31523,"highScoreEconomy":18604,"highScoreTechnology":7145,"unitsKilled":148343,"unitsLost":158281,"buildingsRaised":14202,"buildingsLost":18790,"wondersBuilt":0,"castlesBuilt":2822,"trebsBuilt":608,"farmsBuilt":3204},"user":{"userId":"","profileId":20067454,"userName":"KABINET MERAH PUTIH","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1063,"playerStanding":0.46,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	1	-2	0	0	0	\N
64	Goodorbad	1557172	60	2023-05-31 20:17:03	2024-11-27 14:56:30	1	https://avatars.steamstatic.com/601bc18dba96133dfda245b72159a016acd10ad1_full.jpg	Goodorbad	1115	0	0	{"mpStatList":{"totalMatches":1,"totalWins":1,"currentWinStreak":1},"careerStats":{"totalGames":88,"totalWins":48,"civilizations":[{"id":3,"name":"Britons","winCount":10,"defeatCount":25},{"id":4,"name":"Franks","winCount":6,"defeatCount":26},{"id":5,"name":"Goths","winCount":8,"defeatCount":18},{"id":6,"name":"Teutons","winCount":16,"defeatCount":30},{"id":7,"name":"Japanese","winCount":27,"defeatCount":16},{"id":8,"name":"Chinese","winCount":2,"defeatCount":7},{"id":9,"name":"Byzantines","winCount":19,"defeatCount":8},{"id":10,"name":"Persians","winCount":2,"defeatCount":7},{"id":11,"name":"Saracens","winCount":5,"defeatCount":15},{"id":12,"name":"Turks","winCount":2,"defeatCount":7},{"id":13,"name":"Vikings","winCount":7,"defeatCount":7},{"id":14,"name":"Mongols","winCount":7,"defeatCount":18},{"id":15,"name":"Celts","winCount":18,"defeatCount":3},{"id":16,"name":"Spanish","winCount":2,"defeatCount":6},{"id":17,"name":"Aztecs","winCount":3,"defeatCount":11},{"id":18,"name":"Mayans","winCount":2,"defeatCount":9},{"id":19,"name":"Huns","winCount":1,"defeatCount":6},{"id":20,"name":"Koreans","winCount":2,"defeatCount":5},{"id":21,"name":"Italians","winCount":3,"defeatCount":14},{"id":22,"name":"Hindustanis","winCount":4,"defeatCount":6},{"id":23,"name":"Incas","winCount":2,"defeatCount":12},{"id":24,"name":"Magyar","winCount":6,"defeatCount":12},{"id":25,"name":"Slavs","winCount":2,"defeatCount":18},{"id":26,"name":"Portuguese","winCount":3,"defeatCount":6},{"id":27,"name":"Ethiopians","winCount":7,"defeatCount":9},{"id":28,"name":"Malians","winCount":2,"defeatCount":7},{"id":29,"name":"Berbers","winCount":5,"defeatCount":10},{"id":30,"name":"Khmer","winCount":2,"defeatCount":4},{"id":31,"name":"Malay","winCount":4,"defeatCount":8},{"id":32,"name":"Burmese","winCount":1,"defeatCount":2},{"id":33,"name":"Vietnamese","winCount":3,"defeatCount":6},{"id":34,"name":"Bulgarians","winCount":9,"defeatCount":6},{"id":35,"name":"Tatars","winCount":4,"defeatCount":13},{"id":36,"name":"Cumans","winCount":14,"defeatCount":18},{"id":37,"name":"Lithuanians","winCount":2,"defeatCount":8},{"id":38,"name":"Random","winCount":12,"defeatCount":92},{"id":174,"name":"Burgundians","winCount":1,"defeatCount":2},{"id":175,"name":"Sicilians","winCount":1,"defeatCount":6},{"id":184,"name":"Poles","winCount":1,"defeatCount":3},{"id":185,"name":"Bohemians","winCount":1,"defeatCount":1},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":1},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":0},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":47409,"highScoreMilitary":37589,"highScoreEconomy":17614,"highScoreTechnology":6220,"unitsKilled":60699,"unitsLost":39137,"buildingsRaised":6225,"buildingsLost":1731,"wondersBuilt":4,"castlesBuilt":485,"trebsBuilt":258,"farmsBuilt":25126},"user":{"userId":"","profileId":1557172,"userName":"Goodorbad","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/601bc18dba96133dfda245b72159a016acd10ad1_full.jpg","elo":917,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	2	2	3	0	61.5	\N
28	The Godeg's	2793371	70	2023-02-10 01:33:33	2024-11-27 14:55:03	1	https://avatars.steamstatic.com/f769601209c700a14841f0f088d311ac31c6a0d2_full.jpg	Godeg's	1419	0	0	{"mpStatList":{"totalMatches":189,"totalWins":91,"currentWinStreak":0},"careerStats":{"totalGames":1715,"totalWins":801,"civilizations":[{"id":3,"name":"Britons","winCount":73,"defeatCount":274},{"id":4,"name":"Franks","winCount":120,"defeatCount":266},{"id":5,"name":"Goths","winCount":101,"defeatCount":255},{"id":6,"name":"Teutons","winCount":56,"defeatCount":235},{"id":7,"name":"Japanese","winCount":73,"defeatCount":237},{"id":8,"name":"Chinese","winCount":67,"defeatCount":226},{"id":9,"name":"Byzantines","winCount":56,"defeatCount":242},{"id":10,"name":"Persians","winCount":44,"defeatCount":253},{"id":11,"name":"Saracens","winCount":53,"defeatCount":253},{"id":12,"name":"Turks","winCount":50,"defeatCount":259},{"id":13,"name":"Vikings","winCount":59,"defeatCount":212},{"id":14,"name":"Mongols","winCount":60,"defeatCount":234},{"id":15,"name":"Celts","winCount":62,"defeatCount":218},{"id":16,"name":"Spanish","winCount":64,"defeatCount":250},{"id":17,"name":"Aztecs","winCount":64,"defeatCount":212},{"id":18,"name":"Mayans","winCount":53,"defeatCount":253},{"id":19,"name":"Huns","winCount":55,"defeatCount":242},{"id":20,"name":"Koreans","winCount":57,"defeatCount":224},{"id":21,"name":"Italians","winCount":71,"defeatCount":222},{"id":22,"name":"Hindustanis","winCount":44,"defeatCount":228},{"id":23,"name":"Incas","winCount":33,"defeatCount":211},{"id":24,"name":"Magyar","winCount":43,"defeatCount":229},{"id":25,"name":"Slavs","winCount":58,"defeatCount":225},{"id":26,"name":"Portuguese","winCount":47,"defeatCount":252},{"id":27,"name":"Ethiopians","winCount":56,"defeatCount":230},{"id":28,"name":"Malians","winCount":60,"defeatCount":213},{"id":29,"name":"Berbers","winCount":69,"defeatCount":242},{"id":30,"name":"Khmer","winCount":75,"defeatCount":251},{"id":31,"name":"Malay","winCount":42,"defeatCount":248},{"id":32,"name":"Burmese","winCount":50,"defeatCount":226},{"id":33,"name":"Vietnamese","winCount":48,"defeatCount":265},{"id":34,"name":"Bulgarians","winCount":49,"defeatCount":243},{"id":35,"name":"Tatars","winCount":52,"defeatCount":212},{"id":36,"name":"Cumans","winCount":69,"defeatCount":216},{"id":37,"name":"Lithuanians","winCount":80,"defeatCount":239},{"id":38,"name":"Random","winCount":1433,"defeatCount":3300},{"id":174,"name":"Burgundians","winCount":43,"defeatCount":179},{"id":175,"name":"Sicilians","winCount":71,"defeatCount":165},{"id":184,"name":"Poles","winCount":38,"defeatCount":116},{"id":185,"name":"Bohemians","winCount":23,"defeatCount":121},{"id":195,"name":"Bengalis","winCount":20,"defeatCount":60},{"id":196,"name":"Dravidians","winCount":14,"defeatCount":67},{"id":197,"name":"Gurjaras","winCount":16,"defeatCount":59},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":71284,"highScoreMilitary":60513,"highScoreEconomy":19303,"highScoreTechnology":12048,"unitsKilled":1407207,"unitsLost":932914,"buildingsRaised":207054,"buildingsLost":47829,"wondersBuilt":10,"castlesBuilt":16976,"trebsBuilt":11132,"farmsBuilt":377997},"user":{"userId":"","profileId":2793371,"userName":"Godeg's","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/f769601209c700a14841f0f088d311ac31c6a0d2_full.jpg","elo":1204,"playerStanding":0.22,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	40	-6	10	7	71.5	\N
1054	Goldberry 	10184599	60	2023-02-10 01:33:33	2024-11-27 14:56:37	1	https://avatars.steamstatic.com/2b106fb47460f59bdf8250aafc9b9919a8605e02_full.jpg	Goldberry	1110	0	0	{"mpStatList":{"totalMatches":0,"totalWins":0,"currentWinStreak":0},"careerStats":{"totalGames":254,"totalWins":145,"civilizations":[{"id":3,"name":"Britons","winCount":5,"defeatCount":33},{"id":4,"name":"Franks","winCount":10,"defeatCount":44},{"id":5,"name":"Goths","winCount":11,"defeatCount":35},{"id":6,"name":"Teutons","winCount":7,"defeatCount":33},{"id":7,"name":"Japanese","winCount":13,"defeatCount":34},{"id":8,"name":"Chinese","winCount":5,"defeatCount":28},{"id":9,"name":"Byzantines","winCount":11,"defeatCount":44},{"id":10,"name":"Persians","winCount":7,"defeatCount":30},{"id":11,"name":"Saracens","winCount":4,"defeatCount":43},{"id":12,"name":"Turks","winCount":7,"defeatCount":43},{"id":13,"name":"Vikings","winCount":24,"defeatCount":31},{"id":14,"name":"Mongols","winCount":10,"defeatCount":41},{"id":15,"name":"Celts","winCount":13,"defeatCount":39},{"id":16,"name":"Spanish","winCount":12,"defeatCount":40},{"id":17,"name":"Aztecs","winCount":12,"defeatCount":35},{"id":18,"name":"Mayans","winCount":5,"defeatCount":29},{"id":19,"name":"Huns","winCount":10,"defeatCount":28},{"id":20,"name":"Koreans","winCount":10,"defeatCount":34},{"id":21,"name":"Italians","winCount":4,"defeatCount":45},{"id":22,"name":"Hindustanis","winCount":10,"defeatCount":31},{"id":23,"name":"Incas","winCount":9,"defeatCount":25},{"id":24,"name":"Magyar","winCount":12,"defeatCount":38},{"id":25,"name":"Slavs","winCount":11,"defeatCount":29},{"id":26,"name":"Portuguese","winCount":12,"defeatCount":38},{"id":27,"name":"Ethiopians","winCount":9,"defeatCount":29},{"id":28,"name":"Malians","winCount":5,"defeatCount":40},{"id":29,"name":"Berbers","winCount":4,"defeatCount":44},{"id":30,"name":"Khmer","winCount":12,"defeatCount":31},{"id":31,"name":"Malay","winCount":9,"defeatCount":37},{"id":32,"name":"Burmese","winCount":9,"defeatCount":37},{"id":33,"name":"Vietnamese","winCount":9,"defeatCount":42},{"id":34,"name":"Bulgarians","winCount":11,"defeatCount":35},{"id":35,"name":"Tatars","winCount":12,"defeatCount":45},{"id":36,"name":"Cumans","winCount":11,"defeatCount":41},{"id":37,"name":"Lithuanians","winCount":12,"defeatCount":34},{"id":38,"name":"Random","winCount":276,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":11,"defeatCount":27},{"id":175,"name":"Sicilians","winCount":7,"defeatCount":31},{"id":184,"name":"Poles","winCount":8,"defeatCount":35},{"id":185,"name":"Bohemians","winCount":6,"defeatCount":36},{"id":195,"name":"Bengalis","winCount":11,"defeatCount":36},{"id":196,"name":"Dravidians","winCount":6,"defeatCount":38},{"id":197,"name":"Gurjaras","winCount":9,"defeatCount":40},{"id":202,"name":"Romans","winCount":6,"defeatCount":24},{"id":204,"name":"Pompeii_Assyrian","winCount":2,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":2,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":1},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":1},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":1},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":1},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":1},{"id":230,"name":"Pompeii_Shang","winCount":2,"defeatCount":1},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":1}],"highScoreTotal":65428,"highScoreMilitary":63452,"highScoreEconomy":26994,"highScoreTechnology":13711,"unitsKilled":367147,"unitsLost":196326,"buildingsRaised":60147,"buildingsLost":7152,"wondersBuilt":0,"castlesBuilt":3409,"trebsBuilt":1319,"farmsBuilt":60202},"user":{"userId":"","profileId":10184599,"userName":"Goldberry","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/2b106fb47460f59bdf8250aafc9b9919a8605e02_full.jpg","elo":null,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	5	-2	4	7	58.5	\N
18170646	Mlempem	18415063	45	2024-10-21 05:23:44	2024-11-27 14:55:12	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	Mlempem	1194	0	710	{"mpStatList":{"totalMatches":160,"totalWins":55,"currentWinStreak":1},"careerStats":{"totalGames":414,"totalWins":176,"civilizations":[{"id":3,"name":"Britons","winCount":2,"defeatCount":41},{"id":4,"name":"Franks","winCount":1,"defeatCount":46},{"id":5,"name":"Goths","winCount":2,"defeatCount":26},{"id":6,"name":"Teutons","winCount":0,"defeatCount":37},{"id":7,"name":"Japanese","winCount":0,"defeatCount":15},{"id":8,"name":"Chinese","winCount":0,"defeatCount":20},{"id":9,"name":"Byzantines","winCount":2,"defeatCount":16},{"id":10,"name":"Persians","winCount":70,"defeatCount":36},{"id":11,"name":"Saracens","winCount":0,"defeatCount":9},{"id":12,"name":"Turks","winCount":3,"defeatCount":24},{"id":13,"name":"Vikings","winCount":3,"defeatCount":12},{"id":14,"name":"Mongols","winCount":2,"defeatCount":31},{"id":15,"name":"Celts","winCount":2,"defeatCount":22},{"id":16,"name":"Spanish","winCount":2,"defeatCount":21},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":6},{"id":18,"name":"Mayans","winCount":0,"defeatCount":14},{"id":19,"name":"Huns","winCount":0,"defeatCount":31},{"id":20,"name":"Koreans","winCount":2,"defeatCount":9},{"id":21,"name":"Italians","winCount":0,"defeatCount":16},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":15},{"id":23,"name":"Incas","winCount":0,"defeatCount":8},{"id":24,"name":"Magyar","winCount":11,"defeatCount":10},{"id":25,"name":"Slavs","winCount":24,"defeatCount":11},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":23},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":8},{"id":28,"name":"Malians","winCount":0,"defeatCount":5},{"id":29,"name":"Berbers","winCount":6,"defeatCount":8},{"id":30,"name":"Khmer","winCount":0,"defeatCount":43},{"id":31,"name":"Malay","winCount":4,"defeatCount":11},{"id":32,"name":"Burmese","winCount":0,"defeatCount":1},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":19},{"id":34,"name":"Bulgarians","winCount":26,"defeatCount":6},{"id":35,"name":"Tatars","winCount":3,"defeatCount":14},{"id":36,"name":"Cumans","winCount":2,"defeatCount":12},{"id":37,"name":"Lithuanians","winCount":2,"defeatCount":11},{"id":38,"name":"Random","winCount":7,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":5,"defeatCount":11},{"id":175,"name":"Sicilians","winCount":6,"defeatCount":4},{"id":184,"name":"Poles","winCount":4,"defeatCount":14},{"id":185,"name":"Bohemians","winCount":2,"defeatCount":30},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":3},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":2},{"id":197,"name":"Gurjaras","winCount":7,"defeatCount":5},{"id":202,"name":"Romans","winCount":8,"defeatCount":13},{"id":204,"name":"Pompeii_Assyrian","winCount":3,"defeatCount":1},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":45766,"highScoreMilitary":57783,"highScoreEconomy":18237,"highScoreTechnology":6411,"unitsKilled":43178,"unitsLost":75804,"buildingsRaised":3434,"buildingsLost":9597,"wondersBuilt":3,"castlesBuilt":1088,"trebsBuilt":317,"farmsBuilt":2791},"user":{"userId":"","profileId":18415063,"userName":"Mlempem","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":733,"playerStanding":0.92,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	1	0	0	0	\N
22	Mas Guru	9602121	70	2023-05-05 23:38:25	2024-11-27 14:56:44	1	https://avatars.steamstatic.com/1ef9d88c16eb3845299bf873e3b025da08e3f85c_full.jpg	Mas GURU	1491	0	1237	{"mpStatList":{"totalMatches":23,"totalWins":12,"currentWinStreak":1},"careerStats":{"totalGames":157,"totalWins":87,"civilizations":[{"id":3,"name":"Britons","winCount":0,"defeatCount":7},{"id":4,"name":"Franks","winCount":1,"defeatCount":16},{"id":5,"name":"Goths","winCount":1,"defeatCount":7},{"id":6,"name":"Teutons","winCount":0,"defeatCount":7},{"id":7,"name":"Japanese","winCount":0,"defeatCount":8},{"id":8,"name":"Chinese","winCount":0,"defeatCount":6},{"id":9,"name":"Byzantines","winCount":2,"defeatCount":7},{"id":10,"name":"Persians","winCount":6,"defeatCount":10},{"id":11,"name":"Saracens","winCount":2,"defeatCount":8},{"id":12,"name":"Turks","winCount":1,"defeatCount":15},{"id":13,"name":"Vikings","winCount":5,"defeatCount":4},{"id":14,"name":"Mongols","winCount":2,"defeatCount":9},{"id":15,"name":"Celts","winCount":4,"defeatCount":6},{"id":16,"name":"Spanish","winCount":1,"defeatCount":6},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":3},{"id":18,"name":"Mayans","winCount":0,"defeatCount":7},{"id":19,"name":"Huns","winCount":3,"defeatCount":2},{"id":20,"name":"Koreans","winCount":3,"defeatCount":6},{"id":21,"name":"Italians","winCount":2,"defeatCount":3},{"id":22,"name":"Hindustanis","winCount":1,"defeatCount":8},{"id":23,"name":"Incas","winCount":2,"defeatCount":7},{"id":24,"name":"Magyar","winCount":2,"defeatCount":4},{"id":25,"name":"Slavs","winCount":4,"defeatCount":4},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":6},{"id":27,"name":"Ethiopians","winCount":2,"defeatCount":5},{"id":28,"name":"Malians","winCount":0,"defeatCount":4},{"id":29,"name":"Berbers","winCount":1,"defeatCount":3},{"id":30,"name":"Khmer","winCount":1,"defeatCount":10},{"id":31,"name":"Malay","winCount":2,"defeatCount":11},{"id":32,"name":"Burmese","winCount":1,"defeatCount":6},{"id":33,"name":"Vietnamese","winCount":1,"defeatCount":3},{"id":34,"name":"Bulgarians","winCount":2,"defeatCount":4},{"id":35,"name":"Tatars","winCount":2,"defeatCount":6},{"id":36,"name":"Cumans","winCount":4,"defeatCount":1},{"id":37,"name":"Lithuanians","winCount":2,"defeatCount":4},{"id":38,"name":"Random","winCount":56,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":1,"defeatCount":1},{"id":175,"name":"Sicilians","winCount":12,"defeatCount":4},{"id":184,"name":"Poles","winCount":5,"defeatCount":7},{"id":185,"name":"Bohemians","winCount":4,"defeatCount":11},{"id":195,"name":"Bengalis","winCount":1,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":2,"defeatCount":5},{"id":197,"name":"Gurjaras","winCount":2,"defeatCount":3},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":46108,"highScoreMilitary":61306,"highScoreEconomy":13970,"highScoreTechnology":6210,"unitsKilled":31729,"unitsLost":27289,"buildingsRaised":3004,"buildingsLost":1522,"wondersBuilt":0,"castlesBuilt":489,"trebsBuilt":476,"farmsBuilt":13523},"user":{"userId":"","profileId":9602121,"userName":"Mas GURU","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/1ef9d88c16eb3845299bf873e3b025da08e3f85c_full.jpg","elo":1114,"playerStanding":0.35,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	1	-1	9	8	70.5	\N
18170644	Loka	21059248	60	2024-10-18 16:49:44	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	[OmG]_fr33man_Nubie	1373	0	0	{"mpStatList":{"totalMatches":2,"totalWins":1,"currentWinStreak":1},"careerStats":{"totalGames":13,"totalWins":9,"civilizations":[{"id":3,"name":"Britons","winCount":3,"defeatCount":1},{"id":4,"name":"Franks","winCount":0,"defeatCount":1},{"id":5,"name":"Goths","winCount":2,"defeatCount":1},{"id":6,"name":"Teutons","winCount":0,"defeatCount":2},{"id":7,"name":"Japanese","winCount":0,"defeatCount":1},{"id":8,"name":"Chinese","winCount":0,"defeatCount":1},{"id":9,"name":"Byzantines","winCount":0,"defeatCount":1},{"id":10,"name":"Persians","winCount":2,"defeatCount":2},{"id":11,"name":"Saracens","winCount":0,"defeatCount":1},{"id":12,"name":"Turks","winCount":3,"defeatCount":1},{"id":13,"name":"Vikings","winCount":2,"defeatCount":0},{"id":14,"name":"Mongols","winCount":2,"defeatCount":1},{"id":15,"name":"Celts","winCount":0,"defeatCount":1},{"id":16,"name":"Spanish","winCount":0,"defeatCount":3},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":2},{"id":18,"name":"Mayans","winCount":0,"defeatCount":1},{"id":19,"name":"Huns","winCount":0,"defeatCount":1},{"id":20,"name":"Koreans","winCount":3,"defeatCount":2},{"id":21,"name":"Italians","winCount":0,"defeatCount":0},{"id":22,"name":"Hindustanis","winCount":2,"defeatCount":0},{"id":23,"name":"Incas","winCount":0,"defeatCount":3},{"id":24,"name":"Magyar","winCount":2,"defeatCount":1},{"id":25,"name":"Slavs","winCount":2,"defeatCount":1},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":0},{"id":27,"name":"Ethiopians","winCount":2,"defeatCount":1},{"id":28,"name":"Malians","winCount":0,"defeatCount":3},{"id":29,"name":"Berbers","winCount":2,"defeatCount":0},{"id":30,"name":"Khmer","winCount":0,"defeatCount":4},{"id":31,"name":"Malay","winCount":3,"defeatCount":1},{"id":32,"name":"Burmese","winCount":1,"defeatCount":3},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":3},{"id":34,"name":"Bulgarians","winCount":2,"defeatCount":2},{"id":35,"name":"Tatars","winCount":0,"defeatCount":2},{"id":36,"name":"Cumans","winCount":2,"defeatCount":2},{"id":37,"name":"Lithuanians","winCount":3,"defeatCount":1},{"id":38,"name":"Random","winCount":20,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":0},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":0},{"id":184,"name":"Poles","winCount":0,"defeatCount":0},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":0},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":1},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":21495,"highScoreMilitary":11114,"highScoreEconomy":12978,"highScoreTechnology":4327,"unitsKilled":6326,"unitsLost":5346,"buildingsRaised":553,"buildingsLost":413,"wondersBuilt":0,"castlesBuilt":85,"trebsBuilt":57,"farmsBuilt":1015},"user":{"userId":"","profileId":21059248,"userName":"[OmG]_fr33man_Nubie","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1055,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	2	-2	0	0	0	\N
10	Chess	781607	85	2023-02-10 01:33:33	2024-11-27 14:57:05	1	https://avatars.steamstatic.com/3c4094efc8a9a738df7996f3b3338f22da57c093_full.jpg	LowElo_Keju	1323	1314	1384	{"mpStatList":{"totalMatches":892,"totalWins":446,"currentWinStreak":9},"careerStats":{"totalGames":3873,"totalWins":1946,"civilizations":[{"id":3,"name":"Britons","winCount":97,"defeatCount":248},{"id":4,"name":"Franks","winCount":49,"defeatCount":278},{"id":5,"name":"Goths","winCount":27,"defeatCount":185},{"id":6,"name":"Teutons","winCount":66,"defeatCount":208},{"id":7,"name":"Japanese","winCount":150,"defeatCount":143},{"id":8,"name":"Chinese","winCount":34,"defeatCount":208},{"id":9,"name":"Byzantines","winCount":43,"defeatCount":145},{"id":10,"name":"Persians","winCount":49,"defeatCount":196},{"id":11,"name":"Saracens","winCount":80,"defeatCount":176},{"id":12,"name":"Turks","winCount":29,"defeatCount":154},{"id":13,"name":"Vikings","winCount":32,"defeatCount":124},{"id":14,"name":"Mongols","winCount":84,"defeatCount":242},{"id":15,"name":"Celts","winCount":44,"defeatCount":159},{"id":16,"name":"Spanish","winCount":52,"defeatCount":199},{"id":17,"name":"Aztecs","winCount":189,"defeatCount":141},{"id":18,"name":"Mayans","winCount":84,"defeatCount":161},{"id":19,"name":"Huns","winCount":42,"defeatCount":169},{"id":20,"name":"Koreans","winCount":45,"defeatCount":130},{"id":21,"name":"Italians","winCount":41,"defeatCount":135},{"id":22,"name":"Hindustanis","winCount":64,"defeatCount":172},{"id":23,"name":"Incas","winCount":31,"defeatCount":137},{"id":24,"name":"Magyar","winCount":40,"defeatCount":130},{"id":25,"name":"Slavs","winCount":61,"defeatCount":115},{"id":26,"name":"Portuguese","winCount":24,"defeatCount":160},{"id":27,"name":"Ethiopians","winCount":98,"defeatCount":199},{"id":28,"name":"Malians","winCount":36,"defeatCount":134},{"id":29,"name":"Berbers","winCount":42,"defeatCount":139},{"id":30,"name":"Khmer","winCount":37,"defeatCount":182},{"id":31,"name":"Malay","winCount":38,"defeatCount":136},{"id":32,"name":"Burmese","winCount":29,"defeatCount":131},{"id":33,"name":"Vietnamese","winCount":108,"defeatCount":137},{"id":34,"name":"Bulgarians","winCount":31,"defeatCount":123},{"id":35,"name":"Tatars","winCount":47,"defeatCount":136},{"id":36,"name":"Cumans","winCount":30,"defeatCount":149},{"id":37,"name":"Lithuanians","winCount":42,"defeatCount":150},{"id":38,"name":"Random","winCount":1020,"defeatCount":224},{"id":174,"name":"Burgundians","winCount":31,"defeatCount":111},{"id":175,"name":"Sicilians","winCount":32,"defeatCount":98},{"id":184,"name":"Poles","winCount":22,"defeatCount":120},{"id":185,"name":"Bohemians","winCount":14,"defeatCount":125},{"id":195,"name":"Bengalis","winCount":19,"defeatCount":70},{"id":196,"name":"Dravidians","winCount":28,"defeatCount":83},{"id":197,"name":"Gurjaras","winCount":34,"defeatCount":75},{"id":202,"name":"Romans","winCount":0,"defeatCount":30},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":65313,"highScoreMilitary":53140,"highScoreEconomy":40392,"highScoreTechnology":9709,"unitsKilled":681648,"unitsLost":596436,"buildingsRaised":59996,"buildingsLost":54187,"wondersBuilt":6,"castlesBuilt":8281,"trebsBuilt":6448,"farmsBuilt":217519},"user":{"userId":"","profileId":781607,"userName":"LowElo_Keju","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/3c4094efc8a9a738df7996f3b3338f22da57c093_full.jpg","elo":1358,"playerStanding":0.11,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	57	-3	10	7	86.5	\N
38	Flügel der freiheit	6119233	70	2023-02-10 01:33:33	2024-11-27 14:57:07	1	https://avatars.steamstatic.com/cd105ef25b9ef523993937dd0cfd4f0f3e321f58_full.jpg	LowElo_Jiyuu no Tsubasa	1308	0	1202	{"mpStatList":{"totalMatches":325,"totalWins":177,"currentWinStreak":1},"careerStats":{"totalGames":2364,"totalWins":1148,"civilizations":[{"id":3,"name":"Britons","winCount":32,"defeatCount":93},{"id":4,"name":"Franks","winCount":41,"defeatCount":167},{"id":5,"name":"Goths","winCount":7,"defeatCount":61},{"id":6,"name":"Teutons","winCount":45,"defeatCount":61},{"id":7,"name":"Japanese","winCount":19,"defeatCount":58},{"id":8,"name":"Chinese","winCount":9,"defeatCount":39},{"id":9,"name":"Byzantines","winCount":22,"defeatCount":69},{"id":10,"name":"Persians","winCount":29,"defeatCount":57},{"id":11,"name":"Saracens","winCount":82,"defeatCount":48},{"id":12,"name":"Turks","winCount":26,"defeatCount":62},{"id":13,"name":"Vikings","winCount":23,"defeatCount":44},{"id":14,"name":"Mongols","winCount":59,"defeatCount":101},{"id":15,"name":"Celts","winCount":18,"defeatCount":42},{"id":16,"name":"Spanish","winCount":68,"defeatCount":87},{"id":17,"name":"Aztecs","winCount":18,"defeatCount":33},{"id":18,"name":"Mayans","winCount":17,"defeatCount":54},{"id":19,"name":"Huns","winCount":41,"defeatCount":58},{"id":20,"name":"Koreans","winCount":37,"defeatCount":45},{"id":21,"name":"Italians","winCount":14,"defeatCount":50},{"id":22,"name":"Hindustanis","winCount":39,"defeatCount":59},{"id":23,"name":"Incas","winCount":9,"defeatCount":38},{"id":24,"name":"Magyar","winCount":21,"defeatCount":70},{"id":25,"name":"Slavs","winCount":19,"defeatCount":35},{"id":26,"name":"Portuguese","winCount":26,"defeatCount":63},{"id":27,"name":"Ethiopians","winCount":37,"defeatCount":60},{"id":28,"name":"Malians","winCount":1,"defeatCount":37},{"id":29,"name":"Berbers","winCount":76,"defeatCount":45},{"id":30,"name":"Khmer","winCount":7,"defeatCount":55},{"id":31,"name":"Malay","winCount":11,"defeatCount":41},{"id":32,"name":"Burmese","winCount":3,"defeatCount":21},{"id":33,"name":"Vietnamese","winCount":29,"defeatCount":48},{"id":34,"name":"Bulgarians","winCount":25,"defeatCount":39},{"id":35,"name":"Tatars","winCount":9,"defeatCount":36},{"id":36,"name":"Cumans","winCount":83,"defeatCount":36},{"id":37,"name":"Lithuanians","winCount":51,"defeatCount":81},{"id":38,"name":"Random","winCount":164,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":40,"defeatCount":41},{"id":175,"name":"Sicilians","winCount":53,"defeatCount":31},{"id":184,"name":"Poles","winCount":31,"defeatCount":43},{"id":185,"name":"Bohemians","winCount":32,"defeatCount":39},{"id":195,"name":"Bengalis","winCount":3,"defeatCount":7},{"id":196,"name":"Dravidians","winCount":6,"defeatCount":18},{"id":197,"name":"Gurjaras","winCount":7,"defeatCount":7},{"id":202,"name":"Romans","winCount":0,"defeatCount":2},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":119270,"highScoreMilitary":65449,"highScoreEconomy":26136,"highScoreTechnology":13640,"unitsKilled":356524,"unitsLost":295816,"buildingsRaised":35752,"buildingsLost":22417,"wondersBuilt":6,"castlesBuilt":4557,"trebsBuilt":5076,"farmsBuilt":121120},"user":{"userId":"","profileId":6119233,"userName":"LowElo_Jiyuu no Tsubasa","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/cd105ef25b9ef523993937dd0cfd4f0f3e321f58_full.jpg","elo":1242,"playerStanding":0.2,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	24	-1	7	10	68.5	\N
18170641	Isabuya33	20223883	55	2024-10-09 01:16:41	2024-11-27 14:55:23	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	isabuya33	1190	0	1044	{"mpStatList":{"totalMatches":249,"totalWins":120,"currentWinStreak":0},"careerStats":{"totalGames":292,"totalWins":144,"civilizations":[{"id":3,"name":"Britons","winCount":5,"defeatCount":16},{"id":4,"name":"Franks","winCount":3,"defeatCount":37},{"id":5,"name":"Goths","winCount":4,"defeatCount":19},{"id":6,"name":"Teutons","winCount":0,"defeatCount":14},{"id":7,"name":"Japanese","winCount":2,"defeatCount":8},{"id":8,"name":"Chinese","winCount":3,"defeatCount":7},{"id":9,"name":"Byzantines","winCount":4,"defeatCount":22},{"id":10,"name":"Persians","winCount":4,"defeatCount":30},{"id":11,"name":"Saracens","winCount":2,"defeatCount":10},{"id":12,"name":"Turks","winCount":2,"defeatCount":15},{"id":13,"name":"Vikings","winCount":2,"defeatCount":14},{"id":14,"name":"Mongols","winCount":7,"defeatCount":24},{"id":15,"name":"Celts","winCount":2,"defeatCount":18},{"id":16,"name":"Spanish","winCount":13,"defeatCount":18},{"id":17,"name":"Aztecs","winCount":8,"defeatCount":5},{"id":18,"name":"Mayans","winCount":0,"defeatCount":7},{"id":19,"name":"Huns","winCount":2,"defeatCount":20},{"id":20,"name":"Koreans","winCount":19,"defeatCount":6},{"id":21,"name":"Italians","winCount":4,"defeatCount":15},{"id":22,"name":"Hindustanis","winCount":2,"defeatCount":11},{"id":23,"name":"Incas","winCount":3,"defeatCount":5},{"id":24,"name":"Magyar","winCount":14,"defeatCount":19},{"id":25,"name":"Slavs","winCount":4,"defeatCount":9},{"id":26,"name":"Portuguese","winCount":17,"defeatCount":15},{"id":27,"name":"Ethiopians","winCount":6,"defeatCount":11},{"id":28,"name":"Malians","winCount":2,"defeatCount":6},{"id":29,"name":"Berbers","winCount":3,"defeatCount":8},{"id":30,"name":"Khmer","winCount":15,"defeatCount":21},{"id":31,"name":"Malay","winCount":2,"defeatCount":8},{"id":32,"name":"Burmese","winCount":0,"defeatCount":4},{"id":33,"name":"Vietnamese","winCount":5,"defeatCount":14},{"id":34,"name":"Bulgarians","winCount":3,"defeatCount":9},{"id":35,"name":"Tatars","winCount":2,"defeatCount":11},{"id":36,"name":"Cumans","winCount":10,"defeatCount":12},{"id":37,"name":"Lithuanians","winCount":5,"defeatCount":12},{"id":38,"name":"Random","winCount":33,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":9},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":7},{"id":184,"name":"Poles","winCount":0,"defeatCount":12},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":12},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":3},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":6},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":3},{"id":202,"name":"Romans","winCount":0,"defeatCount":9},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":30297,"highScoreMilitary":17240,"highScoreEconomy":13129,"highScoreTechnology":5867,"unitsKilled":28700,"unitsLost":35745,"buildingsRaised":2478,"buildingsLost":3427,"wondersBuilt":0,"castlesBuilt":543,"trebsBuilt":313,"farmsBuilt":1358},"user":{"userId":"","profileId":20223883,"userName":"isabuya33","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1044,"playerStanding":0.49,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	1	0	0	0	\N
1060	Langittinggi	14775984	50	\N	2024-11-27 14:57:26	1	https://avatars.steamstatic.com/f421a52178fd7f6be6fac858ad8d1cdfcc6c62a3_full.jpg	[xbow] Langittinggi	1300	934	940	{"mpStatList":{"totalMatches":441,"totalWins":215,"currentWinStreak":3},"careerStats":{"totalGames":713,"totalWins":358,"civilizations":[{"id":3,"name":"Britons","winCount":9,"defeatCount":43},{"id":4,"name":"Franks","winCount":2,"defeatCount":77},{"id":5,"name":"Goths","winCount":6,"defeatCount":54},{"id":6,"name":"Teutons","winCount":3,"defeatCount":45},{"id":7,"name":"Japanese","winCount":6,"defeatCount":38},{"id":8,"name":"Chinese","winCount":2,"defeatCount":20},{"id":9,"name":"Byzantines","winCount":13,"defeatCount":31},{"id":10,"name":"Persians","winCount":4,"defeatCount":71},{"id":11,"name":"Saracens","winCount":0,"defeatCount":20},{"id":12,"name":"Turks","winCount":3,"defeatCount":33},{"id":13,"name":"Vikings","winCount":2,"defeatCount":31},{"id":14,"name":"Mongols","winCount":3,"defeatCount":53},{"id":15,"name":"Celts","winCount":2,"defeatCount":32},{"id":16,"name":"Spanish","winCount":2,"defeatCount":55},{"id":17,"name":"Aztecs","winCount":2,"defeatCount":17},{"id":18,"name":"Mayans","winCount":0,"defeatCount":24},{"id":19,"name":"Huns","winCount":7,"defeatCount":38},{"id":20,"name":"Koreans","winCount":5,"defeatCount":30},{"id":21,"name":"Italians","winCount":4,"defeatCount":25},{"id":22,"name":"Hindustanis","winCount":2,"defeatCount":33},{"id":23,"name":"Incas","winCount":8,"defeatCount":12},{"id":24,"name":"Magyar","winCount":6,"defeatCount":23},{"id":25,"name":"Slavs","winCount":7,"defeatCount":25},{"id":26,"name":"Portuguese","winCount":17,"defeatCount":43},{"id":27,"name":"Ethiopians","winCount":3,"defeatCount":31},{"id":28,"name":"Malians","winCount":3,"defeatCount":13},{"id":29,"name":"Berbers","winCount":3,"defeatCount":15},{"id":30,"name":"Khmer","winCount":1,"defeatCount":55},{"id":31,"name":"Malay","winCount":2,"defeatCount":20},{"id":32,"name":"Burmese","winCount":5,"defeatCount":13},{"id":33,"name":"Vietnamese","winCount":2,"defeatCount":31},{"id":34,"name":"Bulgarians","winCount":1,"defeatCount":22},{"id":35,"name":"Tatars","winCount":2,"defeatCount":23},{"id":36,"name":"Cumans","winCount":7,"defeatCount":33},{"id":37,"name":"Lithuanians","winCount":3,"defeatCount":26},{"id":38,"name":"Random","winCount":39,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":1,"defeatCount":37},{"id":175,"name":"Sicilians","winCount":18,"defeatCount":12},{"id":184,"name":"Poles","winCount":13,"defeatCount":25},{"id":185,"name":"Bohemians","winCount":129,"defeatCount":30},{"id":195,"name":"Bengalis","winCount":1,"defeatCount":5},{"id":196,"name":"Dravidians","winCount":1,"defeatCount":12},{"id":197,"name":"Gurjaras","winCount":5,"defeatCount":11},{"id":202,"name":"Romans","winCount":8,"defeatCount":17},{"id":204,"name":"Pompeii_Assyrian","winCount":1,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":1,"defeatCount":4},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":63777,"highScoreMilitary":55776,"highScoreEconomy":22570,"highScoreTechnology":8328,"unitsKilled":128900,"unitsLost":138336,"buildingsRaised":13674,"buildingsLost":10259,"wondersBuilt":3,"castlesBuilt":2290,"trebsBuilt":1601,"farmsBuilt":32082},"user":{"userId":"","profileId":14775984,"userName":"[xbow] Langittinggi","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/f421a52178fd7f6be6fac858ad8d1cdfcc6c62a3_full.jpg","elo":1031,"playerStanding":0.49,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	7	-2	0	0	45	\N
34	Panglima	652559	75	2023-02-10 01:33:33	2024-11-27 14:57:29	1	https://avatars.steamstatic.com/6334e6dde5b262d01e70d32bbc21acdf357ddc78_full.jpg	PANGLIMA Cupu	1290	1407	1305	{"mpStatList":{"totalMatches":181,"totalWins":103,"currentWinStreak":2},"careerStats":{"totalGames":6697,"totalWins":3475,"civilizations":[{"id":3,"name":"Britons","winCount":54,"defeatCount":228},{"id":4,"name":"Franks","winCount":121,"defeatCount":312},{"id":5,"name":"Goths","winCount":49,"defeatCount":235},{"id":6,"name":"Teutons","winCount":32,"defeatCount":251},{"id":7,"name":"Japanese","winCount":43,"defeatCount":201},{"id":8,"name":"Chinese","winCount":37,"defeatCount":210},{"id":9,"name":"Byzantines","winCount":38,"defeatCount":193},{"id":10,"name":"Persians","winCount":59,"defeatCount":254},{"id":11,"name":"Saracens","winCount":50,"defeatCount":262},{"id":12,"name":"Turks","winCount":71,"defeatCount":207},{"id":13,"name":"Vikings","winCount":47,"defeatCount":179},{"id":14,"name":"Mongols","winCount":509,"defeatCount":352},{"id":15,"name":"Celts","winCount":32,"defeatCount":238},{"id":16,"name":"Spanish","winCount":406,"defeatCount":301},{"id":17,"name":"Aztecs","winCount":63,"defeatCount":177},{"id":18,"name":"Mayans","winCount":37,"defeatCount":203},{"id":19,"name":"Huns","winCount":144,"defeatCount":320},{"id":20,"name":"Koreans","winCount":161,"defeatCount":193},{"id":21,"name":"Italians","winCount":50,"defeatCount":195},{"id":22,"name":"Hindustanis","winCount":58,"defeatCount":185},{"id":23,"name":"Incas","winCount":40,"defeatCount":150},{"id":24,"name":"Magyar","winCount":58,"defeatCount":222},{"id":25,"name":"Slavs","winCount":39,"defeatCount":247},{"id":26,"name":"Portuguese","winCount":42,"defeatCount":201},{"id":27,"name":"Ethiopians","winCount":35,"defeatCount":196},{"id":28,"name":"Malians","winCount":57,"defeatCount":193},{"id":29,"name":"Berbers","winCount":126,"defeatCount":192},{"id":30,"name":"Khmer","winCount":77,"defeatCount":229},{"id":31,"name":"Malay","winCount":37,"defeatCount":192},{"id":32,"name":"Burmese","winCount":36,"defeatCount":190},{"id":33,"name":"Vietnamese","winCount":41,"defeatCount":188},{"id":34,"name":"Bulgarians","winCount":46,"defeatCount":175},{"id":35,"name":"Tatars","winCount":51,"defeatCount":196},{"id":36,"name":"Cumans","winCount":47,"defeatCount":202},{"id":37,"name":"Lithuanians","winCount":78,"defeatCount":202},{"id":38,"name":"Random","winCount":1505,"defeatCount":1946},{"id":174,"name":"Burgundians","winCount":48,"defeatCount":138},{"id":175,"name":"Sicilians","winCount":91,"defeatCount":128},{"id":184,"name":"Poles","winCount":36,"defeatCount":95},{"id":185,"name":"Bohemians","winCount":68,"defeatCount":103},{"id":195,"name":"Bengalis","winCount":28,"defeatCount":47},{"id":196,"name":"Dravidians","winCount":29,"defeatCount":84},{"id":197,"name":"Gurjaras","winCount":323,"defeatCount":53},{"id":202,"name":"Romans","winCount":12,"defeatCount":24},{"id":204,"name":"Pompeii_Assyrian","winCount":1,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":1},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":1},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":1,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":1,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":79960,"highScoreMilitary":64303,"highScoreEconomy":27887,"highScoreTechnology":7379,"unitsKilled":1412169,"unitsLost":1502670,"buildingsRaised":104065,"buildingsLost":120057,"wondersBuilt":5,"castlesBuilt":21497,"trebsBuilt":19698,"farmsBuilt":343360},"user":{"userId":"","profileId":652559,"userName":"PANGLIMA Cupu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/6334e6dde5b262d01e70d32bbc21acdf357ddc78_full.jpg","elo":1310,"playerStanding":0.14,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	153	1	12	5	78.5	\N
18170634	KBX	1986085	45	2024-07-13 11:35:53	2024-11-27 14:55:39	1	https://avatars.steamstatic.com/41411dcccb2f9363868e74584e9296c7b037b939_full.jpg	LowElo_K.B.X	1351	681	955	{"mpStatList":{"totalMatches":537,"totalWins":231,"currentWinStreak":2},"careerStats":{"totalGames":1091,"totalWins":472,"civilizations":[{"id":3,"name":"Britons","winCount":62,"defeatCount":89},{"id":4,"name":"Franks","winCount":23,"defeatCount":101},{"id":5,"name":"Goths","winCount":4,"defeatCount":75},{"id":6,"name":"Teutons","winCount":3,"defeatCount":74},{"id":7,"name":"Japanese","winCount":3,"defeatCount":32},{"id":8,"name":"Chinese","winCount":3,"defeatCount":48},{"id":9,"name":"Byzantines","winCount":3,"defeatCount":41},{"id":10,"name":"Persians","winCount":37,"defeatCount":100},{"id":11,"name":"Saracens","winCount":4,"defeatCount":25},{"id":12,"name":"Turks","winCount":31,"defeatCount":79},{"id":13,"name":"Vikings","winCount":3,"defeatCount":26},{"id":14,"name":"Mongols","winCount":53,"defeatCount":73},{"id":15,"name":"Celts","winCount":7,"defeatCount":62},{"id":16,"name":"Spanish","winCount":108,"defeatCount":54},{"id":17,"name":"Aztecs","winCount":5,"defeatCount":21},{"id":18,"name":"Mayans","winCount":0,"defeatCount":23},{"id":19,"name":"Huns","winCount":1,"defeatCount":69},{"id":20,"name":"Koreans","winCount":21,"defeatCount":23},{"id":21,"name":"Italians","winCount":5,"defeatCount":41},{"id":22,"name":"Hindustanis","winCount":2,"defeatCount":35},{"id":23,"name":"Incas","winCount":0,"defeatCount":26},{"id":24,"name":"Magyar","winCount":4,"defeatCount":28},{"id":25,"name":"Slavs","winCount":1,"defeatCount":37},{"id":26,"name":"Portuguese","winCount":9,"defeatCount":50},{"id":27,"name":"Ethiopians","winCount":26,"defeatCount":38},{"id":28,"name":"Malians","winCount":3,"defeatCount":15},{"id":29,"name":"Berbers","winCount":7,"defeatCount":13},{"id":30,"name":"Khmer","winCount":4,"defeatCount":119},{"id":31,"name":"Malay","winCount":1,"defeatCount":29},{"id":32,"name":"Burmese","winCount":1,"defeatCount":17},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":37},{"id":34,"name":"Bulgarians","winCount":2,"defeatCount":28},{"id":35,"name":"Tatars","winCount":2,"defeatCount":22},{"id":36,"name":"Cumans","winCount":4,"defeatCount":35},{"id":37,"name":"Lithuanians","winCount":25,"defeatCount":34},{"id":38,"name":"Random","winCount":53,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":5,"defeatCount":37},{"id":175,"name":"Sicilians","winCount":1,"defeatCount":9},{"id":184,"name":"Poles","winCount":3,"defeatCount":32},{"id":185,"name":"Bohemians","winCount":21,"defeatCount":53},{"id":195,"name":"Bengalis","winCount":2,"defeatCount":13},{"id":196,"name":"Dravidians","winCount":3,"defeatCount":9},{"id":197,"name":"Gurjaras","winCount":1,"defeatCount":17},{"id":202,"name":"Romans","winCount":6,"defeatCount":43},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":61865,"highScoreMilitary":52057,"highScoreEconomy":14875,"highScoreTechnology":5979,"unitsKilled":158027,"unitsLost":184701,"buildingsRaised":12557,"buildingsLost":17338,"wondersBuilt":0,"castlesBuilt":2431,"trebsBuilt":767,"farmsBuilt":21564},"user":{"userId":"","profileId":1986085,"userName":"LowElo_K.B.X","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/41411dcccb2f9363868e74584e9296c7b037b939_full.jpg","elo":861,"playerStanding":0.77,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	2	-2	0	0	0	\N
18170637	KAEL	20192926	55	2024-10-09 01:04:18	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	LowElo_Mikael	1369	870	1069	{"mpStatList":{"totalMatches":455,"totalWins":223,"currentWinStreak":0},"careerStats":{"totalGames":665,"totalWins":320,"civilizations":[{"id":3,"name":"Britons","winCount":6,"defeatCount":47},{"id":4,"name":"Franks","winCount":18,"defeatCount":65},{"id":5,"name":"Goths","winCount":21,"defeatCount":52},{"id":6,"name":"Teutons","winCount":33,"defeatCount":33},{"id":7,"name":"Japanese","winCount":25,"defeatCount":19},{"id":8,"name":"Chinese","winCount":7,"defeatCount":25},{"id":9,"name":"Byzantines","winCount":35,"defeatCount":31},{"id":10,"name":"Persians","winCount":16,"defeatCount":37},{"id":11,"name":"Saracens","winCount":8,"defeatCount":17},{"id":12,"name":"Turks","winCount":67,"defeatCount":35},{"id":13,"name":"Vikings","winCount":7,"defeatCount":22},{"id":14,"name":"Mongols","winCount":7,"defeatCount":57},{"id":15,"name":"Celts","winCount":32,"defeatCount":23},{"id":16,"name":"Spanish","winCount":10,"defeatCount":53},{"id":17,"name":"Aztecs","winCount":10,"defeatCount":12},{"id":18,"name":"Mayans","winCount":0,"defeatCount":19},{"id":19,"name":"Huns","winCount":6,"defeatCount":30},{"id":20,"name":"Koreans","winCount":3,"defeatCount":20},{"id":21,"name":"Italians","winCount":9,"defeatCount":35},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":24},{"id":23,"name":"Incas","winCount":10,"defeatCount":14},{"id":24,"name":"Magyar","winCount":5,"defeatCount":28},{"id":25,"name":"Slavs","winCount":12,"defeatCount":22},{"id":26,"name":"Portuguese","winCount":4,"defeatCount":26},{"id":27,"name":"Ethiopians","winCount":8,"defeatCount":20},{"id":28,"name":"Malians","winCount":4,"defeatCount":15},{"id":29,"name":"Berbers","winCount":3,"defeatCount":11},{"id":30,"name":"Khmer","winCount":45,"defeatCount":39},{"id":31,"name":"Malay","winCount":4,"defeatCount":12},{"id":32,"name":"Burmese","winCount":13,"defeatCount":8},{"id":33,"name":"Vietnamese","winCount":12,"defeatCount":23},{"id":34,"name":"Bulgarians","winCount":5,"defeatCount":17},{"id":35,"name":"Tatars","winCount":6,"defeatCount":19},{"id":36,"name":"Cumans","winCount":8,"defeatCount":26},{"id":37,"name":"Lithuanians","winCount":4,"defeatCount":23},{"id":38,"name":"Random","winCount":38,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":16},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":10},{"id":184,"name":"Poles","winCount":0,"defeatCount":20},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":22},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":7},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":8},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":6},{"id":202,"name":"Romans","winCount":0,"defeatCount":18},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":38485,"highScoreMilitary":22844,"highScoreEconomy":17279,"highScoreTechnology":5843,"unitsKilled":68954,"unitsLost":71870,"buildingsRaised":7023,"buildingsLost":5997,"wondersBuilt":0,"castlesBuilt":976,"trebsBuilt":403,"farmsBuilt":1369},"user":{"userId":"","profileId":20192926,"userName":"LowElo_Mikael","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1093,"playerStanding":0.41,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	4	3	0	0	0	\N
60	si kancil	9417745	60	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/2a3535f90545e785d0e2a5a703fb5876217a2663_full.jpg	[xbow] si kancil	1282	973	1122	{"mpStatList":{"totalMatches":92,"totalWins":50,"currentWinStreak":4},"careerStats":{"totalGames":2210,"totalWins":1091,"civilizations":[{"id":3,"name":"Britons","winCount":24,"defeatCount":146},{"id":4,"name":"Franks","winCount":120,"defeatCount":202},{"id":5,"name":"Goths","winCount":39,"defeatCount":116},{"id":6,"name":"Teutons","winCount":12,"defeatCount":92},{"id":7,"name":"Japanese","winCount":6,"defeatCount":88},{"id":8,"name":"Chinese","winCount":132,"defeatCount":79},{"id":9,"name":"Byzantines","winCount":30,"defeatCount":92},{"id":10,"name":"Persians","winCount":11,"defeatCount":104},{"id":11,"name":"Saracens","winCount":19,"defeatCount":60},{"id":12,"name":"Turks","winCount":22,"defeatCount":83},{"id":13,"name":"Vikings","winCount":14,"defeatCount":73},{"id":14,"name":"Mongols","winCount":165,"defeatCount":121},{"id":15,"name":"Celts","winCount":54,"defeatCount":63},{"id":16,"name":"Spanish","winCount":18,"defeatCount":95},{"id":17,"name":"Aztecs","winCount":16,"defeatCount":79},{"id":18,"name":"Mayans","winCount":68,"defeatCount":125},{"id":19,"name":"Huns","winCount":17,"defeatCount":89},{"id":20,"name":"Koreans","winCount":14,"defeatCount":71},{"id":21,"name":"Italians","winCount":13,"defeatCount":69},{"id":22,"name":"Hindustanis","winCount":11,"defeatCount":84},{"id":23,"name":"Incas","winCount":21,"defeatCount":61},{"id":24,"name":"Magyar","winCount":306,"defeatCount":84},{"id":25,"name":"Slavs","winCount":14,"defeatCount":52},{"id":26,"name":"Portuguese","winCount":14,"defeatCount":85},{"id":27,"name":"Ethiopians","winCount":87,"defeatCount":82},{"id":28,"name":"Malians","winCount":20,"defeatCount":70},{"id":29,"name":"Berbers","winCount":11,"defeatCount":51},{"id":30,"name":"Khmer","winCount":94,"defeatCount":73},{"id":31,"name":"Malay","winCount":13,"defeatCount":60},{"id":32,"name":"Burmese","winCount":16,"defeatCount":51},{"id":33,"name":"Vietnamese","winCount":5,"defeatCount":68},{"id":34,"name":"Bulgarians","winCount":10,"defeatCount":73},{"id":35,"name":"Tatars","winCount":14,"defeatCount":64},{"id":36,"name":"Cumans","winCount":58,"defeatCount":84},{"id":37,"name":"Lithuanians","winCount":21,"defeatCount":100},{"id":38,"name":"Random","winCount":293,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":92,"defeatCount":59},{"id":175,"name":"Sicilians","winCount":26,"defeatCount":62},{"id":184,"name":"Poles","winCount":159,"defeatCount":66},{"id":185,"name":"Bohemians","winCount":10,"defeatCount":60},{"id":195,"name":"Bengalis","winCount":11,"defeatCount":33},{"id":196,"name":"Dravidians","winCount":10,"defeatCount":50},{"id":197,"name":"Gurjaras","winCount":33,"defeatCount":48},{"id":202,"name":"Romans","winCount":5,"defeatCount":15},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":55127,"highScoreMilitary":48578,"highScoreEconomy":13862,"highScoreTechnology":6538,"unitsKilled":726001,"unitsLost":595431,"buildingsRaised":85255,"buildingsLost":50373,"wondersBuilt":0,"castlesBuilt":10892,"trebsBuilt":9479,"farmsBuilt":270460},"user":{"userId":"","profileId":9417745,"userName":"[xbow] si kancil","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/2a3535f90545e785d0e2a5a703fb5876217a2663_full.jpg","elo":1159,"playerStanding":0.3,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	14	-3	12	5	63.5	\N
18170640	Alkern	4573982	55	2024-10-09 01:16:27	2024-11-27 14:55:52	1	https://avatars.steamstatic.com/b737efc68e39795912b2fda161f5229299db76aa_full.jpg	Alkern	1632	0	924	{"mpStatList":{"totalMatches":717,"totalWins":368,"currentWinStreak":1},"careerStats":{"totalGames":1077,"totalWins":540,"civilizations":[{"id":3,"name":"Britons","winCount":32,"defeatCount":146},{"id":4,"name":"Franks","winCount":35,"defeatCount":239},{"id":5,"name":"Goths","winCount":37,"defeatCount":139},{"id":6,"name":"Teutons","winCount":23,"defeatCount":124},{"id":7,"name":"Japanese","winCount":6,"defeatCount":52},{"id":8,"name":"Chinese","winCount":10,"defeatCount":78},{"id":9,"name":"Byzantines","winCount":14,"defeatCount":132},{"id":10,"name":"Persians","winCount":35,"defeatCount":95},{"id":11,"name":"Saracens","winCount":22,"defeatCount":76},{"id":12,"name":"Turks","winCount":31,"defeatCount":118},{"id":13,"name":"Vikings","winCount":14,"defeatCount":32},{"id":14,"name":"Mongols","winCount":22,"defeatCount":126},{"id":15,"name":"Celts","winCount":9,"defeatCount":65},{"id":16,"name":"Spanish","winCount":35,"defeatCount":117},{"id":17,"name":"Aztecs","winCount":14,"defeatCount":29},{"id":18,"name":"Mayans","winCount":4,"defeatCount":49},{"id":19,"name":"Huns","winCount":19,"defeatCount":69},{"id":20,"name":"Koreans","winCount":2,"defeatCount":32},{"id":21,"name":"Italians","winCount":41,"defeatCount":88},{"id":22,"name":"Hindustanis","winCount":15,"defeatCount":76},{"id":23,"name":"Incas","winCount":6,"defeatCount":55},{"id":24,"name":"Magyar","winCount":7,"defeatCount":64},{"id":25,"name":"Slavs","winCount":6,"defeatCount":79},{"id":26,"name":"Portuguese","winCount":8,"defeatCount":54},{"id":27,"name":"Ethiopians","winCount":6,"defeatCount":74},{"id":28,"name":"Malians","winCount":8,"defeatCount":33},{"id":29,"name":"Berbers","winCount":12,"defeatCount":43},{"id":30,"name":"Khmer","winCount":17,"defeatCount":136},{"id":31,"name":"Malay","winCount":7,"defeatCount":54},{"id":32,"name":"Burmese","winCount":6,"defeatCount":28},{"id":33,"name":"Vietnamese","winCount":11,"defeatCount":51},{"id":34,"name":"Bulgarians","winCount":16,"defeatCount":44},{"id":35,"name":"Tatars","winCount":9,"defeatCount":60},{"id":36,"name":"Cumans","winCount":12,"defeatCount":70},{"id":37,"name":"Lithuanians","winCount":9,"defeatCount":80},{"id":38,"name":"Random","winCount":15,"defeatCount":43},{"id":174,"name":"Burgundians","winCount":35,"defeatCount":47},{"id":175,"name":"Sicilians","winCount":29,"defeatCount":58},{"id":184,"name":"Poles","winCount":89,"defeatCount":48},{"id":185,"name":"Bohemians","winCount":23,"defeatCount":77},{"id":195,"name":"Bengalis","winCount":8,"defeatCount":21},{"id":196,"name":"Dravidians","winCount":7,"defeatCount":43},{"id":197,"name":"Gurjaras","winCount":11,"defeatCount":50},{"id":202,"name":"Romans","winCount":15,"defeatCount":27},{"id":204,"name":"Pompeii_Assyrian","winCount":46,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":1},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":11},{"id":210,"name":"Pompeii_Choson","winCount":2,"defeatCount":4},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":11},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":2},{"id":220,"name":"Pompeii_Minoan","winCount":6,"defeatCount":11},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":1},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":12},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":7,"defeatCount":18},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":8,"defeatCount":26},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":447152,"highScoreMilitary":44270,"highScoreEconomy":64997,"highScoreTechnology":13749,"unitsKilled":336722,"unitsLost":234543,"buildingsRaised":45138,"buildingsLost":11411,"wondersBuilt":25,"castlesBuilt":3117,"trebsBuilt":1619,"farmsBuilt":50822},"user":{"userId":"","profileId":4573982,"userName":"Alkern","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/b737efc68e39795912b2fda161f5229299db76aa_full.jpg","elo":1042,"playerStanding":0.47,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-2	0	0	0	\N
1062	BangQhincay	3146059	55	\N	2024-11-27 14:56:04	1	https://avatars.steamstatic.com/b14b22c0479effac43ea353790c7877ac312c78c_full.jpg	BangQhincay	1271	0	0	{"mpStatList":{"totalMatches":47,"totalWins":16,"currentWinStreak":1},"careerStats":{"totalGames":516,"totalWins":240,"civilizations":[{"id":3,"name":"Britons","winCount":26,"defeatCount":37},{"id":4,"name":"Franks","winCount":12,"defeatCount":36},{"id":5,"name":"Goths","winCount":13,"defeatCount":30},{"id":6,"name":"Teutons","winCount":11,"defeatCount":46},{"id":7,"name":"Japanese","winCount":5,"defeatCount":23},{"id":8,"name":"Chinese","winCount":8,"defeatCount":50},{"id":9,"name":"Byzantines","winCount":12,"defeatCount":33},{"id":10,"name":"Persians","winCount":11,"defeatCount":32},{"id":11,"name":"Saracens","winCount":14,"defeatCount":44},{"id":12,"name":"Turks","winCount":8,"defeatCount":22},{"id":13,"name":"Vikings","winCount":6,"defeatCount":22},{"id":14,"name":"Mongols","winCount":13,"defeatCount":45},{"id":15,"name":"Celts","winCount":7,"defeatCount":24},{"id":16,"name":"Spanish","winCount":8,"defeatCount":29},{"id":17,"name":"Aztecs","winCount":7,"defeatCount":26},{"id":18,"name":"Mayans","winCount":4,"defeatCount":21},{"id":19,"name":"Huns","winCount":11,"defeatCount":21},{"id":20,"name":"Koreans","winCount":11,"defeatCount":15},{"id":21,"name":"Italians","winCount":10,"defeatCount":26},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":26},{"id":23,"name":"Incas","winCount":10,"defeatCount":28},{"id":24,"name":"Magyar","winCount":3,"defeatCount":25},{"id":25,"name":"Slavs","winCount":5,"defeatCount":29},{"id":26,"name":"Portuguese","winCount":13,"defeatCount":35},{"id":27,"name":"Ethiopians","winCount":12,"defeatCount":48},{"id":28,"name":"Malians","winCount":6,"defeatCount":41},{"id":29,"name":"Berbers","winCount":12,"defeatCount":22},{"id":30,"name":"Khmer","winCount":12,"defeatCount":40},{"id":31,"name":"Malay","winCount":8,"defeatCount":43},{"id":32,"name":"Burmese","winCount":11,"defeatCount":37},{"id":33,"name":"Vietnamese","winCount":8,"defeatCount":35},{"id":34,"name":"Bulgarians","winCount":9,"defeatCount":19},{"id":35,"name":"Tatars","winCount":11,"defeatCount":26},{"id":36,"name":"Cumans","winCount":3,"defeatCount":20},{"id":37,"name":"Lithuanians","winCount":9,"defeatCount":23},{"id":38,"name":"Random","winCount":213,"defeatCount":11},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":12},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":25},{"id":184,"name":"Poles","winCount":0,"defeatCount":13},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":12},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":15},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":25},{"id":197,"name":"Gurjaras","winCount":5,"defeatCount":35},{"id":202,"name":"Romans","winCount":0,"defeatCount":13},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":55501,"highScoreMilitary":41249,"highScoreEconomy":16066,"highScoreTechnology":6351,"unitsKilled":136083,"unitsLost":104950,"buildingsRaised":18094,"buildingsLost":11350,"wondersBuilt":7,"castlesBuilt":2269,"trebsBuilt":1455,"farmsBuilt":36970},"user":{"userId":"","profileId":3146059,"userName":"BangQhincay","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/b14b22c0479effac43ea353790c7877ac312c78c_full.jpg","elo":773,"playerStanding":0.89,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	5	-2	4	13	50.5	\N
12714569	Mbok Jamu	18959347	80	\N	2024-11-27 14:56:06	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	[OmG]Mbok_jamu	1444	0	1320	{"mpStatList":{"totalMatches":50,"totalWins":28,"currentWinStreak":0},"careerStats":{"totalGames":305,"totalWins":137,"civilizations":[{"id":3,"name":"Britons","winCount":5,"defeatCount":17},{"id":4,"name":"Franks","winCount":10,"defeatCount":16},{"id":5,"name":"Goths","winCount":6,"defeatCount":10},{"id":6,"name":"Teutons","winCount":6,"defeatCount":11},{"id":7,"name":"Japanese","winCount":8,"defeatCount":10},{"id":8,"name":"Chinese","winCount":2,"defeatCount":10},{"id":9,"name":"Byzantines","winCount":6,"defeatCount":12},{"id":10,"name":"Persians","winCount":5,"defeatCount":18},{"id":11,"name":"Saracens","winCount":8,"defeatCount":19},{"id":12,"name":"Turks","winCount":5,"defeatCount":10},{"id":13,"name":"Vikings","winCount":3,"defeatCount":7},{"id":14,"name":"Mongols","winCount":6,"defeatCount":19},{"id":15,"name":"Celts","winCount":10,"defeatCount":9},{"id":16,"name":"Spanish","winCount":6,"defeatCount":19},{"id":17,"name":"Aztecs","winCount":3,"defeatCount":11},{"id":18,"name":"Mayans","winCount":4,"defeatCount":12},{"id":19,"name":"Huns","winCount":20,"defeatCount":17},{"id":20,"name":"Koreans","winCount":6,"defeatCount":12},{"id":21,"name":"Italians","winCount":2,"defeatCount":11},{"id":22,"name":"Hindustanis","winCount":4,"defeatCount":13},{"id":23,"name":"Incas","winCount":6,"defeatCount":9},{"id":24,"name":"Magyar","winCount":4,"defeatCount":8},{"id":25,"name":"Slavs","winCount":3,"defeatCount":6},{"id":26,"name":"Portuguese","winCount":5,"defeatCount":11},{"id":27,"name":"Ethiopians","winCount":4,"defeatCount":13},{"id":28,"name":"Malians","winCount":4,"defeatCount":10},{"id":29,"name":"Berbers","winCount":2,"defeatCount":14},{"id":30,"name":"Khmer","winCount":4,"defeatCount":13},{"id":31,"name":"Malay","winCount":5,"defeatCount":7},{"id":32,"name":"Burmese","winCount":6,"defeatCount":9},{"id":33,"name":"Vietnamese","winCount":3,"defeatCount":7},{"id":34,"name":"Bulgarians","winCount":3,"defeatCount":12},{"id":35,"name":"Tatars","winCount":3,"defeatCount":19},{"id":36,"name":"Cumans","winCount":4,"defeatCount":12},{"id":37,"name":"Lithuanians","winCount":6,"defeatCount":8},{"id":38,"name":"Random","winCount":113,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":9},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":9},{"id":184,"name":"Poles","winCount":4,"defeatCount":11},{"id":185,"name":"Bohemians","winCount":4,"defeatCount":8},{"id":195,"name":"Bengalis","winCount":3,"defeatCount":5},{"id":196,"name":"Dravidians","winCount":3,"defeatCount":10},{"id":197,"name":"Gurjaras","winCount":5,"defeatCount":5},{"id":202,"name":"Romans","winCount":0,"defeatCount":7},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":57288,"highScoreMilitary":38508,"highScoreEconomy":12340,"highScoreTechnology":5890,"unitsKilled":76084,"unitsLost":81199,"buildingsRaised":8582,"buildingsLost":9630,"wondersBuilt":0,"castlesBuilt":1081,"trebsBuilt":447,"farmsBuilt":7585},"user":{"userId":"","profileId":18959347,"userName":"[OmG]Mbok_jamu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1356,"playerStanding":0.11,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	19	4	6	11	72.5	\N
55	Kabayan	11715344	45	2023-02-10 01:33:33	2024-11-27 14:57:44	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	Kabayan	1288	0	964	{"mpStatList":{"totalMatches":12,"totalWins":4,"currentWinStreak":0},"careerStats":{"totalGames":733,"totalWins":338,"civilizations":[{"id":3,"name":"Britons","winCount":3,"defeatCount":49},{"id":4,"name":"Franks","winCount":7,"defeatCount":29},{"id":5,"name":"Goths","winCount":15,"defeatCount":30},{"id":6,"name":"Teutons","winCount":4,"defeatCount":26},{"id":7,"name":"Japanese","winCount":13,"defeatCount":32},{"id":8,"name":"Chinese","winCount":7,"defeatCount":26},{"id":9,"name":"Byzantines","winCount":11,"defeatCount":33},{"id":10,"name":"Persians","winCount":9,"defeatCount":37},{"id":11,"name":"Saracens","winCount":12,"defeatCount":40},{"id":12,"name":"Turks","winCount":11,"defeatCount":29},{"id":13,"name":"Vikings","winCount":7,"defeatCount":28},{"id":14,"name":"Mongols","winCount":9,"defeatCount":36},{"id":15,"name":"Celts","winCount":20,"defeatCount":27},{"id":16,"name":"Spanish","winCount":9,"defeatCount":31},{"id":17,"name":"Aztecs","winCount":5,"defeatCount":41},{"id":18,"name":"Mayans","winCount":15,"defeatCount":31},{"id":19,"name":"Huns","winCount":7,"defeatCount":41},{"id":20,"name":"Koreans","winCount":11,"defeatCount":33},{"id":21,"name":"Italians","winCount":12,"defeatCount":35},{"id":22,"name":"Hindustanis","winCount":9,"defeatCount":29},{"id":23,"name":"Incas","winCount":13,"defeatCount":25},{"id":24,"name":"Magyar","winCount":6,"defeatCount":31},{"id":25,"name":"Slavs","winCount":4,"defeatCount":21},{"id":26,"name":"Portuguese","winCount":9,"defeatCount":26},{"id":27,"name":"Ethiopians","winCount":5,"defeatCount":41},{"id":28,"name":"Malians","winCount":9,"defeatCount":29},{"id":29,"name":"Berbers","winCount":6,"defeatCount":30},{"id":30,"name":"Khmer","winCount":5,"defeatCount":30},{"id":31,"name":"Malay","winCount":6,"defeatCount":30},{"id":32,"name":"Burmese","winCount":7,"defeatCount":25},{"id":33,"name":"Vietnamese","winCount":10,"defeatCount":35},{"id":34,"name":"Bulgarians","winCount":8,"defeatCount":28},{"id":35,"name":"Tatars","winCount":13,"defeatCount":28},{"id":36,"name":"Cumans","winCount":9,"defeatCount":33},{"id":37,"name":"Lithuanians","winCount":10,"defeatCount":34},{"id":38,"name":"Random","winCount":310,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":7,"defeatCount":23},{"id":175,"name":"Sicilians","winCount":7,"defeatCount":32},{"id":184,"name":"Poles","winCount":9,"defeatCount":15},{"id":185,"name":"Bohemians","winCount":6,"defeatCount":23},{"id":195,"name":"Bengalis","winCount":12,"defeatCount":28},{"id":196,"name":"Dravidians","winCount":5,"defeatCount":28},{"id":197,"name":"Gurjaras","winCount":10,"defeatCount":17},{"id":202,"name":"Romans","winCount":6,"defeatCount":4},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":59652,"highScoreMilitary":46695,"highScoreEconomy":10607,"highScoreTechnology":6276,"unitsKilled":84434,"unitsLost":106362,"buildingsRaised":11409,"buildingsLost":13012,"wondersBuilt":5,"castlesBuilt":1393,"trebsBuilt":613,"farmsBuilt":36740},"user":{"userId":"","profileId":11715344,"userName":"Kabayan","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":948,"playerStanding":0.64,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	5	1	11	6	47.5	\N
12688760	Chizuru	18765026	85	\N	2024-11-27 14:57:46	1	https://avatars.steamstatic.com/81e7a5fa5f4f2e7adbccd45bb4519ce78c2b7724_full.jpg	Chizuru	1406	0	1416	{"mpStatList":{"totalMatches":60,"totalWins":36,"currentWinStreak":0},"careerStats":{"totalGames":191,"totalWins":100,"civilizations":[{"id":3,"name":"Britons","winCount":6,"defeatCount":9},{"id":4,"name":"Franks","winCount":2,"defeatCount":20},{"id":5,"name":"Goths","winCount":4,"defeatCount":8},{"id":6,"name":"Teutons","winCount":8,"defeatCount":7},{"id":7,"name":"Japanese","winCount":3,"defeatCount":10},{"id":8,"name":"Chinese","winCount":0,"defeatCount":5},{"id":9,"name":"Byzantines","winCount":2,"defeatCount":6},{"id":10,"name":"Persians","winCount":7,"defeatCount":9},{"id":11,"name":"Saracens","winCount":4,"defeatCount":11},{"id":12,"name":"Turks","winCount":4,"defeatCount":6},{"id":13,"name":"Vikings","winCount":0,"defeatCount":6},{"id":14,"name":"Mongols","winCount":10,"defeatCount":15},{"id":15,"name":"Celts","winCount":1,"defeatCount":11},{"id":16,"name":"Spanish","winCount":2,"defeatCount":13},{"id":17,"name":"Aztecs","winCount":5,"defeatCount":11},{"id":18,"name":"Mayans","winCount":3,"defeatCount":11},{"id":19,"name":"Huns","winCount":5,"defeatCount":5},{"id":20,"name":"Koreans","winCount":9,"defeatCount":6},{"id":21,"name":"Italians","winCount":4,"defeatCount":9},{"id":22,"name":"Hindustanis","winCount":5,"defeatCount":7},{"id":23,"name":"Incas","winCount":2,"defeatCount":5},{"id":24,"name":"Magyar","winCount":6,"defeatCount":12},{"id":25,"name":"Slavs","winCount":2,"defeatCount":6},{"id":26,"name":"Portuguese","winCount":3,"defeatCount":8},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":8},{"id":28,"name":"Malians","winCount":1,"defeatCount":7},{"id":29,"name":"Berbers","winCount":3,"defeatCount":9},{"id":30,"name":"Khmer","winCount":3,"defeatCount":6},{"id":31,"name":"Malay","winCount":2,"defeatCount":12},{"id":32,"name":"Burmese","winCount":2,"defeatCount":9},{"id":33,"name":"Vietnamese","winCount":3,"defeatCount":9},{"id":34,"name":"Bulgarians","winCount":3,"defeatCount":9},{"id":35,"name":"Tatars","winCount":2,"defeatCount":14},{"id":36,"name":"Cumans","winCount":3,"defeatCount":8},{"id":37,"name":"Lithuanians","winCount":3,"defeatCount":10},{"id":38,"name":"Random","winCount":57,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":3,"defeatCount":5},{"id":175,"name":"Sicilians","winCount":5,"defeatCount":7},{"id":184,"name":"Poles","winCount":0,"defeatCount":6},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":13},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":2},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":6},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":4},{"id":202,"name":"Romans","winCount":0,"defeatCount":3},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":44453,"highScoreMilitary":52952,"highScoreEconomy":17988,"highScoreTechnology":6630,"unitsKilled":39745,"unitsLost":32990,"buildingsRaised":5060,"buildingsLost":2852,"wondersBuilt":0,"castlesBuilt":426,"trebsBuilt":330,"farmsBuilt":3970},"user":{"userId":"","profileId":18765026,"userName":"Chizuru","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/81e7a5fa5f4f2e7adbccd45bb4519ce78c2b7724_full.jpg","elo":1428,"playerStanding":0.07,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	6	2	8	9	84.5	\N
65	laskar.cinta	10594768	30	2023-05-31 20:18:07	2024-11-27 14:57:53	1	https://avatars.steamstatic.com/7a32ea4436c14117d9a68852913d33c9d4dc898f_full.jpg	Turangga	1251	0	0	{"mpStatList":{"totalMatches":4,"totalWins":1,"currentWinStreak":0},"careerStats":{"totalGames":220,"totalWins":72,"civilizations":[{"id":3,"name":"Britons","winCount":2,"defeatCount":30},{"id":4,"name":"Franks","winCount":24,"defeatCount":18},{"id":5,"name":"Goths","winCount":12,"defeatCount":23},{"id":6,"name":"Teutons","winCount":4,"defeatCount":20},{"id":7,"name":"Japanese","winCount":20,"defeatCount":21},{"id":8,"name":"Chinese","winCount":1,"defeatCount":14},{"id":9,"name":"Byzantines","winCount":13,"defeatCount":26},{"id":10,"name":"Persians","winCount":4,"defeatCount":15},{"id":11,"name":"Saracens","winCount":3,"defeatCount":15},{"id":12,"name":"Turks","winCount":5,"defeatCount":19},{"id":13,"name":"Vikings","winCount":1,"defeatCount":14},{"id":14,"name":"Mongols","winCount":5,"defeatCount":32},{"id":15,"name":"Celts","winCount":19,"defeatCount":17},{"id":16,"name":"Spanish","winCount":6,"defeatCount":20},{"id":17,"name":"Aztecs","winCount":1,"defeatCount":15},{"id":18,"name":"Mayans","winCount":1,"defeatCount":15},{"id":19,"name":"Huns","winCount":25,"defeatCount":11},{"id":20,"name":"Koreans","winCount":4,"defeatCount":18},{"id":21,"name":"Italians","winCount":7,"defeatCount":16},{"id":22,"name":"Hindustanis","winCount":4,"defeatCount":14},{"id":23,"name":"Incas","winCount":3,"defeatCount":13},{"id":24,"name":"Magyar","winCount":1,"defeatCount":20},{"id":25,"name":"Slavs","winCount":1,"defeatCount":20},{"id":26,"name":"Portuguese","winCount":4,"defeatCount":14},{"id":27,"name":"Ethiopians","winCount":2,"defeatCount":18},{"id":28,"name":"Malians","winCount":2,"defeatCount":15},{"id":29,"name":"Berbers","winCount":4,"defeatCount":19},{"id":30,"name":"Khmer","winCount":3,"defeatCount":26},{"id":31,"name":"Malay","winCount":10,"defeatCount":13},{"id":32,"name":"Burmese","winCount":2,"defeatCount":22},{"id":33,"name":"Vietnamese","winCount":4,"defeatCount":16},{"id":34,"name":"Bulgarians","winCount":5,"defeatCount":18},{"id":35,"name":"Tatars","winCount":2,"defeatCount":21},{"id":36,"name":"Cumans","winCount":6,"defeatCount":15},{"id":37,"name":"Lithuanians","winCount":4,"defeatCount":17},{"id":38,"name":"Random","winCount":49,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":5,"defeatCount":21},{"id":175,"name":"Sicilians","winCount":2,"defeatCount":11},{"id":184,"name":"Poles","winCount":8,"defeatCount":17},{"id":185,"name":"Bohemians","winCount":4,"defeatCount":20},{"id":195,"name":"Bengalis","winCount":3,"defeatCount":18},{"id":196,"name":"Dravidians","winCount":1,"defeatCount":17},{"id":197,"name":"Gurjaras","winCount":3,"defeatCount":9},{"id":202,"name":"Romans","winCount":0,"defeatCount":1},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":28839,"highScoreMilitary":17322,"highScoreEconomy":10347,"highScoreTechnology":8025,"unitsKilled":44924,"unitsLost":34836,"buildingsRaised":9773,"buildingsLost":2518,"wondersBuilt":4,"castlesBuilt":1064,"trebsBuilt":954,"farmsBuilt":22159},"user":{"userId":"","profileId":10594768,"userName":"Turangga","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/7a32ea4436c14117d9a68852913d33c9d4dc898f_full.jpg","elo":941,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	1	-2	6	11	27.5	\N
6	Khaleed	1386590	95	2023-02-10 01:33:33	2024-11-27 14:58:04	1	https://avatars.steamstatic.com/1fedc0396f1f0254e5846415239e5071f1ca38bc_full.jpg	[OmG] Khld	1277	0	1490	{"mpStatList":{"totalMatches":272,"totalWins":156,"currentWinStreak":1},"careerStats":{"totalGames":1703,"totalWins":922,"civilizations":[{"id":3,"name":"Britons","winCount":32,"defeatCount":111},{"id":4,"name":"Franks","winCount":33,"defeatCount":148},{"id":5,"name":"Goths","winCount":25,"defeatCount":117},{"id":6,"name":"Teutons","winCount":20,"defeatCount":83},{"id":7,"name":"Japanese","winCount":13,"defeatCount":74},{"id":8,"name":"Chinese","winCount":21,"defeatCount":99},{"id":9,"name":"Byzantines","winCount":25,"defeatCount":94},{"id":10,"name":"Persians","winCount":20,"defeatCount":96},{"id":11,"name":"Saracens","winCount":25,"defeatCount":92},{"id":12,"name":"Turks","winCount":26,"defeatCount":91},{"id":13,"name":"Vikings","winCount":22,"defeatCount":91},{"id":14,"name":"Mongols","winCount":32,"defeatCount":139},{"id":15,"name":"Celts","winCount":18,"defeatCount":85},{"id":16,"name":"Spanish","winCount":39,"defeatCount":126},{"id":17,"name":"Aztecs","winCount":20,"defeatCount":81},{"id":18,"name":"Mayans","winCount":29,"defeatCount":116},{"id":19,"name":"Huns","winCount":23,"defeatCount":86},{"id":20,"name":"Koreans","winCount":24,"defeatCount":63},{"id":21,"name":"Italians","winCount":34,"defeatCount":97},{"id":22,"name":"Hindustanis","winCount":29,"defeatCount":94},{"id":23,"name":"Incas","winCount":19,"defeatCount":77},{"id":24,"name":"Magyar","winCount":32,"defeatCount":86},{"id":25,"name":"Slavs","winCount":27,"defeatCount":71},{"id":26,"name":"Portuguese","winCount":22,"defeatCount":104},{"id":27,"name":"Ethiopians","winCount":25,"defeatCount":92},{"id":28,"name":"Malians","winCount":24,"defeatCount":97},{"id":29,"name":"Berbers","winCount":35,"defeatCount":82},{"id":30,"name":"Khmer","winCount":29,"defeatCount":102},{"id":31,"name":"Malay","winCount":30,"defeatCount":104},{"id":32,"name":"Burmese","winCount":16,"defeatCount":96},{"id":33,"name":"Vietnamese","winCount":21,"defeatCount":99},{"id":34,"name":"Bulgarians","winCount":28,"defeatCount":84},{"id":35,"name":"Tatars","winCount":17,"defeatCount":77},{"id":36,"name":"Cumans","winCount":20,"defeatCount":99},{"id":37,"name":"Lithuanians","winCount":21,"defeatCount":93},{"id":38,"name":"Random","winCount":737,"defeatCount":925},{"id":174,"name":"Burgundians","winCount":15,"defeatCount":57},{"id":175,"name":"Sicilians","winCount":23,"defeatCount":61},{"id":184,"name":"Poles","winCount":19,"defeatCount":51},{"id":185,"name":"Bohemians","winCount":14,"defeatCount":48},{"id":195,"name":"Bengalis","winCount":10,"defeatCount":30},{"id":196,"name":"Dravidians","winCount":19,"defeatCount":31},{"id":197,"name":"Gurjaras","winCount":18,"defeatCount":20},{"id":202,"name":"Romans","winCount":5,"defeatCount":8},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":65902,"highScoreMilitary":49205,"highScoreEconomy":11262,"highScoreTechnology":7110,"unitsKilled":405231,"unitsLost":324128,"buildingsRaised":56315,"buildingsLost":21783,"wondersBuilt":6,"castlesBuilt":4523,"trebsBuilt":2919,"farmsBuilt":123010},"user":{"userId":"","profileId":1386590,"userName":"[OmG] Khld","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/1fedc0396f1f0254e5846415239e5071f1ca38bc_full.jpg","elo":1466,"playerStanding":0.05,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	57	-1	8	9	94.5	\N
45	maruting	4226314	60	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/7f28ef3badb5e45d7fa53cdcf5f40ba4e0139ce2_full.jpg	[OmG]maruting	1424	1021	1144	{"mpStatList":{"totalMatches":96,"totalWins":51,"currentWinStreak":0},"careerStats":{"totalGames":2274,"totalWins":1098,"civilizations":[{"id":3,"name":"Britons","winCount":37,"defeatCount":137},{"id":4,"name":"Franks","winCount":56,"defeatCount":139},{"id":5,"name":"Goths","winCount":56,"defeatCount":115},{"id":6,"name":"Teutons","winCount":31,"defeatCount":114},{"id":7,"name":"Japanese","winCount":31,"defeatCount":130},{"id":8,"name":"Chinese","winCount":23,"defeatCount":116},{"id":9,"name":"Byzantines","winCount":46,"defeatCount":113},{"id":10,"name":"Persians","winCount":34,"defeatCount":115},{"id":11,"name":"Saracens","winCount":58,"defeatCount":133},{"id":12,"name":"Turks","winCount":39,"defeatCount":121},{"id":13,"name":"Vikings","winCount":32,"defeatCount":105},{"id":14,"name":"Mongols","winCount":142,"defeatCount":127},{"id":15,"name":"Celts","winCount":51,"defeatCount":110},{"id":16,"name":"Spanish","winCount":55,"defeatCount":124},{"id":17,"name":"Aztecs","winCount":28,"defeatCount":107},{"id":18,"name":"Mayans","winCount":31,"defeatCount":107},{"id":19,"name":"Huns","winCount":74,"defeatCount":133},{"id":20,"name":"Koreans","winCount":35,"defeatCount":93},{"id":21,"name":"Italians","winCount":46,"defeatCount":111},{"id":22,"name":"Hindustanis","winCount":37,"defeatCount":101},{"id":23,"name":"Incas","winCount":26,"defeatCount":102},{"id":24,"name":"Magyar","winCount":96,"defeatCount":111},{"id":25,"name":"Slavs","winCount":36,"defeatCount":132},{"id":26,"name":"Portuguese","winCount":32,"defeatCount":117},{"id":27,"name":"Ethiopians","winCount":77,"defeatCount":104},{"id":28,"name":"Malians","winCount":31,"defeatCount":86},{"id":29,"name":"Berbers","winCount":41,"defeatCount":113},{"id":30,"name":"Khmer","winCount":45,"defeatCount":98},{"id":31,"name":"Malay","winCount":45,"defeatCount":111},{"id":32,"name":"Burmese","winCount":28,"defeatCount":111},{"id":33,"name":"Vietnamese","winCount":32,"defeatCount":111},{"id":34,"name":"Bulgarians","winCount":46,"defeatCount":112},{"id":35,"name":"Tatars","winCount":56,"defeatCount":99},{"id":36,"name":"Cumans","winCount":70,"defeatCount":103},{"id":37,"name":"Lithuanians","winCount":84,"defeatCount":108},{"id":38,"name":"Random","winCount":976,"defeatCount":103},{"id":174,"name":"Burgundians","winCount":42,"defeatCount":82},{"id":175,"name":"Sicilians","winCount":21,"defeatCount":84},{"id":184,"name":"Poles","winCount":36,"defeatCount":86},{"id":185,"name":"Bohemians","winCount":33,"defeatCount":88},{"id":195,"name":"Bengalis","winCount":27,"defeatCount":59},{"id":196,"name":"Dravidians","winCount":30,"defeatCount":87},{"id":197,"name":"Gurjaras","winCount":27,"defeatCount":59},{"id":202,"name":"Romans","winCount":0,"defeatCount":18},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":53783,"highScoreMilitary":32372,"highScoreEconomy":16060,"highScoreTechnology":7046,"unitsKilled":815150,"unitsLost":662934,"buildingsRaised":62825,"buildingsLost":69136,"wondersBuilt":2,"castlesBuilt":9791,"trebsBuilt":5208,"farmsBuilt":210225},"user":{"userId":"","profileId":4226314,"userName":"[OmG]maruting","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/7f28ef3badb5e45d7fa53cdcf5f40ba4e0139ce2_full.jpg","elo":1179,"playerStanding":0.27,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	42	3	9	8	60.5	\N
33	Biru_Hantara	4516139	65	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	LowElo_Ihcod Agedas	1374	846	1152	{"mpStatList":{"totalMatches":561,"totalWins":257,"currentWinStreak":0},"careerStats":{"totalGames":4418,"totalWins":1989,"civilizations":[{"id":3,"name":"Britons","winCount":50,"defeatCount":230},{"id":4,"name":"Franks","winCount":69,"defeatCount":226},{"id":5,"name":"Goths","winCount":61,"defeatCount":199},{"id":6,"name":"Teutons","winCount":39,"defeatCount":167},{"id":7,"name":"Japanese","winCount":83,"defeatCount":159},{"id":8,"name":"Chinese","winCount":33,"defeatCount":172},{"id":9,"name":"Byzantines","winCount":89,"defeatCount":163},{"id":10,"name":"Persians","winCount":55,"defeatCount":220},{"id":11,"name":"Saracens","winCount":45,"defeatCount":157},{"id":12,"name":"Turks","winCount":37,"defeatCount":184},{"id":13,"name":"Vikings","winCount":34,"defeatCount":153},{"id":14,"name":"Mongols","winCount":57,"defeatCount":223},{"id":15,"name":"Celts","winCount":44,"defeatCount":167},{"id":16,"name":"Spanish","winCount":87,"defeatCount":191},{"id":17,"name":"Aztecs","winCount":33,"defeatCount":160},{"id":18,"name":"Mayans","winCount":34,"defeatCount":173},{"id":19,"name":"Huns","winCount":126,"defeatCount":187},{"id":20,"name":"Koreans","winCount":52,"defeatCount":156},{"id":21,"name":"Italians","winCount":42,"defeatCount":143},{"id":22,"name":"Hindustanis","winCount":54,"defeatCount":176},{"id":23,"name":"Incas","winCount":58,"defeatCount":130},{"id":24,"name":"Magyar","winCount":58,"defeatCount":179},{"id":25,"name":"Slavs","winCount":28,"defeatCount":149},{"id":26,"name":"Portuguese","winCount":32,"defeatCount":171},{"id":27,"name":"Ethiopians","winCount":32,"defeatCount":189},{"id":28,"name":"Malians","winCount":26,"defeatCount":152},{"id":29,"name":"Berbers","winCount":41,"defeatCount":166},{"id":30,"name":"Khmer","winCount":123,"defeatCount":165},{"id":31,"name":"Malay","winCount":48,"defeatCount":148},{"id":32,"name":"Burmese","winCount":37,"defeatCount":166},{"id":33,"name":"Vietnamese","winCount":30,"defeatCount":197},{"id":34,"name":"Bulgarians","winCount":32,"defeatCount":137},{"id":35,"name":"Tatars","winCount":33,"defeatCount":159},{"id":36,"name":"Cumans","winCount":48,"defeatCount":168},{"id":37,"name":"Lithuanians","winCount":39,"defeatCount":183},{"id":38,"name":"Random","winCount":1280,"defeatCount":955},{"id":174,"name":"Burgundians","winCount":35,"defeatCount":115},{"id":175,"name":"Sicilians","winCount":35,"defeatCount":108},{"id":184,"name":"Poles","winCount":17,"defeatCount":87},{"id":185,"name":"Bohemians","winCount":24,"defeatCount":110},{"id":195,"name":"Bengalis","winCount":22,"defeatCount":52},{"id":196,"name":"Dravidians","winCount":18,"defeatCount":68},{"id":197,"name":"Gurjaras","winCount":18,"defeatCount":69},{"id":202,"name":"Romans","winCount":2,"defeatCount":19},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":57024,"highScoreMilitary":43435,"highScoreEconomy":13464,"highScoreTechnology":8568,"unitsKilled":591447,"unitsLost":709794,"buildingsRaised":72727,"buildingsLost":92726,"wondersBuilt":0,"castlesBuilt":8406,"trebsBuilt":8044,"farmsBuilt":321848},"user":{"userId":"","profileId":4516139,"userName":"LowElo_Ihcod Agedas","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1102,"playerStanding":0.38,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	97	7	6	11	67.5	\N
24	Tertykung	6130469	70	2023-02-10 01:33:33	2024-11-27 14:58:19	1	https://avatars.steamstatic.com/0dd1cf245683dde889a559541aca65a03fb960aa_full.jpg	| Bifi | Tertykung	1468	0	0	{"mpStatList":{"totalMatches":90,"totalWins":54,"currentWinStreak":0},"careerStats":{"totalGames":1356,"totalWins":793,"civilizations":[{"id":3,"name":"Britons","winCount":71,"defeatCount":96},{"id":4,"name":"Franks","winCount":166,"defeatCount":119},{"id":5,"name":"Goths","winCount":26,"defeatCount":118},{"id":6,"name":"Teutons","winCount":13,"defeatCount":93},{"id":7,"name":"Japanese","winCount":19,"defeatCount":86},{"id":8,"name":"Chinese","winCount":14,"defeatCount":61},{"id":9,"name":"Byzantines","winCount":11,"defeatCount":111},{"id":10,"name":"Persians","winCount":35,"defeatCount":103},{"id":11,"name":"Saracens","winCount":15,"defeatCount":67},{"id":12,"name":"Turks","winCount":8,"defeatCount":73},{"id":13,"name":"Vikings","winCount":13,"defeatCount":76},{"id":14,"name":"Mongols","winCount":57,"defeatCount":109},{"id":15,"name":"Celts","winCount":28,"defeatCount":77},{"id":16,"name":"Spanish","winCount":41,"defeatCount":109},{"id":17,"name":"Aztecs","winCount":10,"defeatCount":73},{"id":18,"name":"Mayans","winCount":23,"defeatCount":86},{"id":19,"name":"Huns","winCount":24,"defeatCount":85},{"id":20,"name":"Koreans","winCount":8,"defeatCount":89},{"id":21,"name":"Italians","winCount":10,"defeatCount":105},{"id":22,"name":"Hindustanis","winCount":22,"defeatCount":95},{"id":23,"name":"Incas","winCount":18,"defeatCount":71},{"id":24,"name":"Magyar","winCount":24,"defeatCount":95},{"id":25,"name":"Slavs","winCount":9,"defeatCount":61},{"id":26,"name":"Portuguese","winCount":14,"defeatCount":79},{"id":27,"name":"Ethiopians","winCount":52,"defeatCount":102},{"id":28,"name":"Malians","winCount":9,"defeatCount":94},{"id":29,"name":"Berbers","winCount":5,"defeatCount":87},{"id":30,"name":"Khmer","winCount":16,"defeatCount":101},{"id":31,"name":"Malay","winCount":15,"defeatCount":77},{"id":32,"name":"Burmese","winCount":12,"defeatCount":76},{"id":33,"name":"Vietnamese","winCount":10,"defeatCount":85},{"id":34,"name":"Bulgarians","winCount":18,"defeatCount":78},{"id":35,"name":"Tatars","winCount":53,"defeatCount":81},{"id":36,"name":"Cumans","winCount":59,"defeatCount":87},{"id":37,"name":"Lithuanians","winCount":28,"defeatCount":71},{"id":38,"name":"Random","winCount":464,"defeatCount":168},{"id":174,"name":"Burgundians","winCount":54,"defeatCount":74},{"id":175,"name":"Sicilians","winCount":32,"defeatCount":59},{"id":184,"name":"Poles","winCount":19,"defeatCount":66},{"id":185,"name":"Bohemians","winCount":13,"defeatCount":56},{"id":195,"name":"Bengalis","winCount":15,"defeatCount":39},{"id":196,"name":"Dravidians","winCount":23,"defeatCount":48},{"id":197,"name":"Gurjaras","winCount":15,"defeatCount":38},{"id":202,"name":"Romans","winCount":0,"defeatCount":26},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":73140,"highScoreMilitary":65410,"highScoreEconomy":28963,"highScoreTechnology":9634,"unitsKilled":744101,"unitsLost":362655,"buildingsRaised":86785,"buildingsLost":13927,"wondersBuilt":5,"castlesBuilt":5505,"trebsBuilt":2807,"farmsBuilt":155609},"user":{"userId":"","profileId":6130469,"userName":"| Bifi | Tertykung","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/0dd1cf245683dde889a559541aca65a03fb960aa_full.jpg","elo":1358,"playerStanding":0.09,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	22	2	0	0	70	\N
26	Muzay24	2991308	75	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/e56f6d569a105947b05379563bc1bc41fb7df518_full.jpg	LowElo_Muzay24	1405	1173	1151	{"mpStatList":{"totalMatches":99,"totalWins":56,"currentWinStreak":0},"careerStats":{"totalGames":1277,"totalWins":564,"civilizations":[{"id":3,"name":"Britons","winCount":28,"defeatCount":128},{"id":4,"name":"Franks","winCount":23,"defeatCount":189},{"id":5,"name":"Goths","winCount":21,"defeatCount":111},{"id":6,"name":"Teutons","winCount":33,"defeatCount":128},{"id":7,"name":"Japanese","winCount":17,"defeatCount":58},{"id":8,"name":"Chinese","winCount":17,"defeatCount":86},{"id":9,"name":"Byzantines","winCount":24,"defeatCount":136},{"id":10,"name":"Persians","winCount":22,"defeatCount":91},{"id":11,"name":"Saracens","winCount":34,"defeatCount":92},{"id":12,"name":"Turks","winCount":14,"defeatCount":117},{"id":13,"name":"Vikings","winCount":17,"defeatCount":60},{"id":14,"name":"Mongols","winCount":31,"defeatCount":121},{"id":15,"name":"Celts","winCount":25,"defeatCount":96},{"id":16,"name":"Spanish","winCount":16,"defeatCount":94},{"id":17,"name":"Aztecs","winCount":15,"defeatCount":62},{"id":18,"name":"Mayans","winCount":14,"defeatCount":55},{"id":19,"name":"Huns","winCount":23,"defeatCount":56},{"id":20,"name":"Koreans","winCount":19,"defeatCount":40},{"id":21,"name":"Italians","winCount":32,"defeatCount":148},{"id":22,"name":"Hindustanis","winCount":26,"defeatCount":105},{"id":23,"name":"Incas","winCount":29,"defeatCount":99},{"id":24,"name":"Magyar","winCount":23,"defeatCount":89},{"id":25,"name":"Slavs","winCount":22,"defeatCount":130},{"id":26,"name":"Portuguese","winCount":18,"defeatCount":63},{"id":27,"name":"Ethiopians","winCount":17,"defeatCount":89},{"id":28,"name":"Malians","winCount":33,"defeatCount":84},{"id":29,"name":"Berbers","winCount":11,"defeatCount":72},{"id":30,"name":"Khmer","winCount":31,"defeatCount":108},{"id":31,"name":"Malay","winCount":16,"defeatCount":83},{"id":32,"name":"Burmese","winCount":23,"defeatCount":85},{"id":33,"name":"Vietnamese","winCount":24,"defeatCount":86},{"id":34,"name":"Bulgarians","winCount":30,"defeatCount":66},{"id":35,"name":"Tatars","winCount":29,"defeatCount":111},{"id":36,"name":"Cumans","winCount":22,"defeatCount":81},{"id":37,"name":"Lithuanians","winCount":31,"defeatCount":73},{"id":38,"name":"Random","winCount":430,"defeatCount":834},{"id":174,"name":"Burgundians","winCount":21,"defeatCount":40},{"id":175,"name":"Sicilians","winCount":13,"defeatCount":53},{"id":184,"name":"Poles","winCount":13,"defeatCount":30},{"id":185,"name":"Bohemians","winCount":9,"defeatCount":53},{"id":195,"name":"Bengalis","winCount":19,"defeatCount":17},{"id":196,"name":"Dravidians","winCount":18,"defeatCount":22},{"id":197,"name":"Gurjaras","winCount":27,"defeatCount":34},{"id":202,"name":"Romans","winCount":6,"defeatCount":8},{"id":204,"name":"Pompeii_Assyrian","winCount":92,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":2},{"id":208,"name":"Pompeii_Carthaginian","winCount":4,"defeatCount":8},{"id":210,"name":"Pompeii_Choson","winCount":3,"defeatCount":4},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":1},{"id":216,"name":"Pompeii_Hittite","winCount":8,"defeatCount":21},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":6},{"id":220,"name":"Pompeii_Minoan","winCount":5,"defeatCount":11},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":2},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":1},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":17},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":5,"defeatCount":22},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":5,"defeatCount":17},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":143559,"highScoreMilitary":65253,"highScoreEconomy":40321,"highScoreTechnology":13629,"unitsKilled":662498,"unitsLost":400134,"buildingsRaised":89319,"buildingsLost":19097,"wondersBuilt":20,"castlesBuilt":5802,"trebsBuilt":5305,"farmsBuilt":121504},"user":{"userId":"","profileId":2991308,"userName":"LowElo_Muzay24","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/e56f6d569a105947b05379563bc1bc41fb7df518_full.jpg","elo":1112,"playerStanding":0.37,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	14	-1	8	9	74.5	\N
1066	Smol Gura	18171781	55	\N	2024-11-27 14:56:28	1	https://avatars.steamstatic.com/3b84aaeace0301040a53d40a6a14cee84e6b806a_full.jpg	Smol Gura	1317	0	1086	{"mpStatList":{"totalMatches":139,"totalWins":70,"currentWinStreak":0},"careerStats":{"totalGames":369,"totalWins":173,"civilizations":[{"id":3,"name":"Britons","winCount":9,"defeatCount":22},{"id":4,"name":"Franks","winCount":4,"defeatCount":27},{"id":5,"name":"Goths","winCount":8,"defeatCount":15},{"id":6,"name":"Teutons","winCount":13,"defeatCount":10},{"id":7,"name":"Japanese","winCount":9,"defeatCount":15},{"id":8,"name":"Chinese","winCount":2,"defeatCount":11},{"id":9,"name":"Byzantines","winCount":2,"defeatCount":17},{"id":10,"name":"Persians","winCount":5,"defeatCount":22},{"id":11,"name":"Saracens","winCount":4,"defeatCount":18},{"id":12,"name":"Turks","winCount":5,"defeatCount":22},{"id":13,"name":"Vikings","winCount":5,"defeatCount":15},{"id":14,"name":"Mongols","winCount":9,"defeatCount":16},{"id":15,"name":"Celts","winCount":7,"defeatCount":17},{"id":16,"name":"Spanish","winCount":5,"defeatCount":20},{"id":17,"name":"Aztecs","winCount":3,"defeatCount":15},{"id":18,"name":"Mayans","winCount":6,"defeatCount":17},{"id":19,"name":"Huns","winCount":6,"defeatCount":21},{"id":20,"name":"Koreans","winCount":3,"defeatCount":15},{"id":21,"name":"Italians","winCount":8,"defeatCount":11},{"id":22,"name":"Hindustanis","winCount":3,"defeatCount":9},{"id":23,"name":"Incas","winCount":2,"defeatCount":7},{"id":24,"name":"Magyar","winCount":6,"defeatCount":11},{"id":25,"name":"Slavs","winCount":7,"defeatCount":11},{"id":26,"name":"Portuguese","winCount":4,"defeatCount":18},{"id":27,"name":"Ethiopians","winCount":2,"defeatCount":13},{"id":28,"name":"Malians","winCount":6,"defeatCount":11},{"id":29,"name":"Berbers","winCount":2,"defeatCount":12},{"id":30,"name":"Khmer","winCount":3,"defeatCount":25},{"id":31,"name":"Malay","winCount":7,"defeatCount":11},{"id":32,"name":"Burmese","winCount":4,"defeatCount":9},{"id":33,"name":"Vietnamese","winCount":2,"defeatCount":17},{"id":34,"name":"Bulgarians","winCount":1,"defeatCount":7},{"id":35,"name":"Tatars","winCount":1,"defeatCount":14},{"id":36,"name":"Cumans","winCount":7,"defeatCount":18},{"id":37,"name":"Lithuanians","winCount":2,"defeatCount":15},{"id":38,"name":"Random","winCount":90,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":5,"defeatCount":11},{"id":175,"name":"Sicilians","winCount":5,"defeatCount":12},{"id":184,"name":"Poles","winCount":5,"defeatCount":9},{"id":185,"name":"Bohemians","winCount":7,"defeatCount":14},{"id":195,"name":"Bengalis","winCount":2,"defeatCount":5},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":9},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":11},{"id":202,"name":"Romans","winCount":0,"defeatCount":10},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":42573,"highScoreMilitary":32947,"highScoreEconomy":13926,"highScoreTechnology":6825,"unitsKilled":46733,"unitsLost":54729,"buildingsRaised":6580,"buildingsLost":6227,"wondersBuilt":0,"castlesBuilt":739,"trebsBuilt":534,"farmsBuilt":13390},"user":{"userId":"","profileId":18171781,"userName":"Smol Gura","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/3b84aaeace0301040a53d40a6a14cee84e6b806a_full.jpg","elo":1072,"playerStanding":0.42,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	4	-2	10	7	56.5	\N
11	MochRPratama	3216997	85	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/ab1a827e2157192266669d17b1f4eaf112d52b09_full.jpg	| Bifi | Akabane	1391	1325	1334	{"mpStatList":{"totalMatches":151,"totalWins":97,"currentWinStreak":2},"careerStats":{"totalGames":2666,"totalWins":1573,"civilizations":[{"id":3,"name":"Britons","winCount":20,"defeatCount":199},{"id":4,"name":"Franks","winCount":79,"defeatCount":204},{"id":5,"name":"Goths","winCount":50,"defeatCount":192},{"id":6,"name":"Teutons","winCount":35,"defeatCount":170},{"id":7,"name":"Japanese","winCount":31,"defeatCount":173},{"id":8,"name":"Chinese","winCount":38,"defeatCount":166},{"id":9,"name":"Byzantines","winCount":46,"defeatCount":184},{"id":10,"name":"Persians","winCount":73,"defeatCount":179},{"id":11,"name":"Saracens","winCount":22,"defeatCount":175},{"id":12,"name":"Turks","winCount":42,"defeatCount":167},{"id":13,"name":"Vikings","winCount":27,"defeatCount":176},{"id":14,"name":"Mongols","winCount":89,"defeatCount":201},{"id":15,"name":"Celts","winCount":45,"defeatCount":178},{"id":16,"name":"Spanish","winCount":49,"defeatCount":207},{"id":17,"name":"Aztecs","winCount":36,"defeatCount":189},{"id":18,"name":"Mayans","winCount":42,"defeatCount":176},{"id":19,"name":"Huns","winCount":69,"defeatCount":181},{"id":20,"name":"Koreans","winCount":42,"defeatCount":167},{"id":21,"name":"Italians","winCount":32,"defeatCount":143},{"id":22,"name":"Hindustanis","winCount":36,"defeatCount":181},{"id":23,"name":"Incas","winCount":23,"defeatCount":178},{"id":24,"name":"Magyar","winCount":199,"defeatCount":174},{"id":25,"name":"Slavs","winCount":55,"defeatCount":160},{"id":26,"name":"Portuguese","winCount":71,"defeatCount":183},{"id":27,"name":"Ethiopians","winCount":31,"defeatCount":188},{"id":28,"name":"Malians","winCount":37,"defeatCount":167},{"id":29,"name":"Berbers","winCount":41,"defeatCount":191},{"id":30,"name":"Khmer","winCount":54,"defeatCount":186},{"id":31,"name":"Malay","winCount":29,"defeatCount":193},{"id":32,"name":"Burmese","winCount":38,"defeatCount":147},{"id":33,"name":"Vietnamese","winCount":36,"defeatCount":183},{"id":34,"name":"Bulgarians","winCount":31,"defeatCount":177},{"id":35,"name":"Tatars","winCount":36,"defeatCount":162},{"id":36,"name":"Cumans","winCount":52,"defeatCount":173},{"id":37,"name":"Lithuanians","winCount":120,"defeatCount":169},{"id":38,"name":"Random","winCount":972,"defeatCount":1162},{"id":174,"name":"Burgundians","winCount":31,"defeatCount":118},{"id":175,"name":"Sicilians","winCount":19,"defeatCount":124},{"id":184,"name":"Poles","winCount":64,"defeatCount":117},{"id":185,"name":"Bohemians","winCount":32,"defeatCount":113},{"id":195,"name":"Bengalis","winCount":29,"defeatCount":63},{"id":196,"name":"Dravidians","winCount":37,"defeatCount":71},{"id":197,"name":"Gurjaras","winCount":83,"defeatCount":56},{"id":202,"name":"Romans","winCount":14,"defeatCount":23},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":65010,"highScoreMilitary":63150,"highScoreEconomy":24366,"highScoreTechnology":15325,"unitsKilled":1151866,"unitsLost":544239,"buildingsRaised":157277,"buildingsLost":32185,"wondersBuilt":0,"castlesBuilt":12202,"trebsBuilt":7061,"farmsBuilt":254777},"user":{"userId":"","profileId":3216997,"userName":"| Bifi | Akabane","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/ab1a827e2157192266669d17b1f4eaf112d52b09_full.jpg","elo":1369,"playerStanding":0.1,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	134	-1	9	8	85.5	\N
63	ganti_id	3023292	30	2023-02-10 01:33:33	2024-11-27 14:58:34	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	ganti_id	1345	0	0	{"mpStatList":{"totalMatches":0,"totalWins":0,"currentWinStreak":0},"careerStats":{"totalGames":360,"totalWins":165,"civilizations":[{"id":3,"name":"Britons","winCount":5,"defeatCount":25},{"id":4,"name":"Franks","winCount":6,"defeatCount":40},{"id":5,"name":"Goths","winCount":4,"defeatCount":22},{"id":6,"name":"Teutons","winCount":6,"defeatCount":26},{"id":7,"name":"Japanese","winCount":4,"defeatCount":11},{"id":8,"name":"Chinese","winCount":2,"defeatCount":18},{"id":9,"name":"Byzantines","winCount":3,"defeatCount":16},{"id":10,"name":"Persians","winCount":6,"defeatCount":23},{"id":11,"name":"Saracens","winCount":5,"defeatCount":18},{"id":12,"name":"Turks","winCount":5,"defeatCount":17},{"id":13,"name":"Vikings","winCount":5,"defeatCount":15},{"id":14,"name":"Mongols","winCount":2,"defeatCount":17},{"id":15,"name":"Celts","winCount":3,"defeatCount":17},{"id":16,"name":"Spanish","winCount":4,"defeatCount":25},{"id":17,"name":"Aztecs","winCount":13,"defeatCount":10},{"id":18,"name":"Mayans","winCount":7,"defeatCount":13},{"id":19,"name":"Huns","winCount":0,"defeatCount":32},{"id":20,"name":"Koreans","winCount":4,"defeatCount":7},{"id":21,"name":"Italians","winCount":7,"defeatCount":16},{"id":22,"name":"Hindustanis","winCount":6,"defeatCount":12},{"id":23,"name":"Incas","winCount":7,"defeatCount":6},{"id":24,"name":"Magyar","winCount":5,"defeatCount":25},{"id":25,"name":"Slavs","winCount":5,"defeatCount":12},{"id":26,"name":"Portuguese","winCount":9,"defeatCount":15},{"id":27,"name":"Ethiopians","winCount":5,"defeatCount":11},{"id":28,"name":"Malians","winCount":4,"defeatCount":13},{"id":29,"name":"Berbers","winCount":5,"defeatCount":12},{"id":30,"name":"Khmer","winCount":6,"defeatCount":25},{"id":31,"name":"Malay","winCount":5,"defeatCount":9},{"id":32,"name":"Burmese","winCount":3,"defeatCount":12},{"id":33,"name":"Vietnamese","winCount":9,"defeatCount":15},{"id":34,"name":"Bulgarians","winCount":7,"defeatCount":5},{"id":35,"name":"Tatars","winCount":2,"defeatCount":10},{"id":36,"name":"Cumans","winCount":5,"defeatCount":12},{"id":37,"name":"Lithuanians","winCount":4,"defeatCount":15},{"id":38,"name":"Random","winCount":156,"defeatCount":156},{"id":174,"name":"Burgundians","winCount":2,"defeatCount":9},{"id":175,"name":"Sicilians","winCount":3,"defeatCount":4},{"id":184,"name":"Poles","winCount":1,"defeatCount":2},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":2},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":3},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":1,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":79360,"highScoreMilitary":65371,"highScoreEconomy":13385,"highScoreTechnology":6494,"unitsKilled":55240,"unitsLost":57426,"buildingsRaised":4423,"buildingsLost":5169,"wondersBuilt":0,"castlesBuilt":497,"trebsBuilt":319,"farmsBuilt":31920},"user":{"userId":"","profileId":3023292,"userName":"ganti_id","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":null,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	37	-1	0	1	29.5	\N
1055	wkwkwkwkwk	5040262	60	\N	2024-11-27 14:58:38	1	https://avatars.steamstatic.com/c9d5d805bb6df554c34a8b4616be739ad9f38a8f_full.jpg	wkwkwkwkwk	0	0	0	{"mpStatList":{"totalMatches":346,"totalWins":155,"currentWinStreak":0},"careerStats":{"totalGames":426,"totalWins":186,"civilizations":[{"id":3,"name":"Britons","winCount":1,"defeatCount":44},{"id":4,"name":"Franks","winCount":3,"defeatCount":46},{"id":5,"name":"Goths","winCount":4,"defeatCount":33},{"id":6,"name":"Teutons","winCount":2,"defeatCount":34},{"id":7,"name":"Japanese","winCount":0,"defeatCount":12},{"id":8,"name":"Chinese","winCount":0,"defeatCount":25},{"id":9,"name":"Byzantines","winCount":7,"defeatCount":18},{"id":10,"name":"Persians","winCount":91,"defeatCount":27},{"id":11,"name":"Saracens","winCount":3,"defeatCount":8},{"id":12,"name":"Turks","winCount":32,"defeatCount":15},{"id":13,"name":"Vikings","winCount":3,"defeatCount":12},{"id":14,"name":"Mongols","winCount":0,"defeatCount":25},{"id":15,"name":"Celts","winCount":4,"defeatCount":13},{"id":16,"name":"Spanish","winCount":0,"defeatCount":22},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":8},{"id":18,"name":"Mayans","winCount":0,"defeatCount":13},{"id":19,"name":"Huns","winCount":0,"defeatCount":37},{"id":20,"name":"Koreans","winCount":0,"defeatCount":13},{"id":21,"name":"Italians","winCount":0,"defeatCount":8},{"id":22,"name":"Hindustanis","winCount":1,"defeatCount":9},{"id":23,"name":"Incas","winCount":0,"defeatCount":7},{"id":24,"name":"Magyar","winCount":9,"defeatCount":14},{"id":25,"name":"Slavs","winCount":0,"defeatCount":17},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":16},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":17},{"id":28,"name":"Malians","winCount":0,"defeatCount":12},{"id":29,"name":"Berbers","winCount":1,"defeatCount":6},{"id":30,"name":"Khmer","winCount":1,"defeatCount":37},{"id":31,"name":"Malay","winCount":9,"defeatCount":11},{"id":32,"name":"Burmese","winCount":0,"defeatCount":6},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":14},{"id":34,"name":"Bulgarians","winCount":4,"defeatCount":11},{"id":35,"name":"Tatars","winCount":1,"defeatCount":13},{"id":36,"name":"Cumans","winCount":1,"defeatCount":16},{"id":37,"name":"Lithuanians","winCount":28,"defeatCount":15},{"id":38,"name":"Random","winCount":7,"defeatCount":106},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":19},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":12},{"id":184,"name":"Poles","winCount":0,"defeatCount":3},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":9},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":0},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":1},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":43916,"highScoreMilitary":28041,"highScoreEconomy":11887,"highScoreTechnology":8221,"unitsKilled":61181,"unitsLost":73741,"buildingsRaised":4846,"buildingsLost":5628,"wondersBuilt":0,"castlesBuilt":933,"trebsBuilt":670,"farmsBuilt":33713},"user":{"userId":"","profileId":5040262,"userName":"wkwkwkwkwk","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/c9d5d805bb6df554c34a8b4616be739ad9f38a8f_full.jpg","elo":735,"playerStanding":0.92,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	1	3	5	59	\N
12448399	kelinciMerah	11303898	55	\N	2024-11-27 14:56:42	1	https://avatars.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg	Kelinci Merah 123	1319	842	0	{"mpStatList":{"totalMatches":5,"totalWins":3,"currentWinStreak":1},"careerStats":{"totalGames":444,"totalWins":216,"civilizations":[{"id":3,"name":"Britons","winCount":22,"defeatCount":93},{"id":4,"name":"Franks","winCount":22,"defeatCount":109},{"id":5,"name":"Goths","winCount":23,"defeatCount":98},{"id":6,"name":"Teutons","winCount":23,"defeatCount":110},{"id":7,"name":"Japanese","winCount":15,"defeatCount":30},{"id":8,"name":"Chinese","winCount":3,"defeatCount":69},{"id":9,"name":"Byzantines","winCount":20,"defeatCount":110},{"id":10,"name":"Persians","winCount":8,"defeatCount":48},{"id":11,"name":"Saracens","winCount":32,"defeatCount":77},{"id":12,"name":"Turks","winCount":13,"defeatCount":64},{"id":13,"name":"Vikings","winCount":4,"defeatCount":16},{"id":14,"name":"Mongols","winCount":32,"defeatCount":77},{"id":15,"name":"Celts","winCount":25,"defeatCount":55},{"id":16,"name":"Spanish","winCount":19,"defeatCount":63},{"id":17,"name":"Aztecs","winCount":11,"defeatCount":32},{"id":18,"name":"Mayans","winCount":7,"defeatCount":36},{"id":19,"name":"Huns","winCount":30,"defeatCount":46},{"id":20,"name":"Koreans","winCount":23,"defeatCount":18},{"id":21,"name":"Italians","winCount":12,"defeatCount":68},{"id":22,"name":"Hindustanis","winCount":10,"defeatCount":45},{"id":23,"name":"Incas","winCount":12,"defeatCount":67},{"id":24,"name":"Magyar","winCount":9,"defeatCount":22},{"id":25,"name":"Slavs","winCount":2,"defeatCount":106},{"id":26,"name":"Portuguese","winCount":8,"defeatCount":40},{"id":27,"name":"Ethiopians","winCount":29,"defeatCount":69},{"id":28,"name":"Malians","winCount":13,"defeatCount":40},{"id":29,"name":"Berbers","winCount":16,"defeatCount":40},{"id":30,"name":"Khmer","winCount":19,"defeatCount":70},{"id":31,"name":"Malay","winCount":14,"defeatCount":70},{"id":32,"name":"Burmese","winCount":13,"defeatCount":36},{"id":33,"name":"Vietnamese","winCount":13,"defeatCount":35},{"id":34,"name":"Bulgarians","winCount":14,"defeatCount":47},{"id":35,"name":"Tatars","winCount":20,"defeatCount":91},{"id":36,"name":"Cumans","winCount":15,"defeatCount":36},{"id":37,"name":"Lithuanians","winCount":21,"defeatCount":69},{"id":38,"name":"Random","winCount":65,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":7,"defeatCount":33},{"id":175,"name":"Sicilians","winCount":8,"defeatCount":30},{"id":184,"name":"Poles","winCount":12,"defeatCount":42},{"id":185,"name":"Bohemians","winCount":39,"defeatCount":59},{"id":195,"name":"Bengalis","winCount":6,"defeatCount":30},{"id":196,"name":"Dravidians","winCount":13,"defeatCount":54},{"id":197,"name":"Gurjaras","winCount":14,"defeatCount":72},{"id":202,"name":"Romans","winCount":0,"defeatCount":21},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":65108,"highScoreMilitary":64673,"highScoreEconomy":62689,"highScoreTechnology":10311,"unitsKilled":424031,"unitsLost":222828,"buildingsRaised":41764,"buildingsLost":12978,"wondersBuilt":17,"castlesBuilt":2499,"trebsBuilt":1679,"farmsBuilt":54707},"user":{"userId":"","profileId":11303898,"userName":"Kelinci Merah 123","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_full.jpg","elo":1058,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	15	-1	0	0	55	\N
30	_syu_	4033185	75	2023-02-10 01:33:33	2024-11-27 14:58:48	1	https://avatars.steamstatic.com/f8bfdc239fa7d7f66453b55bc61eb9673a2f9a8b_full.jpg	[xbow] _syu_	1271	1290	1263	{"mpStatList":{"totalMatches":118,"totalWins":69,"currentWinStreak":0},"careerStats":{"totalGames":2211,"totalWins":1051,"civilizations":[{"id":3,"name":"Britons","winCount":19,"defeatCount":108},{"id":4,"name":"Franks","winCount":36,"defeatCount":91},{"id":5,"name":"Goths","winCount":24,"defeatCount":88},{"id":6,"name":"Teutons","winCount":18,"defeatCount":98},{"id":7,"name":"Japanese","winCount":28,"defeatCount":104},{"id":8,"name":"Chinese","winCount":29,"defeatCount":84},{"id":9,"name":"Byzantines","winCount":14,"defeatCount":104},{"id":10,"name":"Persians","winCount":39,"defeatCount":104},{"id":11,"name":"Saracens","winCount":33,"defeatCount":115},{"id":12,"name":"Turks","winCount":26,"defeatCount":71},{"id":13,"name":"Vikings","winCount":14,"defeatCount":81},{"id":14,"name":"Mongols","winCount":55,"defeatCount":119},{"id":15,"name":"Celts","winCount":28,"defeatCount":91},{"id":16,"name":"Spanish","winCount":51,"defeatCount":93},{"id":17,"name":"Aztecs","winCount":33,"defeatCount":93},{"id":18,"name":"Mayans","winCount":39,"defeatCount":109},{"id":19,"name":"Huns","winCount":24,"defeatCount":95},{"id":20,"name":"Koreans","winCount":51,"defeatCount":86},{"id":21,"name":"Italians","winCount":24,"defeatCount":86},{"id":22,"name":"Hindustanis","winCount":19,"defeatCount":83},{"id":23,"name":"Incas","winCount":23,"defeatCount":85},{"id":24,"name":"Magyar","winCount":28,"defeatCount":89},{"id":25,"name":"Slavs","winCount":22,"defeatCount":80},{"id":26,"name":"Portuguese","winCount":18,"defeatCount":109},{"id":27,"name":"Ethiopians","winCount":27,"defeatCount":92},{"id":28,"name":"Malians","winCount":22,"defeatCount":85},{"id":29,"name":"Berbers","winCount":21,"defeatCount":91},{"id":30,"name":"Khmer","winCount":58,"defeatCount":101},{"id":31,"name":"Malay","winCount":20,"defeatCount":107},{"id":32,"name":"Burmese","winCount":18,"defeatCount":110},{"id":33,"name":"Vietnamese","winCount":24,"defeatCount":90},{"id":34,"name":"Bulgarians","winCount":25,"defeatCount":81},{"id":35,"name":"Tatars","winCount":15,"defeatCount":81},{"id":36,"name":"Cumans","winCount":29,"defeatCount":94},{"id":37,"name":"Lithuanians","winCount":37,"defeatCount":96},{"id":38,"name":"Random","winCount":800,"defeatCount":614},{"id":174,"name":"Burgundians","winCount":10,"defeatCount":63},{"id":175,"name":"Sicilians","winCount":17,"defeatCount":63},{"id":184,"name":"Poles","winCount":11,"defeatCount":59},{"id":185,"name":"Bohemians","winCount":38,"defeatCount":65},{"id":195,"name":"Bengalis","winCount":20,"defeatCount":43},{"id":196,"name":"Dravidians","winCount":9,"defeatCount":44},{"id":197,"name":"Gurjaras","winCount":17,"defeatCount":38},{"id":202,"name":"Romans","winCount":0,"defeatCount":13},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":51610,"highScoreMilitary":33255,"highScoreEconomy":13666,"highScoreTechnology":8781,"unitsKilled":352229,"unitsLost":354939,"buildingsRaised":39732,"buildingsLost":49963,"wondersBuilt":0,"castlesBuilt":3934,"trebsBuilt":2743,"farmsBuilt":128129},"user":{"userId":"","profileId":4033185,"userName":"[xbow] _syu_","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/f8bfdc239fa7d7f66453b55bc61eb9673a2f9a8b_full.jpg","elo":1288,"playerStanding":0.16,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	57	2	8	9	69.5	\N
18170633	Bang Gere	19882187	50	2024-05-27 12:31:44	2024-11-27 14:58:50	1	https://avatars.steamstatic.com/a13d77e78e012de06ebb1be3b0233d8d5769cebb_full.jpg	[OmG] Bang Gere	1102	0	0	{"mpStatList":{"totalMatches":0,"totalWins":0,"currentWinStreak":0},"careerStats":{"totalGames":10,"totalWins":2,"civilizations":[{"id":3,"name":"Britons","winCount":0,"defeatCount":0},{"id":4,"name":"Franks","winCount":0,"defeatCount":0},{"id":5,"name":"Goths","winCount":0,"defeatCount":0},{"id":6,"name":"Teutons","winCount":0,"defeatCount":0},{"id":7,"name":"Japanese","winCount":4,"defeatCount":0},{"id":8,"name":"Chinese","winCount":0,"defeatCount":0},{"id":9,"name":"Byzantines","winCount":0,"defeatCount":0},{"id":10,"name":"Persians","winCount":0,"defeatCount":1},{"id":11,"name":"Saracens","winCount":0,"defeatCount":0},{"id":12,"name":"Turks","winCount":0,"defeatCount":0},{"id":13,"name":"Vikings","winCount":0,"defeatCount":0},{"id":14,"name":"Mongols","winCount":2,"defeatCount":0},{"id":15,"name":"Celts","winCount":0,"defeatCount":0},{"id":16,"name":"Spanish","winCount":0,"defeatCount":1},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":0},{"id":18,"name":"Mayans","winCount":2,"defeatCount":2},{"id":19,"name":"Huns","winCount":0,"defeatCount":0},{"id":20,"name":"Koreans","winCount":0,"defeatCount":0},{"id":21,"name":"Italians","winCount":0,"defeatCount":1},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":0},{"id":23,"name":"Incas","winCount":0,"defeatCount":0},{"id":24,"name":"Magyar","winCount":0,"defeatCount":0},{"id":25,"name":"Slavs","winCount":0,"defeatCount":1},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":0},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":1},{"id":28,"name":"Malians","winCount":0,"defeatCount":0},{"id":29,"name":"Berbers","winCount":0,"defeatCount":0},{"id":30,"name":"Khmer","winCount":0,"defeatCount":0},{"id":31,"name":"Malay","winCount":0,"defeatCount":0},{"id":32,"name":"Burmese","winCount":0,"defeatCount":0},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":0},{"id":34,"name":"Bulgarians","winCount":0,"defeatCount":1},{"id":35,"name":"Tatars","winCount":2,"defeatCount":0},{"id":36,"name":"Cumans","winCount":0,"defeatCount":0},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":0},{"id":38,"name":"Random","winCount":5,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":0},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":0},{"id":184,"name":"Poles","winCount":0,"defeatCount":0},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":0},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":0},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":0},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":11108,"highScoreMilitary":3416,"highScoreEconomy":3304,"highScoreTechnology":4691,"unitsKilled":583,"unitsLost":695,"buildingsRaised":224,"buildingsLost":87,"wondersBuilt":0,"castlesBuilt":29,"trebsBuilt":17,"farmsBuilt":583},"user":{"userId":"","profileId":19882187,"userName":"[OmG] Bang Gere","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/a13d77e78e012de06ebb1be3b0233d8d5769cebb_full.jpg","elo":null,"playerStanding":0,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	4	2	0	3	48.5	\N
29	putih	2749860	70	2023-02-10 01:33:33	2024-11-27 14:59:03	1	https://avatars.steamstatic.com/a9ec163b5174ffa26dc4cf5ec986c18054a71bde_full.jpg	putih	1368	0	1224	{"mpStatList":{"totalMatches":275,"totalWins":158,"currentWinStreak":2},"careerStats":{"totalGames":1911,"totalWins":1041,"civilizations":[{"id":3,"name":"Britons","winCount":46,"defeatCount":118},{"id":4,"name":"Franks","winCount":30,"defeatCount":215},{"id":5,"name":"Goths","winCount":51,"defeatCount":96},{"id":6,"name":"Teutons","winCount":45,"defeatCount":108},{"id":7,"name":"Japanese","winCount":31,"defeatCount":92},{"id":8,"name":"Chinese","winCount":10,"defeatCount":71},{"id":9,"name":"Byzantines","winCount":42,"defeatCount":136},{"id":10,"name":"Persians","winCount":28,"defeatCount":101},{"id":11,"name":"Saracens","winCount":23,"defeatCount":89},{"id":12,"name":"Turks","winCount":18,"defeatCount":103},{"id":13,"name":"Vikings","winCount":25,"defeatCount":54},{"id":14,"name":"Mongols","winCount":32,"defeatCount":144},{"id":15,"name":"Celts","winCount":30,"defeatCount":74},{"id":16,"name":"Spanish","winCount":28,"defeatCount":130},{"id":17,"name":"Aztecs","winCount":23,"defeatCount":66},{"id":18,"name":"Mayans","winCount":38,"defeatCount":98},{"id":19,"name":"Huns","winCount":26,"defeatCount":73},{"id":20,"name":"Koreans","winCount":18,"defeatCount":50},{"id":21,"name":"Italians","winCount":30,"defeatCount":123},{"id":22,"name":"Hindustanis","winCount":30,"defeatCount":92},{"id":23,"name":"Incas","winCount":16,"defeatCount":67},{"id":24,"name":"Magyar","winCount":35,"defeatCount":77},{"id":25,"name":"Slavs","winCount":15,"defeatCount":86},{"id":26,"name":"Portuguese","winCount":49,"defeatCount":73},{"id":27,"name":"Ethiopians","winCount":21,"defeatCount":103},{"id":28,"name":"Malians","winCount":29,"defeatCount":82},{"id":29,"name":"Berbers","winCount":18,"defeatCount":75},{"id":30,"name":"Khmer","winCount":31,"defeatCount":99},{"id":31,"name":"Malay","winCount":34,"defeatCount":80},{"id":32,"name":"Burmese","winCount":33,"defeatCount":67},{"id":33,"name":"Vietnamese","winCount":24,"defeatCount":71},{"id":34,"name":"Bulgarians","winCount":19,"defeatCount":79},{"id":35,"name":"Tatars","winCount":19,"defeatCount":110},{"id":36,"name":"Cumans","winCount":28,"defeatCount":103},{"id":37,"name":"Lithuanians","winCount":30,"defeatCount":95},{"id":38,"name":"Random","winCount":312,"defeatCount":150},{"id":174,"name":"Burgundians","winCount":16,"defeatCount":67},{"id":175,"name":"Sicilians","winCount":28,"defeatCount":45},{"id":184,"name":"Poles","winCount":99,"defeatCount":60},{"id":185,"name":"Bohemians","winCount":28,"defeatCount":53},{"id":195,"name":"Bengalis","winCount":24,"defeatCount":16},{"id":196,"name":"Dravidians","winCount":55,"defeatCount":36},{"id":197,"name":"Gurjaras","winCount":70,"defeatCount":37},{"id":202,"name":"Romans","winCount":7,"defeatCount":10},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":2},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":2},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":1,"defeatCount":4},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":2},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":2,"defeatCount":5},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":2,"defeatCount":10},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":63712,"highScoreMilitary":48128,"highScoreEconomy":40150,"highScoreTechnology":7559,"unitsKilled":423373,"unitsLost":297851,"buildingsRaised":39193,"buildingsLost":25434,"wondersBuilt":15,"castlesBuilt":4089,"trebsBuilt":3336,"farmsBuilt":102598},"user":{"userId":"","profileId":2749860,"userName":"putih","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/a9ec163b5174ffa26dc4cf5ec986c18054a71bde_full.jpg","elo":1285,"playerStanding":0.16,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	29	-2	10	7	71.5	\N
9	Nep	9454038	100	2023-02-10 01:33:33	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/38150e1c6e62286299790033b4fcf37d18da1725_full.jpg	LowElo_Nep	1431	0	0	{"mpStatList":{"totalMatches":842,"totalWins":458,"currentWinStreak":7},"careerStats":{"totalGames":2807,"totalWins":1483,"civilizations":[{"id":3,"name":"Britons","winCount":49,"defeatCount":206},{"id":4,"name":"Franks","winCount":59,"defeatCount":263},{"id":5,"name":"Goths","winCount":35,"defeatCount":165},{"id":6,"name":"Teutons","winCount":22,"defeatCount":151},{"id":7,"name":"Japanese","winCount":26,"defeatCount":97},{"id":8,"name":"Chinese","winCount":20,"defeatCount":120},{"id":9,"name":"Byzantines","winCount":18,"defeatCount":127},{"id":10,"name":"Persians","winCount":33,"defeatCount":185},{"id":11,"name":"Saracens","winCount":22,"defeatCount":130},{"id":12,"name":"Turks","winCount":31,"defeatCount":173},{"id":13,"name":"Vikings","winCount":35,"defeatCount":133},{"id":14,"name":"Mongols","winCount":239,"defeatCount":210},{"id":15,"name":"Celts","winCount":26,"defeatCount":136},{"id":16,"name":"Spanish","winCount":74,"defeatCount":216},{"id":17,"name":"Aztecs","winCount":27,"defeatCount":106},{"id":18,"name":"Mayans","winCount":98,"defeatCount":135},{"id":19,"name":"Huns","winCount":22,"defeatCount":144},{"id":20,"name":"Koreans","winCount":29,"defeatCount":126},{"id":21,"name":"Italians","winCount":27,"defeatCount":146},{"id":22,"name":"Hindustanis","winCount":60,"defeatCount":164},{"id":23,"name":"Incas","winCount":19,"defeatCount":92},{"id":24,"name":"Magyar","winCount":33,"defeatCount":147},{"id":25,"name":"Slavs","winCount":18,"defeatCount":98},{"id":26,"name":"Portuguese","winCount":34,"defeatCount":155},{"id":27,"name":"Ethiopians","winCount":24,"defeatCount":152},{"id":28,"name":"Malians","winCount":19,"defeatCount":123},{"id":29,"name":"Berbers","winCount":33,"defeatCount":110},{"id":30,"name":"Khmer","winCount":18,"defeatCount":153},{"id":31,"name":"Malay","winCount":26,"defeatCount":111},{"id":32,"name":"Burmese","winCount":15,"defeatCount":95},{"id":33,"name":"Vietnamese","winCount":24,"defeatCount":146},{"id":34,"name":"Bulgarians","winCount":26,"defeatCount":104},{"id":35,"name":"Tatars","winCount":35,"defeatCount":118},{"id":36,"name":"Cumans","winCount":25,"defeatCount":142},{"id":37,"name":"Lithuanians","winCount":27,"defeatCount":137},{"id":38,"name":"Random","winCount":747,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":43,"defeatCount":106},{"id":175,"name":"Sicilians","winCount":22,"defeatCount":89},{"id":184,"name":"Poles","winCount":31,"defeatCount":109},{"id":185,"name":"Bohemians","winCount":37,"defeatCount":132},{"id":195,"name":"Bengalis","winCount":36,"defeatCount":45},{"id":196,"name":"Dravidians","winCount":85,"defeatCount":66},{"id":197,"name":"Gurjaras","winCount":60,"defeatCount":49},{"id":202,"name":"Romans","winCount":3,"defeatCount":13},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":65515,"highScoreMilitary":56326,"highScoreEconomy":14700,"highScoreTechnology":8639,"unitsKilled":526699,"unitsLost":417312,"buildingsRaised":47080,"buildingsLost":37548,"wondersBuilt":14,"castlesBuilt":6213,"trebsBuilt":4387,"farmsBuilt":155217},"user":{"userId":"","profileId":9454038,"userName":"LowElo_Nep","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/38150e1c6e62286299790033b4fcf37d18da1725_full.jpg","elo":1624,"playerStanding":0.01,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	88	4	10	7	96.5	\N
18170632	Behind You	10140054	85	2024-05-27 02:19:44	2024-11-27 14:56:52	1	https://avatars.steamstatic.com/4872c996f5d757162f13e3f399f3df75b64011d5_full.jpg	Behind You	1263	0	1342	{"mpStatList":{"totalMatches":1338,"totalWins":672,"currentWinStreak":8},"careerStats":{"totalGames":1756,"totalWins":908,"civilizations":[{"id":3,"name":"Britons","winCount":1,"defeatCount":146},{"id":4,"name":"Franks","winCount":9,"defeatCount":221},{"id":5,"name":"Goths","winCount":9,"defeatCount":94},{"id":6,"name":"Teutons","winCount":7,"defeatCount":117},{"id":7,"name":"Japanese","winCount":2,"defeatCount":36},{"id":8,"name":"Chinese","winCount":22,"defeatCount":58},{"id":9,"name":"Byzantines","winCount":5,"defeatCount":94},{"id":10,"name":"Persians","winCount":3,"defeatCount":141},{"id":11,"name":"Saracens","winCount":405,"defeatCount":76},{"id":12,"name":"Turks","winCount":340,"defeatCount":97},{"id":13,"name":"Vikings","winCount":0,"defeatCount":48},{"id":14,"name":"Mongols","winCount":24,"defeatCount":205},{"id":15,"name":"Celts","winCount":10,"defeatCount":66},{"id":16,"name":"Spanish","winCount":1,"defeatCount":141},{"id":17,"name":"Aztecs","winCount":9,"defeatCount":44},{"id":18,"name":"Mayans","winCount":6,"defeatCount":73},{"id":19,"name":"Huns","winCount":12,"defeatCount":83},{"id":20,"name":"Koreans","winCount":3,"defeatCount":65},{"id":21,"name":"Italians","winCount":0,"defeatCount":84},{"id":22,"name":"Hindustanis","winCount":18,"defeatCount":87},{"id":23,"name":"Incas","winCount":0,"defeatCount":38},{"id":24,"name":"Magyar","winCount":1,"defeatCount":78},{"id":25,"name":"Slavs","winCount":2,"defeatCount":59},{"id":26,"name":"Portuguese","winCount":1,"defeatCount":100},{"id":27,"name":"Ethiopians","winCount":2,"defeatCount":84},{"id":28,"name":"Malians","winCount":2,"defeatCount":45},{"id":29,"name":"Berbers","winCount":55,"defeatCount":54},{"id":30,"name":"Khmer","winCount":1,"defeatCount":98},{"id":31,"name":"Malay","winCount":42,"defeatCount":60},{"id":32,"name":"Burmese","winCount":2,"defeatCount":24},{"id":33,"name":"Vietnamese","winCount":3,"defeatCount":73},{"id":34,"name":"Bulgarians","winCount":4,"defeatCount":35},{"id":35,"name":"Tatars","winCount":149,"defeatCount":57},{"id":36,"name":"Cumans","winCount":6,"defeatCount":83},{"id":37,"name":"Lithuanians","winCount":2,"defeatCount":101},{"id":38,"name":"Random","winCount":48,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":58},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":29},{"id":184,"name":"Poles","winCount":3,"defeatCount":94},{"id":185,"name":"Bohemians","winCount":2,"defeatCount":67},{"id":195,"name":"Bengalis","winCount":1,"defeatCount":22},{"id":196,"name":"Dravidians","winCount":5,"defeatCount":41},{"id":197,"name":"Gurjaras","winCount":6,"defeatCount":43},{"id":202,"name":"Romans","winCount":0,"defeatCount":29},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":48709,"highScoreMilitary":38332,"highScoreEconomy":10766,"highScoreTechnology":6262,"unitsKilled":268297,"unitsLost":197221,"buildingsRaised":27484,"buildingsLost":16319,"wondersBuilt":6,"castlesBuilt":2646,"trebsBuilt":2329,"farmsBuilt":93803},"user":{"userId":"","profileId":10140054,"userName":"Behind You","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/4872c996f5d757162f13e3f399f3df75b64011d5_full.jpg","elo":1326,"playerStanding":0.13,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	1	-5	1	3	84	\N
12448397	xvier	18411382	40	\N	2024-11-27 14:59:12	1	https://avatars.steamstatic.com/0d24c9df22712adb059bce5e022fafd587ead14b_full.jpg	xvier	1270	0	845	{"mpStatList":{"totalMatches":48,"totalWins":20,"currentWinStreak":2},"careerStats":{"totalGames":631,"totalWins":281,"civilizations":[{"id":3,"name":"Britons","winCount":14,"defeatCount":42},{"id":4,"name":"Franks","winCount":9,"defeatCount":64},{"id":5,"name":"Goths","winCount":8,"defeatCount":32},{"id":6,"name":"Teutons","winCount":15,"defeatCount":37},{"id":7,"name":"Japanese","winCount":6,"defeatCount":16},{"id":8,"name":"Chinese","winCount":9,"defeatCount":13},{"id":9,"name":"Byzantines","winCount":9,"defeatCount":25},{"id":10,"name":"Persians","winCount":10,"defeatCount":46},{"id":11,"name":"Saracens","winCount":8,"defeatCount":7},{"id":12,"name":"Turks","winCount":12,"defeatCount":30},{"id":13,"name":"Vikings","winCount":7,"defeatCount":14},{"id":14,"name":"Mongols","winCount":11,"defeatCount":37},{"id":15,"name":"Celts","winCount":7,"defeatCount":17},{"id":16,"name":"Spanish","winCount":12,"defeatCount":36},{"id":17,"name":"Aztecs","winCount":12,"defeatCount":3},{"id":18,"name":"Mayans","winCount":1,"defeatCount":14},{"id":19,"name":"Huns","winCount":12,"defeatCount":42},{"id":20,"name":"Koreans","winCount":13,"defeatCount":15},{"id":21,"name":"Italians","winCount":9,"defeatCount":13},{"id":22,"name":"Hindustanis","winCount":9,"defeatCount":19},{"id":23,"name":"Incas","winCount":2,"defeatCount":12},{"id":24,"name":"Magyar","winCount":10,"defeatCount":20},{"id":25,"name":"Slavs","winCount":8,"defeatCount":20},{"id":26,"name":"Portuguese","winCount":7,"defeatCount":31},{"id":27,"name":"Ethiopians","winCount":9,"defeatCount":8},{"id":28,"name":"Malians","winCount":4,"defeatCount":10},{"id":29,"name":"Berbers","winCount":7,"defeatCount":4},{"id":30,"name":"Khmer","winCount":15,"defeatCount":62},{"id":31,"name":"Malay","winCount":7,"defeatCount":20},{"id":32,"name":"Burmese","winCount":3,"defeatCount":13},{"id":33,"name":"Vietnamese","winCount":7,"defeatCount":18},{"id":34,"name":"Bulgarians","winCount":5,"defeatCount":16},{"id":35,"name":"Tatars","winCount":8,"defeatCount":9},{"id":36,"name":"Cumans","winCount":10,"defeatCount":15},{"id":37,"name":"Lithuanians","winCount":7,"defeatCount":21},{"id":38,"name":"Random","winCount":182,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":3,"defeatCount":10},{"id":175,"name":"Sicilians","winCount":12,"defeatCount":8},{"id":184,"name":"Poles","winCount":8,"defeatCount":8},{"id":185,"name":"Bohemians","winCount":23,"defeatCount":22},{"id":195,"name":"Bengalis","winCount":3,"defeatCount":5},{"id":196,"name":"Dravidians","winCount":12,"defeatCount":4},{"id":197,"name":"Gurjaras","winCount":3,"defeatCount":8},{"id":202,"name":"Romans","winCount":11,"defeatCount":17},{"id":204,"name":"Pompeii_Assyrian","winCount":3,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":3},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":3,"defeatCount":5},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":56166,"highScoreMilitary":48567,"highScoreEconomy":26464,"highScoreTechnology":8264,"unitsKilled":78982,"unitsLost":70644,"buildingsRaised":11801,"buildingsLost":3891,"wondersBuilt":5,"castlesBuilt":1307,"trebsBuilt":801,"farmsBuilt":12156},"user":{"userId":"","profileId":18411382,"userName":"xvier","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/0d24c9df22712adb059bce5e022fafd587ead14b_full.jpg","elo":775,"playerStanding":0.88,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	5	5	0	0	40	\N
18170647	Matahachiro	17846155	45	2024-10-21 05:24:31	2024-11-27 14:57:01	1	https://avatars.steamstatic.com/2c660519b6ec95609c95d779c86e7ba3d5ea7f34_full.jpg	[Vesper] Matahachiro	0	0	893	{"mpStatList":{"totalMatches":282,"totalWins":119,"currentWinStreak":4},"careerStats":{"totalGames":416,"totalWins":187,"civilizations":[{"id":3,"name":"Britons","winCount":0,"defeatCount":46},{"id":4,"name":"Franks","winCount":0,"defeatCount":39},{"id":5,"name":"Goths","winCount":6,"defeatCount":19},{"id":6,"name":"Teutons","winCount":0,"defeatCount":39},{"id":7,"name":"Japanese","winCount":176,"defeatCount":19},{"id":8,"name":"Chinese","winCount":0,"defeatCount":22},{"id":9,"name":"Byzantines","winCount":0,"defeatCount":23},{"id":10,"name":"Persians","winCount":8,"defeatCount":41},{"id":11,"name":"Saracens","winCount":0,"defeatCount":12},{"id":12,"name":"Turks","winCount":25,"defeatCount":37},{"id":13,"name":"Vikings","winCount":0,"defeatCount":9},{"id":14,"name":"Mongols","winCount":2,"defeatCount":29},{"id":15,"name":"Celts","winCount":0,"defeatCount":23},{"id":16,"name":"Spanish","winCount":2,"defeatCount":34},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":11},{"id":18,"name":"Mayans","winCount":0,"defeatCount":15},{"id":19,"name":"Huns","winCount":0,"defeatCount":25},{"id":20,"name":"Koreans","winCount":0,"defeatCount":8},{"id":21,"name":"Italians","winCount":0,"defeatCount":24},{"id":22,"name":"Hindustanis","winCount":0,"defeatCount":18},{"id":23,"name":"Incas","winCount":0,"defeatCount":13},{"id":24,"name":"Magyar","winCount":0,"defeatCount":22},{"id":25,"name":"Slavs","winCount":0,"defeatCount":20},{"id":26,"name":"Portuguese","winCount":0,"defeatCount":29},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":14},{"id":28,"name":"Malians","winCount":0,"defeatCount":9},{"id":29,"name":"Berbers","winCount":0,"defeatCount":7},{"id":30,"name":"Khmer","winCount":5,"defeatCount":47},{"id":31,"name":"Malay","winCount":0,"defeatCount":12},{"id":32,"name":"Burmese","winCount":0,"defeatCount":10},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":14},{"id":34,"name":"Bulgarians","winCount":0,"defeatCount":11},{"id":35,"name":"Tatars","winCount":0,"defeatCount":15},{"id":36,"name":"Cumans","winCount":0,"defeatCount":12},{"id":37,"name":"Lithuanians","winCount":0,"defeatCount":26},{"id":38,"name":"Random","winCount":0,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":13},{"id":175,"name":"Sicilians","winCount":0,"defeatCount":7},{"id":184,"name":"Poles","winCount":0,"defeatCount":9},{"id":185,"name":"Bohemians","winCount":0,"defeatCount":18},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":3},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":4},{"id":197,"name":"Gurjaras","winCount":0,"defeatCount":3},{"id":202,"name":"Romans","winCount":0,"defeatCount":21},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":64511,"highScoreMilitary":34758,"highScoreEconomy":21442,"highScoreTechnology":8741,"unitsKilled":81017,"unitsLost":90405,"buildingsRaised":11683,"buildingsLost":10653,"wondersBuilt":0,"castlesBuilt":1205,"trebsBuilt":741,"farmsBuilt":9205},"user":{"userId":"","profileId":17846155,"userName":"[Vesper] Matahachiro","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/2c660519b6ec95609c95d779c86e7ba3d5ea7f34_full.jpg","elo":777,"playerStanding":0.88,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-1	0	0	0	\N
18170650	Shira	9583069	100	2024-10-25 23:48:33	2024-11-27 14:59:18	1	https://avatars.steamstatic.com/af015ec182d88d085be66275ff531492306f5f14_full.jpg	LowElo_PANITIA OSPEK	1416	0	0	{"mpStatList":{"totalMatches":282,"totalWins":182,"currentWinStreak":0},"careerStats":{"totalGames":1657,"totalWins":940,"civilizations":[{"id":3,"name":"Britons","winCount":20,"defeatCount":111},{"id":4,"name":"Franks","winCount":19,"defeatCount":144},{"id":5,"name":"Goths","winCount":14,"defeatCount":82},{"id":6,"name":"Teutons","winCount":15,"defeatCount":104},{"id":7,"name":"Japanese","winCount":41,"defeatCount":73},{"id":8,"name":"Chinese","winCount":17,"defeatCount":94},{"id":9,"name":"Byzantines","winCount":21,"defeatCount":91},{"id":10,"name":"Persians","winCount":47,"defeatCount":125},{"id":11,"name":"Saracens","winCount":13,"defeatCount":94},{"id":12,"name":"Turks","winCount":23,"defeatCount":84},{"id":13,"name":"Vikings","winCount":17,"defeatCount":98},{"id":14,"name":"Mongols","winCount":60,"defeatCount":108},{"id":15,"name":"Celts","winCount":19,"defeatCount":102},{"id":16,"name":"Spanish","winCount":54,"defeatCount":147},{"id":17,"name":"Aztecs","winCount":31,"defeatCount":68},{"id":18,"name":"Mayans","winCount":39,"defeatCount":74},{"id":19,"name":"Huns","winCount":18,"defeatCount":81},{"id":20,"name":"Koreans","winCount":24,"defeatCount":82},{"id":21,"name":"Italians","winCount":26,"defeatCount":109},{"id":22,"name":"Hindustanis","winCount":31,"defeatCount":107},{"id":23,"name":"Incas","winCount":20,"defeatCount":79},{"id":24,"name":"Magyar","winCount":18,"defeatCount":77},{"id":25,"name":"Slavs","winCount":14,"defeatCount":87},{"id":26,"name":"Portuguese","winCount":33,"defeatCount":99},{"id":27,"name":"Ethiopians","winCount":30,"defeatCount":122},{"id":28,"name":"Malians","winCount":22,"defeatCount":86},{"id":29,"name":"Berbers","winCount":23,"defeatCount":90},{"id":30,"name":"Khmer","winCount":29,"defeatCount":87},{"id":31,"name":"Malay","winCount":22,"defeatCount":93},{"id":32,"name":"Burmese","winCount":22,"defeatCount":74},{"id":33,"name":"Vietnamese","winCount":36,"defeatCount":102},{"id":34,"name":"Bulgarians","winCount":20,"defeatCount":73},{"id":35,"name":"Tatars","winCount":43,"defeatCount":98},{"id":36,"name":"Cumans","winCount":20,"defeatCount":94},{"id":37,"name":"Lithuanians","winCount":35,"defeatCount":100},{"id":38,"name":"Random","winCount":614,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":18,"defeatCount":52},{"id":175,"name":"Sicilians","winCount":20,"defeatCount":67},{"id":184,"name":"Poles","winCount":18,"defeatCount":67},{"id":185,"name":"Bohemians","winCount":19,"defeatCount":71},{"id":195,"name":"Bengalis","winCount":24,"defeatCount":16},{"id":196,"name":"Dravidians","winCount":34,"defeatCount":34},{"id":197,"name":"Gurjaras","winCount":32,"defeatCount":21},{"id":202,"name":"Romans","winCount":0,"defeatCount":0},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":51191,"highScoreMilitary":41738,"highScoreEconomy":40298,"highScoreTechnology":8563,"unitsKilled":397749,"unitsLost":287273,"buildingsRaised":43514,"buildingsLost":16155,"wondersBuilt":9,"castlesBuilt":4518,"trebsBuilt":2680,"farmsBuilt":128625},"user":{"userId":"","profileId":9583069,"userName":"LowElo_PANITIA OSPEK","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/af015ec182d88d085be66275ff531492306f5f14_full.jpg","elo":1481,"playerStanding":0.04,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	46	-1	0	0	0	\N
12	-[ V G B ]-	3319777	80	2023-02-10 01:33:33	2024-11-27 14:57:13	1	https://avatars.steamstatic.com/410c7a72a99bd80df3bf66940aaaaecac8ae76b1_full.jpg	-[ V G B ]- Cupu	1392	0	1262	{"mpStatList":{"totalMatches":159,"totalWins":90,"currentWinStreak":3},"careerStats":{"totalGames":2121,"totalWins":1076,"civilizations":[{"id":3,"name":"Britons","winCount":31,"defeatCount":118},{"id":4,"name":"Franks","winCount":48,"defeatCount":122},{"id":5,"name":"Goths","winCount":40,"defeatCount":105},{"id":6,"name":"Teutons","winCount":29,"defeatCount":85},{"id":7,"name":"Japanese","winCount":45,"defeatCount":103},{"id":8,"name":"Chinese","winCount":26,"defeatCount":105},{"id":9,"name":"Byzantines","winCount":15,"defeatCount":125},{"id":10,"name":"Persians","winCount":22,"defeatCount":124},{"id":11,"name":"Saracens","winCount":28,"defeatCount":102},{"id":12,"name":"Turks","winCount":30,"defeatCount":101},{"id":13,"name":"Vikings","winCount":33,"defeatCount":95},{"id":14,"name":"Mongols","winCount":21,"defeatCount":130},{"id":15,"name":"Celts","winCount":27,"defeatCount":97},{"id":16,"name":"Spanish","winCount":26,"defeatCount":86},{"id":17,"name":"Aztecs","winCount":23,"defeatCount":101},{"id":18,"name":"Mayans","winCount":28,"defeatCount":100},{"id":19,"name":"Huns","winCount":42,"defeatCount":102},{"id":20,"name":"Koreans","winCount":26,"defeatCount":79},{"id":21,"name":"Italians","winCount":29,"defeatCount":92},{"id":22,"name":"Hindustanis","winCount":31,"defeatCount":103},{"id":23,"name":"Incas","winCount":32,"defeatCount":104},{"id":24,"name":"Magyar","winCount":18,"defeatCount":116},{"id":25,"name":"Slavs","winCount":26,"defeatCount":95},{"id":26,"name":"Portuguese","winCount":24,"defeatCount":103},{"id":27,"name":"Ethiopians","winCount":23,"defeatCount":108},{"id":28,"name":"Malians","winCount":38,"defeatCount":92},{"id":29,"name":"Berbers","winCount":18,"defeatCount":100},{"id":30,"name":"Khmer","winCount":37,"defeatCount":101},{"id":31,"name":"Malay","winCount":33,"defeatCount":107},{"id":32,"name":"Burmese","winCount":26,"defeatCount":111},{"id":33,"name":"Vietnamese","winCount":32,"defeatCount":109},{"id":34,"name":"Bulgarians","winCount":32,"defeatCount":87},{"id":35,"name":"Tatars","winCount":16,"defeatCount":104},{"id":36,"name":"Cumans","winCount":38,"defeatCount":91},{"id":37,"name":"Lithuanians","winCount":26,"defeatCount":116},{"id":38,"name":"Random","winCount":855,"defeatCount":1271},{"id":174,"name":"Burgundians","winCount":22,"defeatCount":64},{"id":175,"name":"Sicilians","winCount":12,"defeatCount":60},{"id":184,"name":"Poles","winCount":15,"defeatCount":53},{"id":185,"name":"Bohemians","winCount":11,"defeatCount":35},{"id":195,"name":"Bengalis","winCount":7,"defeatCount":29},{"id":196,"name":"Dravidians","winCount":17,"defeatCount":38},{"id":197,"name":"Gurjaras","winCount":18,"defeatCount":26},{"id":202,"name":"Romans","winCount":0,"defeatCount":6},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":61368,"highScoreMilitary":46842,"highScoreEconomy":18266,"highScoreTechnology":6440,"unitsKilled":425965,"unitsLost":411551,"buildingsRaised":54632,"buildingsLost":43870,"wondersBuilt":0,"castlesBuilt":4386,"trebsBuilt":3955,"farmsBuilt":207269},"user":{"userId":"","profileId":3319777,"userName":"-[ V G B ]- Cupu","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/410c7a72a99bd80df3bf66940aaaaecac8ae76b1_full.jpg","elo":1290,"playerStanding":0.16,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	69	3	10	7	76.5	\N
18170636	flare	2758897	75	2024-08-24 16:11:01	2024-11-27 14:59:23	1	https://avatars.steamstatic.com/15eea420a2a9525636470f10bcb603fcf8dc4384_full.jpg	[xbow] Flare	1375	0	1383	{"mpStatList":{"totalMatches":981,"totalWins":488,"currentWinStreak":0},"careerStats":{"totalGames":1721,"totalWins":804,"civilizations":[{"id":3,"name":"Britons","winCount":78,"defeatCount":97},{"id":4,"name":"Franks","winCount":15,"defeatCount":148},{"id":5,"name":"Goths","winCount":11,"defeatCount":84},{"id":6,"name":"Teutons","winCount":39,"defeatCount":106},{"id":7,"name":"Japanese","winCount":10,"defeatCount":80},{"id":8,"name":"Chinese","winCount":6,"defeatCount":47},{"id":9,"name":"Byzantines","winCount":44,"defeatCount":79},{"id":10,"name":"Persians","winCount":13,"defeatCount":157},{"id":11,"name":"Saracens","winCount":14,"defeatCount":63},{"id":12,"name":"Turks","winCount":43,"defeatCount":90},{"id":13,"name":"Vikings","winCount":11,"defeatCount":47},{"id":14,"name":"Mongols","winCount":33,"defeatCount":149},{"id":15,"name":"Celts","winCount":8,"defeatCount":64},{"id":16,"name":"Spanish","winCount":92,"defeatCount":126},{"id":17,"name":"Aztecs","winCount":9,"defeatCount":45},{"id":18,"name":"Mayans","winCount":36,"defeatCount":63},{"id":19,"name":"Huns","winCount":14,"defeatCount":100},{"id":20,"name":"Koreans","winCount":39,"defeatCount":63},{"id":21,"name":"Italians","winCount":70,"defeatCount":90},{"id":22,"name":"Hindustanis","winCount":36,"defeatCount":75},{"id":23,"name":"Incas","winCount":9,"defeatCount":41},{"id":24,"name":"Magyar","winCount":32,"defeatCount":67},{"id":25,"name":"Slavs","winCount":14,"defeatCount":83},{"id":26,"name":"Portuguese","winCount":19,"defeatCount":65},{"id":27,"name":"Ethiopians","winCount":11,"defeatCount":79},{"id":28,"name":"Malians","winCount":0,"defeatCount":43},{"id":29,"name":"Berbers","winCount":6,"defeatCount":51},{"id":30,"name":"Khmer","winCount":24,"defeatCount":114},{"id":31,"name":"Malay","winCount":17,"defeatCount":47},{"id":32,"name":"Burmese","winCount":4,"defeatCount":49},{"id":33,"name":"Vietnamese","winCount":42,"defeatCount":71},{"id":34,"name":"Bulgarians","winCount":11,"defeatCount":39},{"id":35,"name":"Tatars","winCount":35,"defeatCount":42},{"id":36,"name":"Cumans","winCount":46,"defeatCount":62},{"id":37,"name":"Lithuanians","winCount":17,"defeatCount":59},{"id":38,"name":"Random","winCount":177,"defeatCount":14},{"id":174,"name":"Burgundians","winCount":33,"defeatCount":57},{"id":175,"name":"Sicilians","winCount":8,"defeatCount":31},{"id":184,"name":"Poles","winCount":28,"defeatCount":51},{"id":185,"name":"Bohemians","winCount":116,"defeatCount":86},{"id":195,"name":"Bengalis","winCount":8,"defeatCount":31},{"id":196,"name":"Dravidians","winCount":9,"defeatCount":41},{"id":197,"name":"Gurjaras","winCount":6,"defeatCount":40},{"id":202,"name":"Romans","winCount":0,"defeatCount":42},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":61468,"highScoreMilitary":62480,"highScoreEconomy":36918,"highScoreTechnology":5800,"unitsKilled":244442,"unitsLost":225418,"buildingsRaised":20099,"buildingsLost":21998,"wondersBuilt":0,"castlesBuilt":3053,"trebsBuilt":676,"farmsBuilt":36839},"user":{"userId":"","profileId":2758897,"userName":"[xbow] Flare","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/15eea420a2a9525636470f10bcb603fcf8dc4384_full.jpg","elo":1245,"playerStanding":0.2,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	17	-1	0	0	0	\N
18170649	Perpendicular	19636187	50	2024-10-23 05:20:03	2024-11-27 14:59:30	1	https://avatars.steamstatic.com/c96f8a03e5b98d601eb6c62f79eed3b7878eaa0f_full.jpg	[Vesper] Perpendicular	0	947	921	{"mpStatList":{"totalMatches":35,"totalWins":14,"currentWinStreak":0},"careerStats":{"totalGames":54,"totalWins":28,"civilizations":[{"id":3,"name":"Britons","winCount":2,"defeatCount":5},{"id":4,"name":"Franks","winCount":2,"defeatCount":5},{"id":5,"name":"Goths","winCount":0,"defeatCount":4},{"id":6,"name":"Teutons","winCount":0,"defeatCount":2},{"id":7,"name":"Japanese","winCount":0,"defeatCount":4},{"id":8,"name":"Chinese","winCount":0,"defeatCount":3},{"id":9,"name":"Byzantines","winCount":0,"defeatCount":0},{"id":10,"name":"Persians","winCount":0,"defeatCount":5},{"id":11,"name":"Saracens","winCount":0,"defeatCount":1},{"id":12,"name":"Turks","winCount":0,"defeatCount":9},{"id":13,"name":"Vikings","winCount":0,"defeatCount":0},{"id":14,"name":"Mongols","winCount":0,"defeatCount":3},{"id":15,"name":"Celts","winCount":0,"defeatCount":0},{"id":16,"name":"Spanish","winCount":3,"defeatCount":4},{"id":17,"name":"Aztecs","winCount":0,"defeatCount":0},{"id":18,"name":"Mayans","winCount":2,"defeatCount":2},{"id":19,"name":"Huns","winCount":0,"defeatCount":3},{"id":20,"name":"Koreans","winCount":0,"defeatCount":4},{"id":21,"name":"Italians","winCount":0,"defeatCount":0},{"id":22,"name":"Hindustanis","winCount":3,"defeatCount":3},{"id":23,"name":"Incas","winCount":0,"defeatCount":2},{"id":24,"name":"Magyar","winCount":0,"defeatCount":1},{"id":25,"name":"Slavs","winCount":2,"defeatCount":0},{"id":26,"name":"Portuguese","winCount":2,"defeatCount":3},{"id":27,"name":"Ethiopians","winCount":0,"defeatCount":3},{"id":28,"name":"Malians","winCount":2,"defeatCount":0},{"id":29,"name":"Berbers","winCount":0,"defeatCount":2},{"id":30,"name":"Khmer","winCount":2,"defeatCount":5},{"id":31,"name":"Malay","winCount":0,"defeatCount":1},{"id":32,"name":"Burmese","winCount":0,"defeatCount":3},{"id":33,"name":"Vietnamese","winCount":0,"defeatCount":3},{"id":34,"name":"Bulgarians","winCount":0,"defeatCount":1},{"id":35,"name":"Tatars","winCount":0,"defeatCount":2},{"id":36,"name":"Cumans","winCount":0,"defeatCount":1},{"id":37,"name":"Lithuanians","winCount":5,"defeatCount":2},{"id":38,"name":"Random","winCount":3,"defeatCount":0},{"id":174,"name":"Burgundians","winCount":0,"defeatCount":1},{"id":175,"name":"Sicilians","winCount":2,"defeatCount":0},{"id":184,"name":"Poles","winCount":0,"defeatCount":2},{"id":185,"name":"Bohemians","winCount":6,"defeatCount":5},{"id":195,"name":"Bengalis","winCount":0,"defeatCount":0},{"id":196,"name":"Dravidians","winCount":0,"defeatCount":1},{"id":197,"name":"Gurjaras","winCount":4,"defeatCount":0},{"id":202,"name":"Romans","winCount":5,"defeatCount":1},{"id":204,"name":"Pompeii_Assyrian","winCount":0,"defeatCount":0},{"id":206,"name":"Pompeii_Babylonian","winCount":0,"defeatCount":0},{"id":208,"name":"Pompeii_Carthaginian","winCount":0,"defeatCount":0},{"id":210,"name":"Pompeii_Choson","winCount":0,"defeatCount":0},{"id":212,"name":"Pompeii_Egyptian","winCount":0,"defeatCount":0},{"id":214,"name":"Pompeii_Greek","winCount":0,"defeatCount":0},{"id":216,"name":"Pompeii_Hittite","winCount":0,"defeatCount":0},{"id":218,"name":"Pompeii_Macedonian","winCount":0,"defeatCount":0},{"id":220,"name":"Pompeii_Minoan","winCount":0,"defeatCount":0},{"id":222,"name":"Pompeii_Palmyran","winCount":0,"defeatCount":0},{"id":224,"name":"Pompeii_Persian","winCount":0,"defeatCount":0},{"id":226,"name":"Pompeii_Phoenician","winCount":0,"defeatCount":0},{"id":228,"name":"Pompeii_Roman","winCount":0,"defeatCount":0},{"id":230,"name":"Pompeii_Shang","winCount":0,"defeatCount":0},{"id":232,"name":"Pompeii_Sumerian","winCount":0,"defeatCount":0},{"id":234,"name":"Pompeii_Yamato","winCount":0,"defeatCount":0},{"id":236,"name":"Pompeii_Viet","winCount":0,"defeatCount":0}],"highScoreTotal":34321,"highScoreMilitary":17547,"highScoreEconomy":11805,"highScoreTechnology":7134,"unitsKilled":6058,"unitsLost":4232,"buildingsRaised":798,"buildingsLost":357,"wondersBuilt":0,"castlesBuilt":115,"trebsBuilt":111,"farmsBuilt":1017},"user":{"userId":"","profileId":19636187,"userName":"[Vesper] Perpendicular","avatarUrl":"https:\\/\\/avatars.steamstatic.com\\/c96f8a03e5b98d601eb6c62f79eed3b7878eaa0f_full.jpg","elo":830,"playerStanding":0.82,"isHuman":false,"team":0,"civName":null,"winLoss":null,"matchReplayAvailable":false},"mpMatches":{"matchList":[],"totalMatches":0},"statusCode":0,"errorMessage":null}	0	-2	0	0	0	\N
\.


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources (id, name, image, deleted_at, created_at, updated_at) FROM stdin;
1	Meat	images/resources/01JDMMZP792YFSJSPPB6WM5VW2.png	\N	2024-11-26 16:31:00	2024-11-26 16:31:00
2	Wood	images/resources/01JDP0DW5SV3AXPQMV118DEANP.png	\N	2024-11-27 05:10:14	2024-11-27 05:10:14
\.


--
-- Data for Name: sponsors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sponsors (id, name, image, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role) FROM stdin;
2	Tarikh	agustia.tarikh150@gmail.com	\N	$2y$10$wNsH66d9Zx0Gm.4bfFyR5uwNX9PWfL6TPTk9yTpDRZ.1.bGtmGXZ6	\N	2024-05-12 10:50:19	2024-05-19 08:39:39	admin
1	Admin	admin@indoaoe.com	\N	$2y$10$ztPldyHyLlZBQyMHzIAPOueDp/Fdda3.L13GGbuY.zpKHz40NBsgm	lLjYbLt1pe2LLk45LpPjz17eR64pfqu8B6IwNkJasjjxDiH6GVIdjLpGJWO6	2024-05-09 00:27:26	2024-05-19 08:39:39	admin
4	pc@indoaoe.com	pc@indoaoe.com	\N	$2y$10$/rIkwMeTr.ZT5AXKFnbFGedxpHcu8WSi6cnNIj4HL3jNZmuKaI16i	Ns5isfoxq4WobBd8qflbnI0XqC96cqwHrLsoQnlKaQVAJCyMO6UNFSmELsai	2024-05-17 02:34:23	2024-05-19 08:39:39	admin
5	Bli Gung	bligung@indoaoe.com	\N	$2y$10$FwbBje1pdCfVTV1YMpFYSuIKb3Qzeq7iCWeLiv8VUeP7ed7IxrlGC	Vus95h0d63oxnZNfkRWhv1PpD5Hjk3Xsua8lqunBH5nXqnGIhhzCeSH76sjW	2024-05-19 08:50:23	2024-05-19 08:55:14	user
3	Nugraha	mangcoding@gmail.com	\N	$2y$10$vQucu6kA1xKgRwqZCjrRd.nlDpV1./BHvjmCY.9ci9G3CxYs8B60e	mWcWd2VI03Jq5Zpy7uUljXwyyHi66xqSyLkSDB9Muf99rCdXLvCodnUGZ27b	2024-05-15 07:11:33	2024-05-19 08:39:39	admin
\.


--
-- Name: activity_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_logs_id_seq', 5, true);


--
-- Name: ages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ages_id_seq', 3, true);


--
-- Name: build_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.build_orders_id_seq', 5, true);


--
-- Name: category_insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_insights_id_seq', 2, true);


--
-- Name: contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contents_id_seq', 4, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, true);


--
-- Name: game_matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_matches_id_seq', 2757, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 2, true);


--
-- Name: insight_age_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insight_age_resources_id_seq', 2, true);


--
-- Name: insights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insights_id_seq', 1, true);


--
-- Name: match_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_teams_id_seq', 20246, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 1, false);


--
-- Name: resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_id_seq', 2, true);


--
-- Name: sponsors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sponsors_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: activity_logs activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_pkey PRIMARY KEY (id);


--
-- Name: ages ages_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ages
    ADD CONSTRAINT ages_name_unique UNIQUE (name);


--
-- Name: ages ages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ages
    ADD CONSTRAINT ages_pkey PRIMARY KEY (id);


--
-- Name: ages ages_priority_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ages
    ADD CONSTRAINT ages_priority_unique UNIQUE (priority);


--
-- Name: build_orders build_orders_insights_id_age_step_priority_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.build_orders
    ADD CONSTRAINT build_orders_insights_id_age_step_priority_unique UNIQUE (insights_id, age, step, priority);


--
-- Name: build_orders build_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.build_orders
    ADD CONSTRAINT build_orders_pkey PRIMARY KEY (id);


--
-- Name: category_insights category_insights_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_insights
    ADD CONSTRAINT category_insights_name_unique UNIQUE (name);


--
-- Name: category_insights category_insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_insights
    ADD CONSTRAINT category_insights_pkey PRIMARY KEY (id);


--
-- Name: contents contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: game_matches game_matches_match_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_matches
    ADD CONSTRAINT game_matches_match_id_unique UNIQUE (match_id);


--
-- Name: game_matches game_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_matches
    ADD CONSTRAINT game_matches_pkey PRIMARY KEY (id);


--
-- Name: groups groups_page_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_page_name_unique UNIQUE (page, name);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: insight_age_resources insight_age_resources_insights_id_age_resources_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_age_resources
    ADD CONSTRAINT insight_age_resources_insights_id_age_resources_id_unique UNIQUE (insights_id, age, resources_id);


--
-- Name: insight_age_resources insight_age_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_age_resources
    ADD CONSTRAINT insight_age_resources_pkey PRIMARY KEY (id);


--
-- Name: insight_ages insight_ages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_ages
    ADD CONSTRAINT insight_ages_pkey PRIMARY KEY (insights_id, ages_id);


--
-- Name: insight_categories insight_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_categories
    ADD CONSTRAINT insight_categories_pkey PRIMARY KEY (insights_id, category_insights_id);


--
-- Name: insights insights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights
    ADD CONSTRAINT insights_pkey PRIMARY KEY (id);


--
-- Name: insights insights_title_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insights
    ADD CONSTRAINT insights_title_unique UNIQUE (title);


--
-- Name: match_teams match_teams_match_id_aoe2net_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_teams
    ADD CONSTRAINT match_teams_match_id_aoe2net_id_unique UNIQUE (match_id, aoe2net_id);


--
-- Name: match_teams match_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_teams
    ADD CONSTRAINT match_teams_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: resources resources_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_name_unique UNIQUE (name);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: sponsors sponsors_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors
    ADD CONSTRAINT sponsors_name_unique UNIQUE (name);


--
-- Name: sponsors sponsors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sponsors
    ADD CONSTRAINT sponsors_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: activity_logs activity_logs_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_logs
    ADD CONSTRAINT activity_logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: build_orders build_orders_insights_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.build_orders
    ADD CONSTRAINT build_orders_insights_id_foreign FOREIGN KEY (insights_id) REFERENCES public.insights(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contents contents_groups_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT contents_groups_id_foreign FOREIGN KEY (groups_id) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insight_age_resources insight_age_resources_insights_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_age_resources
    ADD CONSTRAINT insight_age_resources_insights_id_foreign FOREIGN KEY (insights_id) REFERENCES public.insights(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insight_age_resources insight_age_resources_resources_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_age_resources
    ADD CONSTRAINT insight_age_resources_resources_id_foreign FOREIGN KEY (resources_id) REFERENCES public.resources(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insight_ages insight_ages_ages_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_ages
    ADD CONSTRAINT insight_ages_ages_id_foreign FOREIGN KEY (ages_id) REFERENCES public.ages(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insight_ages insight_ages_insights_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_ages
    ADD CONSTRAINT insight_ages_insights_id_foreign FOREIGN KEY (insights_id) REFERENCES public.insights(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insight_categories insight_categories_category_insights_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_categories
    ADD CONSTRAINT insight_categories_category_insights_id_foreign FOREIGN KEY (category_insights_id) REFERENCES public.category_insights(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insight_categories insight_categories_insights_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insight_categories
    ADD CONSTRAINT insight_categories_insights_id_foreign FOREIGN KEY (insights_id) REFERENCES public.insights(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

