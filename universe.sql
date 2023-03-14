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
    name character varying NOT NULL,
    age_in_millions_of_years integer,
    description text,
    galaxy_types_id integer NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying NOT NULL,
    avg_star_count_in_billions integer
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    is_spherical boolean,
    description text
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
    name character varying NOT NULL,
    star_id integer,
    has_life boolean,
    description text
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
    name character varying NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric(4,1),
    description text
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (21, 'Andromeda', 2200000, 'Spiral galaxy approximately 2.5 million light years away from Earth', 1);
INSERT INTO public.galaxy VALUES (22, 'Milky Way', 1300000, 'Barred spiral galaxy that contains our Solar System', 1);
INSERT INTO public.galaxy VALUES (23, 'NGC 1300', 100000, 'Barred spiral galaxy with two main arms and multiple smaller ones', 1);
INSERT INTO public.galaxy VALUES (24, 'Cartwheel Galaxy', 500000, 'Unusual galaxy with a ring-like structure that was caused by a collision', 2);
INSERT INTO public.galaxy VALUES (25, 'Cigar Galaxy', 100000, 'Irregular galaxy that is undergoing a massive starburst', 3);
INSERT INTO public.galaxy VALUES (26, 'Black Eye Galaxy', 30000, 'Spiral galaxy with a prominent dark band that gives it its name', 1);
INSERT INTO public.galaxy VALUES (27, 'Whirlpool Galaxy', 23000, 'Spiral galaxy with a prominent companion galaxy that is undergoing tidal disruption', 1);
INSERT INTO public.galaxy VALUES (28, 'Sombrero Galaxy', 10000, 'Unusual galaxy with a prominent dust lane that gives it its hat-like appearance', 1);
INSERT INTO public.galaxy VALUES (29, 'Tadpole Galaxy', 10000, 'Irregular galaxy with a long tail of stars and gas that was likely caused by a previous collision', 3);
INSERT INTO public.galaxy VALUES (30, 'Sunflower Galaxy', 55000, 'Spiral galaxy with a bright central region that resembles the seeds of a sunflower', 1);
INSERT INTO public.galaxy VALUES (31, 'Pinwheel Galaxy', 21000, 'Spiral galaxy with prominent arms that resemble the pinwheel toy', 1);
INSERT INTO public.galaxy VALUES (32, 'Antennae Galaxies', 60000, 'Pair of colliding galaxies that are undergoing intense star formation', 2);
INSERT INTO public.galaxy VALUES (33, 'Hoags Object', 35000, 'Ring galaxy with a central nucleus that is surrounded by a bright circular ring', 1);
INSERT INTO public.galaxy VALUES (34, 'Butterfly Galaxy', 115000, 'Irregular galaxy with a shape that resembles a butterfly', 3);
INSERT INTO public.galaxy VALUES (35, 'Siamese Twins Galaxies', 90000, 'Pair of colliding galaxies that are in the process of merging', 2);
INSERT INTO public.galaxy VALUES (36, 'Jellyfish Galaxy', 180000, 'Galaxy with long tentacles of gas and dust that resemble the tentacles of a jellyfish', 2);
INSERT INTO public.galaxy VALUES (37, 'Twin Jet Nebula', 1200, 'Planetary nebula with two high-velocity jets that are shooting out from its center', 4);
INSERT INTO public.galaxy VALUES (38, 'Blue Planetary Nebula', 1500, 'Planetary nebula with a blue-green color caused by ionized oxygen', 4);
INSERT INTO public.galaxy VALUES (39, 'Helix Nebula', 10000, 'Planetary nebula with a complex and intricate structure that resembles a helix', 4);
INSERT INTO public.galaxy VALUES (40, 'Crab Nebula', 1000, 'Supernova remnant that was created by the explosion of a massive star', 4);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 100);
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 200);
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 50);
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', 150);
INSERT INTO public.galaxy_types VALUES (5, 'Dwarf', 10);
INSERT INTO public.galaxy_types VALUES (6, 'Ultra-Compact', 5);
INSERT INTO public.galaxy_types VALUES (7, 'Ultra-Diffuse', 1);
INSERT INTO public.galaxy_types VALUES (8, 'Starburst', 20);
INSERT INTO public.galaxy_types VALUES (9, 'Ring', 25);
INSERT INTO public.galaxy_types VALUES (10, 'Barred Spiral', 80);
INSERT INTO public.galaxy_types VALUES (11, 'Dwarf Spheroidal', 2);
INSERT INTO public.galaxy_types VALUES (12, 'Peanuts', 40);
INSERT INTO public.galaxy_types VALUES (13, 'Compact', 8);
INSERT INTO public.galaxy_types VALUES (14, 'Complex', 60);
INSERT INTO public.galaxy_types VALUES (15, 'Magellanic', 4);
INSERT INTO public.galaxy_types VALUES (16, 'Intermediate', 120);
INSERT INTO public.galaxy_types VALUES (17, 'Blue', 30);
INSERT INTO public.galaxy_types VALUES (18, 'Polar', 6);
INSERT INTO public.galaxy_types VALUES (19, 'Counter-Rotating', 15);
INSERT INTO public.galaxy_types VALUES (20, 'Polar Ring', 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, true, 'The Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, true, 'The larger and innermost of the two moons of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 'The smaller and outermost of the two moons of Mars');
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, true, 'The largest moon of Jupiter and the largest moon in the Solar System');
INSERT INTO public.moon VALUES (5, 'Callisto', 3, true, 'The second largest moon of Jupiter and the third largest moon in the Solar System');
INSERT INTO public.moon VALUES (6, 'Io', 3, true, 'The innermost of the four Galilean moons of Jupiter');
INSERT INTO public.moon VALUES (7, 'Europa', 3, true, 'The smallest of the four Galilean moons of Jupiter');
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 'The largest moon of Saturn and the second largest moon in the Solar System');
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, true, 'An icy moon of Saturn with active geysers');
INSERT INTO public.moon VALUES (10, 'Tethys', 4, true, 'A mid-sized moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Mimas', 4, true, 'A small moon of Saturn with a prominent impact crater');
INSERT INTO public.moon VALUES (12, 'Miranda', 5, false, 'A small and icy moon of Uranus with a chaotic terrain');
INSERT INTO public.moon VALUES (13, 'Oberon', 5, true, 'The outermost of the five major moons of Uranus');
INSERT INTO public.moon VALUES (14, 'Titania', 5, true, 'The largest of the five major moons of Uranus');
INSERT INTO public.moon VALUES (15, 'Ariel', 5, true, 'The fourth largest of the five major moons of Uranus');
INSERT INTO public.moon VALUES (16, 'Neptune 1', 6, true, 'The largest of Neptunes 14 known moons');
INSERT INTO public.moon VALUES (17, 'Nereid', 6, false, 'A small and irregularly shaped moon of Neptune');
INSERT INTO public.moon VALUES (18, 'Charon', 7, true, 'The largest moon of Pluto and the largest known moon relative to its host planet');
INSERT INTO public.moon VALUES (19, 'Nix', 7, false, 'A small moon of Pluto');
INSERT INTO public.moon VALUES (20, 'Styx', 7, false, 'A small moon of Pluto');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Acamar', 7, false, 'A planet with a toxic atmosphere');
INSERT INTO public.planet VALUES (2, 'Bajor', 9, false, 'A planet with a stable wormhole nearby');
INSERT INTO public.planet VALUES (3, 'Cestus III', 13, false, 'A planet with rich mineral deposits');
INSERT INTO public.planet VALUES (4, 'Dagobah', 15, false, 'A planet covered in swamps and jungles');
INSERT INTO public.planet VALUES (5, 'Epsilon Eridani b', 3, true, 'A planet with a rich microbial biosphere');
INSERT INTO public.planet VALUES (6, 'Ferenginar', 5, false, 'A planet with a capitalist culture');
INSERT INTO public.planet VALUES (7, 'Gallifrey', 19, true, 'A planet with a long history of time travel');
INSERT INTO public.planet VALUES (8, 'Hoth', 17, false, 'A frozen planet in a remote system');
INSERT INTO public.planet VALUES (9, 'Icaria Prime', 1, false, 'A planet with a low-tech society');
INSERT INTO public.planet VALUES (10, 'Jupiter', 6, false, 'A gas giant with many moons');
INSERT INTO public.planet VALUES (11, 'Krypton', 4, false, 'A planet with a high gravity and a red sun');
INSERT INTO public.planet VALUES (12, 'Luna', 10, false, 'The Earths only natural satellite');
INSERT INTO public.planet VALUES (13, 'Mars', 11, true, 'A planet with evidence of past water and life');
INSERT INTO public.planet VALUES (14, 'New Caprica', 2, false, 'A planet colonized by humans');
INSERT INTO public.planet VALUES (15, 'Orion', 16, false, 'A planet with a thriving slave trade');
INSERT INTO public.planet VALUES (16, 'Pandora', 12, true, 'A moon with a rich ecosystem');
INSERT INTO public.planet VALUES (17, 'QonoS', 18, false, 'The homeworld of the Klingons');
INSERT INTO public.planet VALUES (18, 'Rylos', 20, false, 'A planet with a peaceful civilization');
INSERT INTO public.planet VALUES (19, 'Tatooine', 14, false, 'A desert planet with two suns');
INSERT INTO public.planet VALUES (20, 'Utopia Planitia', 8, false, 'A planet with a Martian shipyard');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 21, 8.3, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 21, 4.2, 'The nearest star to our solar system');
INSERT INTO public.star VALUES (3, 'Sirius', 21, 8.6, 'The brightest star in the night sky');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 21, 642.0, 'A red supergiant star in the constellation Orion');
INSERT INTO public.star VALUES (5, 'Antares', 22, 550.0, 'A red supergiant star in the constellation Scorpius');
INSERT INTO public.star VALUES (6, 'Vega', 22, 25.0, 'The fifth-brightest star in the night sky');
INSERT INTO public.star VALUES (7, 'Aldebaran', 22, 65.0, 'A red giant star in the constellation Taurus');
INSERT INTO public.star VALUES (8, 'Altair', 23, 17.0, 'The twelfth-brightest star in the night sky');
INSERT INTO public.star VALUES (9, 'Arcturus', 23, 37.0, 'The brightest star in the constellation Boötes');
INSERT INTO public.star VALUES (10, 'Rigel', 24, 860.0, 'A blue supergiant star in the constellation Orion');
INSERT INTO public.star VALUES (11, 'Deneb', 25, 260.0, 'A supergiant star in the constellation Cygnus');
INSERT INTO public.star VALUES (12, 'Polaris', 26, 431.0, 'The current North Star');
INSERT INTO public.star VALUES (13, 'Regulus', 27, 79.0, 'The brightest star in the constellation Leo');
INSERT INTO public.star VALUES (14, 'Alpha Centauri A', 28, 4.3, 'The primary component of the Alpha Centauri system');
INSERT INTO public.star VALUES (15, 'Alpha Centauri B', 28, 4.3, 'The secondary component of the Alpha Centauri system');
INSERT INTO public.star VALUES (16, 'RR Lyrae', 29, 201.0, 'A variable star in the Small Magellanic Cloud');
INSERT INTO public.star VALUES (17, 'Eta Carinae', 30, 750.0, 'A highly luminous hypergiant star in the Large Magellanic Cloud');
INSERT INTO public.star VALUES (18, 'Algol', 31, 93.0, 'A binary star system in the constellation Perseus');
INSERT INTO public.star VALUES (19, 'Mira', 32, 418.0, 'A variable red giant star in the constellation Cetus');
INSERT INTO public.star VALUES (20, 'Betelgeuse 2', 33, 642.0, 'Another red supergiant star with a sombrero shape');
INSERT INTO public.star VALUES (21, 'SN 1987A', 34, 168.0, 'A supernova remnant in the Cartwheel Galaxy');
INSERT INTO public.star VALUES (22, 'Hubble-Sandage Var', 35, 600.0, 'A rare type of variable star in Hoags Object');
INSERT INTO public.star VALUES (23, 'SDSS J1148+5251', 36, 129.0, 'The most distant known quasar');
INSERT INTO public.star VALUES (24, 'SDSS J1029+2623', 37, 110.0, 'A gravitationally lensed galaxy that forms a horseshoe shape');
INSERT INTO public.star VALUES (25, 'Wolf-Lundmark-Melotte', 38, 820.0, 'A dwarf spheroidal galaxy in the constellation Leo');
INSERT INTO public.star VALUES (26, 'Ursa Minor Dwarf', 39, 245.0, 'Another faint dwarf spheroidal galaxy in the constellation Ursa Minor');
INSERT INTO public.star VALUES (27, 'Segue 2', 40, 35.0, 'A very faint and distant dwarf galaxy in the constellation Canes Venatici');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 40, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 27, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_type_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

-- All values for the database are dummy values generated with the assistance of ChatGPT. Certain prompts were fed into ChatGPT which then allowed it to give me suitable dummy data. I took care to edit this data to ensure compliance to constraints.
