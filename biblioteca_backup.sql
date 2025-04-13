--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-12 18:51:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 16794)
-- Name: autor_editorial_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor_editorial_libro (
    id integer NOT NULL,
    autor_id integer,
    editorial_id integer,
    libro_id integer,
    fecha date
);


ALTER TABLE public.autor_editorial_libro OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16793)
-- Name: autor_editorial_libro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autor_editorial_libro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autor_editorial_libro_id_seq OWNER TO postgres;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 223
-- Name: autor_editorial_libro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autor_editorial_libro_id_seq OWNED BY public.autor_editorial_libro.id;


--
-- TOC entry 218 (class 1259 OID 16771)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    id integer NOT NULL,
    nombres character varying(255) NOT NULL
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16770)
-- Name: autores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autores_id_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 217
-- Name: autores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autores_id_seq OWNED BY public.autores.id;


--
-- TOC entry 220 (class 1259 OID 16778)
-- Name: editorial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editorial (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.editorial OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16777)
-- Name: editorial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editorial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.editorial_id_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 219
-- Name: editorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editorial_id_seq OWNED BY public.editorial.id;


--
-- TOC entry 222 (class 1259 OID 16785)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    copias integer DEFAULT 1 NOT NULL,
    estante integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16784)
-- Name: libros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libros_id_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 221
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_id_seq OWNED BY public.libros.id;


--
-- TOC entry 228 (class 1259 OID 16827)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    libro_id integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date,
    estado character varying(50) DEFAULT 'Prestado'::character varying NOT NULL,
    multa numeric(10,2),
    notas text
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16826)
-- Name: prestamos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestamos_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_id_seq OWNED BY public.prestamos.id;


--
-- TOC entry 226 (class 1259 OID 16816)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    direccion character varying(255),
    telefono character varying(20)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16815)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4725 (class 2604 OID 16797)
-- Name: autor_editorial_libro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro ALTER COLUMN id SET DEFAULT nextval('public.autor_editorial_libro_id_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 16774)
-- Name: autores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores ALTER COLUMN id SET DEFAULT nextval('public.autores_id_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 16781)
-- Name: editorial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial ALTER COLUMN id SET DEFAULT nextval('public.editorial_id_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 16788)
-- Name: libros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN id SET DEFAULT nextval('public.libros_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16830)
-- Name: prestamos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN id SET DEFAULT nextval('public.prestamos_id_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 16819)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4900 (class 0 OID 16794)
-- Dependencies: 224
-- Data for Name: autor_editorial_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor_editorial_libro (id, autor_id, editorial_id, libro_id, fecha) FROM stdin;
1	2	1	2	\N
2	2	1	3	\N
3	2	2	1	\N
4	2	1	2	\N
5	2	1	3	\N
6	2	2	1	\N
\.


--
-- TOC entry 4894 (class 0 OID 16771)
-- Dependencies: 218
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (id, nombres) FROM stdin;
1	William Shakespeare
2	Ruben Dario
3	William Shakespeare
4	Ruben Dario
\.


--
-- TOC entry 4896 (class 0 OID 16778)
-- Dependencies: 220
-- Data for Name: editorial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editorial (id, nombre) FROM stdin;
1	Pearson
2	Panini
3	Pearson
4	Panini
\.


--
-- TOC entry 4898 (class 0 OID 16785)
-- Dependencies: 222
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (id, nombre, copias, estante) FROM stdin;
1	Romeo y Julieta	1	1
2	Dragonball	1	1
3	Azul...	1	1
4	Romeo y Julieta	1	1
5	Dragonball	1	1
6	Azul...	1	1
\.


--
-- TOC entry 4904 (class 0 OID 16827)
-- Dependencies: 228
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (id, usuario_id, libro_id, fecha_prestamo, fecha_devolucion, estado, multa, notas) FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 16816)
-- Dependencies: 226
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, email, direccion, telefono) FROM stdin;
\.


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 223
-- Name: autor_editorial_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_editorial_libro_id_seq', 6, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 217
-- Name: autores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_id_seq', 4, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 219
-- Name: editorial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editorial_id_seq', 4, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 221
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_seq', 6, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_id_seq', 1, false);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 225
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- TOC entry 4736 (class 2606 OID 16799)
-- Name: autor_editorial_libro autor_editorial_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_pkey PRIMARY KEY (id);


--
-- TOC entry 4730 (class 2606 OID 16776)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 16783)
-- Name: editorial editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT editorial_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 16792)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 16835)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 16825)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 4740 (class 2606 OID 16823)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16800)
-- Name: autor_editorial_libro autor_editorial_libro_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.autores(id);


--
-- TOC entry 4744 (class 2606 OID 16805)
-- Name: autor_editorial_libro autor_editorial_libro_editorial_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_editorial_id_fkey FOREIGN KEY (editorial_id) REFERENCES public.editorial(id);


--
-- TOC entry 4745 (class 2606 OID 16810)
-- Name: autor_editorial_libro autor_editorial_libro_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_editorial_libro
    ADD CONSTRAINT autor_editorial_libro_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 4746 (class 2606 OID 16841)
-- Name: prestamos fk_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_libro FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 4747 (class 2606 OID 16836)
-- Name: prestamos fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


-- Completed on 2025-04-12 18:51:10

--
-- PostgreSQL database dump complete
--

