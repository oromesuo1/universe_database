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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_size_in_billion_years numeric(4,1),
    galaxy_description text NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    moon_description text NOT NULL,
    moon_type text
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_life boolean NOT NULL,
    star_id integer,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moons (
    planet_moons_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    moon_id integer,
    moon_age integer
);


ALTER TABLE public.planet_moons OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moons_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moons_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moons_planet_moon_id_seq OWNED BY public.planet_moons.planet_moons_id;


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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    star_size_in_billion_years numeric(4,1),
    is_bright boolean NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moons planet_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons ALTER COLUMN planet_moons_id SET DEFAULT nextval('public.planet_moons_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1200, 23.8, 'This is the Earths own Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromedia Galaxy', 1800, 50.9, 'This galaxy is very dusty');
INSERT INTO public.galaxy VALUES (3, 'GN-Z11', 1780, 234.0, 'Its description is still on known');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 1560, 45.8, 'This is as old or even older than Milky way');
INSERT INTO public.galaxy VALUES (5, 'IC 1101', 1560, 234.0, 'This is a thickly dark galaxy with a bright spot');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 1234, 23.7, 'It has a bright ring around the center');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'MOON-101', 1, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (2, 'MOON-102', 2, 'Beautiful green', 'Conical');
INSERT INTO public.moon VALUES (3, 'MOON-103', 5, 'Beautiful Blue', 'Circular');
INSERT INTO public.moon VALUES (4, 'MOON-104', 3, 'Beautiful Purple', 'Elliptic');
INSERT INTO public.moon VALUES (5, 'MOON-105', 5, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (6, 'MOON-106', 2, 'Beautiful Orange', 'Conical');
INSERT INTO public.moon VALUES (7, 'MOON-107', 7, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (8, 'MOON-108', 8, 'Beautiful green', 'Elliptic');
INSERT INTO public.moon VALUES (9, 'MOON-109', 12, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (10, 'MOON-110', 10, 'Beautiful green', 'Conical');
INSERT INTO public.moon VALUES (11, 'MOON-111', 1, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (12, 'MOON-112', 2, 'Beautiful green', 'Conical');
INSERT INTO public.moon VALUES (13, 'MOON-113', 5, 'Beautiful Blue', 'Circular');
INSERT INTO public.moon VALUES (14, 'MOON-114', 3, 'Beautiful Purple', 'Elliptic');
INSERT INTO public.moon VALUES (15, 'MOON-115', 5, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (16, 'MOON-116', 2, 'Beautiful Orange', 'Conical');
INSERT INTO public.moon VALUES (17, 'MOON-117', 7, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (18, 'MOON-118', 8, 'Beautiful green', 'Elliptic');
INSERT INTO public.moon VALUES (19, 'MOON-119', 12, 'Beautiful red', 'Circular');
INSERT INTO public.moon VALUES (20, 'MOON-120', 10, 'Beautiful green', 'Conical');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 7, true);
INSERT INTO public.planet VALUES (2, 'Venus', false, 6, true);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, true);
INSERT INTO public.planet VALUES (5, 'Ceres', false, 5, false);
INSERT INTO public.planet VALUES (6, 'Jupiter', false, 2, true);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 3, true);
INSERT INTO public.planet VALUES (8, 'Ceres-1102', true, 4, true);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 4, true);
INSERT INTO public.planet VALUES (10, 'Sharon', false, 3, false);
INSERT INTO public.planet VALUES (11, 'Jupiter-2', false, 2, true);
INSERT INTO public.planet VALUES (12, 'Uranus-2', false, 3, true);
INSERT INTO public.planet VALUES (13, 'Ceres-1102-2', true, 4, true);
INSERT INTO public.planet VALUES (14, 'Pluto-2', false, 4, true);
INSERT INTO public.planet VALUES (15, 'Sharon-2', false, 3, false);


--
-- Data for Name: planet_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moons VALUES (1, 'PM-1', 1, 16, 240);
INSERT INTO public.planet_moons VALUES (2, 'PM-2', 3, 10, 150);
INSERT INTO public.planet_moons VALUES (3, 'PM-3', 5, 8, 567);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'STAR-101', 1, 234.0, true);
INSERT INTO public.star VALUES (2, 'STAR-102', 1, 230.0, true);
INSERT INTO public.star VALUES (3, 'STAR-103', 1, 234.5, true);
INSERT INTO public.star VALUES (4, 'STAR-104', 1, 225.0, true);
INSERT INTO public.star VALUES (5, 'STAR-105', 2, 659.0, false);
INSERT INTO public.star VALUES (6, 'STAR-106', 3, 234.0, true);
INSERT INTO public.star VALUES (7, 'STAR-107', 5, 167.0, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moons_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moons_planet_moon_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_moons planet_moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_name_key UNIQUE (name);


--
-- Name: planet_moons planet_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_pkey PRIMARY KEY (planet_moons_id);


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
-- Name: planet planet_distance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_distance_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet_moons planet_moons_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moons planet_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_age_in_millions_of_years_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_age_in_millions_of_years_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

