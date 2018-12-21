--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0 (Debian 11.0-1.pgdg90+2)
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: frontend_weekend; Type: DATABASE; Schema: -; Owner: postgres
--
 CREATE DATABASE frontend_weekend WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE frontend_weekend OWNER TO postgres;

\connect frontend_weekend

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

 CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    comment_text text NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_comment_id_seq OWNER TO postgres;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;


--
-- Name: event_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_comments (
    comment_id integer NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE public.event_comments OWNER TO postgres;

--
-- Name: event_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_ratings (
    event_id integer NOT NULL,
    rating_id integer NOT NULL
);


ALTER TABLE public.event_ratings OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    name text NOT NULL,
    description text,
    event_date date NOT NULL,
    place_name text,
    place_picture text
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- Name: presentation_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presentation_comments (
    comment_id integer NOT NULL,
    presentation_id integer NOT NULL
);


ALTER TABLE public.presentation_comments OWNER TO postgres;

--
-- Name: presentation_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presentation_ratings (
    rating_id integer NOT NULL,
    presentation_id integer NOT NULL
);


ALTER TABLE public.presentation_ratings OWNER TO postgres;

--
-- Name: presentation_speakers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presentation_speakers (
    speaker_id integer NOT NULL,
    presentation_id integer NOT NULL
);


ALTER TABLE public.presentation_speakers OWNER TO postgres;

--
-- Name: presentations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presentations (
    presentation_id integer NOT NULL,
    name text NOT NULL,
    description text,
    images text[],
    event_id integer NOT NULL
);


ALTER TABLE public.presentations OWNER TO postgres;

--
-- Name: presentations_presentation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presentations_presentation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presentations_presentation_id_seq OWNER TO postgres;

--
-- Name: presentations_presentation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presentations_presentation_id_seq OWNED BY public.presentations.presentation_id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    rating_id integer NOT NULL,
    rating_value integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_rating_id_seq OWNER TO postgres;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_rating_id_seq OWNED BY public.ratings.rating_id;


--
-- Name: speaker_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.speaker_comments (
    comment_id integer NOT NULL,
    speaker_id integer NOT NULL
);


ALTER TABLE public.speaker_comments OWNER TO postgres;

--
-- Name: speaker_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.speaker_ratings (
    rating_id integer NOT NULL,
    speaker_id integer NOT NULL
);


ALTER TABLE public.speaker_ratings OWNER TO postgres;

--
-- Name: speakers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.speakers (
    speaker_id integer NOT NULL,
    name text NOT NULL,
    photo text,
    description text
);


ALTER TABLE public.speakers OWNER TO postgres;

--
-- Name: speakers_speaker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.speakers_speaker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.speakers_speaker_id_seq OWNER TO postgres;

--
-- Name: speakers_speaker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.speakers_speaker_id_seq OWNED BY public.speakers.speaker_id;


--
-- Name: comments comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);


--
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: presentations presentation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentations ALTER COLUMN presentation_id SET DEFAULT nextval('public.presentations_presentation_id_seq'::regclass);


--
-- Name: ratings rating_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN rating_id SET DEFAULT nextval('public.ratings_rating_id_seq'::regclass);


--
-- Name: speakers speaker_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speakers ALTER COLUMN speaker_id SET DEFAULT nextval('public.speakers_speaker_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (comment_id, comment_text) FROM stdin;
1	Супер эвент - весгда бы так!
2	Вот это темищщще!
3	Какой обаяшка!
\.


--
-- Data for Name: event_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_comments (comment_id, event_id) FROM stdin;
1	1
\.


--
-- Data for Name: event_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_ratings (event_id, rating_id) FROM stdin;
1	1
1	2
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, name, description, event_date, place_name, place_picture) FROM stdin;
1	Test event	Some test event	2018-11-22	Place name	//static.hajs.ru/picture.jpg
\.


--
-- Data for Name: presentation_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presentation_comments (comment_id, presentation_id) FROM stdin;
2	1
\.


--
-- Data for Name: presentation_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presentation_ratings (rating_id, presentation_id) FROM stdin;
3	1
4	1
\.


--
-- Data for Name: presentation_speakers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presentation_speakers (speaker_id, presentation_id) FROM stdin;
1	1
\.


--
-- Data for Name: presentations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presentations (presentation_id, name, description, images, event_id) FROM stdin;
1	Как написать документацию и не сойти с ума	Больше никакой темы не приходит на ум	{//static.hajs.ru/amazing_photo.jpg}	1
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (rating_id, rating_value) FROM stdin;
1	1
2	3
3	2
4	4
5	4
6	4
\.


--
-- Data for Name: speaker_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.speaker_comments (comment_id, speaker_id) FROM stdin;
3	1
\.


--
-- Data for Name: speaker_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.speaker_ratings (rating_id, speaker_id) FROM stdin;
5	1
6	1
\.


--
-- Data for Name: speakers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.speakers (speaker_id, name, photo, description) FROM stdin;
1	Чел Мордашкин	//static.hajs.ru/amazing_photo.jpg	Хороший человек с приятной внешностью
\.


--
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 3, true);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 1, true);


--
-- Name: presentations_presentation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presentations_presentation_id_seq', 1, true);


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_rating_id_seq', 6, true);


--
-- Name: speakers_speaker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.speakers_speaker_id_seq', 1, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- Name: event_comments event_comments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_comments
    ADD CONSTRAINT event_comments_pk PRIMARY KEY (comment_id, event_id);


--
-- Name: event_ratings event_ratings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT event_ratings_pk PRIMARY KEY (event_id, rating_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: presentation_comments presentation_comments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_comments
    ADD CONSTRAINT presentation_comments_pk PRIMARY KEY (comment_id, presentation_id);


--
-- Name: presentation_ratings presentation_ratings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_ratings
    ADD CONSTRAINT presentation_ratings_pk PRIMARY KEY (rating_id, presentation_id);


--
-- Name: presentation_speakers presentation_speakers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_speakers
    ADD CONSTRAINT presentation_speakers_pk PRIMARY KEY (speaker_id, presentation_id);


--
-- Name: presentations presentations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentations
    ADD CONSTRAINT presentations_pkey PRIMARY KEY (presentation_id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: speaker_comments speaker_comments_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speaker_comments
    ADD CONSTRAINT speaker_comments_pk PRIMARY KEY (comment_id, speaker_id);


--
-- Name: speaker_ratings speaker_ratings_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speaker_ratings
    ADD CONSTRAINT speaker_ratings_pk PRIMARY KEY (rating_id, speaker_id);


--
-- Name: speakers speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speakers
    ADD CONSTRAINT speakers_pkey PRIMARY KEY (speaker_id);


--
-- Name: event_comments_comment_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX event_comments_comment_id_uindex ON public.event_comments USING btree (comment_id);


--
-- Name: event_ratings_rating_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX event_ratings_rating_id_uindex ON public.event_ratings USING btree (rating_id);


--
-- Name: presentation_comments_comment_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX presentation_comments_comment_id_uindex ON public.presentation_comments USING btree (comment_id);


--
-- Name: presentation_ratings_rating_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX presentation_ratings_rating_id_uindex ON public.presentation_ratings USING btree (rating_id);


--
-- Name: speaker_comments_comment_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX speaker_comments_comment_id_uindex ON public.speaker_comments USING btree (comment_id);


--
-- Name: speaker_ratings_rating_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX speaker_ratings_rating_id_uindex ON public.speaker_ratings USING btree (rating_id);


--
-- Name: event_comments event_comments_comments_comment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_comments
    ADD CONSTRAINT event_comments_comments_comment_id_fk FOREIGN KEY (comment_id) REFERENCES public.comments(comment_id);


--
-- Name: event_comments event_comments_events_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_comments
    ADD CONSTRAINT event_comments_events_event_id_fk FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: event_ratings event_ratings_events_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT event_ratings_events_event_id_fk FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: event_ratings event_ratings_ratings_rating_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT event_ratings_ratings_rating_id_fk FOREIGN KEY (rating_id) REFERENCES public.ratings(rating_id);


--
-- Name: presentation_comments presentation_comments_comments_comment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_comments
    ADD CONSTRAINT presentation_comments_comments_comment_id_fk FOREIGN KEY (comment_id) REFERENCES public.comments(comment_id);


--
-- Name: presentation_comments presentation_comments_presentations_presentation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_comments
    ADD CONSTRAINT presentation_comments_presentations_presentation_id_fk FOREIGN KEY (presentation_id) REFERENCES public.presentations(presentation_id);


--
-- Name: presentation_ratings presentation_ratings_presentations_presentation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_ratings
    ADD CONSTRAINT presentation_ratings_presentations_presentation_id_fk FOREIGN KEY (presentation_id) REFERENCES public.presentations(presentation_id);


--
-- Name: presentation_ratings presentation_ratings_ratings_rating_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_ratings
    ADD CONSTRAINT presentation_ratings_ratings_rating_id_fk FOREIGN KEY (rating_id) REFERENCES public.ratings(rating_id);


--
-- Name: presentation_speakers presentation_speakers_presentations_presentation_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_speakers
    ADD CONSTRAINT presentation_speakers_presentations_presentation_id_fk FOREIGN KEY (presentation_id) REFERENCES public.presentations(presentation_id);


--
-- Name: presentation_speakers presentation_speakers_speakers_speaker_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentation_speakers
    ADD CONSTRAINT presentation_speakers_speakers_speaker_id_fk FOREIGN KEY (speaker_id) REFERENCES public.speakers(speaker_id);


--
-- Name: presentations presentations_events_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentations
    ADD CONSTRAINT presentations_events_event_id_fk FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: speaker_comments speaker_comments_comments_comment_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speaker_comments
    ADD CONSTRAINT speaker_comments_comments_comment_id_fk FOREIGN KEY (comment_id) REFERENCES public.comments(comment_id);


--
-- Name: speaker_comments speaker_comments_speakers_speaker_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speaker_comments
    ADD CONSTRAINT speaker_comments_speakers_speaker_id_fk FOREIGN KEY (speaker_id) REFERENCES public.speakers(speaker_id);


--
-- Name: speaker_ratings speaker_ratings_ratings_rating_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speaker_ratings
    ADD CONSTRAINT speaker_ratings_ratings_rating_id_fk FOREIGN KEY (rating_id) REFERENCES public.ratings(rating_id);


--
-- Name: speaker_ratings speaker_ratings_speakers_speaker_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speaker_ratings
    ADD CONSTRAINT speaker_ratings_speakers_speaker_id_fk FOREIGN KEY (speaker_id) REFERENCES public.speakers(speaker_id);


--
-- PostgreSQL database dump complete
--

