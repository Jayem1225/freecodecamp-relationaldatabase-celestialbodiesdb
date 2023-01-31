--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    shape character varying(30) NOT NULL,
    age_in_light_years integer,
    arms integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60),
    planet_id integer NOT NULL,
    distance_from_planet_in_km integer,
    orbit_time_in_days numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60),
    star_id integer NOT NULL,
    description text,
    habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    galaxy_id integer NOT NULL,
    obliquity_to_the_ecliptic numeric(5,2),
    type character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.state (
    state_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.state OWNER TO freecodecamp;

--
-- Name: states_state_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.states_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_state_id_seq OWNER TO freecodecamp;

--
-- Name: states_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.states_state_id_seq OWNED BY public.state.state_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: state state_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state ALTER COLUMN state_id SET DEFAULT nextval('public.states_state_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Tadpole Galaxy', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 'disk', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 8, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 8, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 8, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 8, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 8, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Triton', 4, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Nereid', 4, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Titan', 5, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Enceladus', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Mimas', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Titania', 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Puck', 7, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Cressida', 7, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 1, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Mercury', 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Neptune', 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Venus', 1, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Jupiter', 1, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese 581e', 4, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Gliese 581b', 4, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 6, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri d', 6, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Mirach', 2, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Gliese 581', 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, NULL, NULL);


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.state VALUES (1, 'solid', false);
INSERT INTO public.state VALUES (2, 'liquid', false);
INSERT INTO public.state VALUES (3, 'gas', false);
INSERT INTO public.state VALUES (4, 'plasma', true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: states_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.states_state_id_seq', 4, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: state states_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT states_name_key UNIQUE (name);


--
-- Name: state states_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT states_pkey PRIMARY KEY (state_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

