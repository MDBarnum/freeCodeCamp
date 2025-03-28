--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(35) NOT NULL,
    description text,
    number_of_stars integer,
    diameter_in_lightyears integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.object (
    object_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text
);


ALTER TABLE public.object OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_object_id_seq OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.object_object_id_seq OWNED BY public.object.object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text,
    has_life boolean,
    star_id integer NOT NULL,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(35) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    lightyears_from_earth numeric(6,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: object object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object ALTER COLUMN object_id SET DEFAULT nextval('public.object_object_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'home galaxy', 123456789, 987654321);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'closest neighbor', 56704321, 6789051);
INSERT INTO public.galaxy VALUES (3, 'Ork', 'Mork home', 56704321, 6789051);
INSERT INTO public.galaxy VALUES (4, 'Heaven', 'cloudy', 77777, 77777);
INSERT INTO public.galaxy VALUES (5, 'Hell', 'fiery', 66666, 66666);
INSERT INTO public.galaxy VALUES (6, 'crab', 'salty', 12345, 54321);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', 'first moon', false, 1);
INSERT INTO public.moon VALUES (2, 'moon 2', 'second moon', false, 1);
INSERT INTO public.moon VALUES (3, 'moon 3', 'third moon', false, 1);
INSERT INTO public.moon VALUES (4, 'moon 4', 'fourth moon', true, 2);
INSERT INTO public.moon VALUES (5, 'moon 5', 'fifth moon', true, 2);
INSERT INTO public.moon VALUES (6, 'moon 6', 'sixth moon', true, 2);
INSERT INTO public.moon VALUES (7, 'moon 7', 'seventh moon', true, 3);
INSERT INTO public.moon VALUES (8, 'moon 8', 'eighth moon', true, 3);
INSERT INTO public.moon VALUES (9, 'moon 9', 'ninth moon', true, 3);
INSERT INTO public.moon VALUES (10, 'moon 10', 'tenth moon', true, 4);
INSERT INTO public.moon VALUES (11, 'moon 11', 'eleventh moon', true, 4);
INSERT INTO public.moon VALUES (12, 'moon 12', 'twelfth  moon', true, 4);
INSERT INTO public.moon VALUES (13, 'moon 13', 'thirteenth moon', true, 5);
INSERT INTO public.moon VALUES (14, 'moon 14', 'fourteenth moon', true, 5);
INSERT INTO public.moon VALUES (15, 'moon 15', 'fifteenth moon', true, 6);
INSERT INTO public.moon VALUES (16, 'moon 16', 'sixteenth moon', true, 7);
INSERT INTO public.moon VALUES (17, 'moon 17', 'seventeenth moon', true, 8);
INSERT INTO public.moon VALUES (18, 'moon 18', 'eighteenth moon', true, 9);
INSERT INTO public.moon VALUES (19, 'moon 19', 'nineteenth moon', true, 10);
INSERT INTO public.moon VALUES (20, 'moon 20', 'twentieth moon', true, 12);


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.object VALUES (1, 'object 1', 'first object');
INSERT INTO public.object VALUES (2, 'object 2', 'second object');
INSERT INTO public.object VALUES (3, 'object 3', 'third object');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 'first planet', false, 1, 1);
INSERT INTO public.planet VALUES (2, 'planet 2', 'second planet', false, 1, 1);
INSERT INTO public.planet VALUES (3, 'planet 3', 'third planet', false, 2, 1);
INSERT INTO public.planet VALUES (4, 'planet 4', 'fourth planet', false, 2, 1);
INSERT INTO public.planet VALUES (5, 'planet 5', 'fifth planet', false, 3, 1);
INSERT INTO public.planet VALUES (6, 'planet 6', 'sixth planet', false, 3, 1);
INSERT INTO public.planet VALUES (7, 'planet 7', 'seventh planet', false, 4, 1);
INSERT INTO public.planet VALUES (8, 'planet 8', 'eighth planet', false, 4, 1);
INSERT INTO public.planet VALUES (9, 'planet 9', 'ninth planet', false, 5, 1);
INSERT INTO public.planet VALUES (10, 'planet 10', 'tenth planet', false, 5, 1);
INSERT INTO public.planet VALUES (11, 'planet 11', 'eleventh planet', true, 6, 1);
INSERT INTO public.planet VALUES (12, 'planet 12', 'twelth planet', false, 6, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', 'first star', 1, 3.2);
INSERT INTO public.star VALUES (2, 'star 2', 'second star', 2, 6.4);
INSERT INTO public.star VALUES (3, 'star 3', 'third star', 3, 12.8);
INSERT INTO public.star VALUES (4, 'star 4', 'fourth star', 4, 25.6);
INSERT INTO public.star VALUES (5, 'star 5', 'fifth star', 5, 51.2);
INSERT INTO public.star VALUES (6, 'star 6', 'sixth star', 6, 102.4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.object_object_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: object object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_name_key UNIQUE (name);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (object_id);


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
-- Name: star star_galax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galax_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

