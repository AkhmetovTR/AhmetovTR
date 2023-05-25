--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
3	Аккустические гитары
1	Электрогитары
2	Бас гитары
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (id, file_name, product_id) FROM stdin;
1	4df6d2c5-65ac-4cad-b6e0-9ebede81c16f.e0s8poh09bwcoc4cokkkgks0w.jpg	1
2	32970a86-e3f5-4595-9cc1-e21c5bb50659.1y6i4xf7123o4g0kgs40scocs.jpg	1
3	094299a6-21bb-447b-b129-84181b303974.	1
4	73de812e-2499-4d3a-bb2b-cd5884bcc4ae.1ibjfjunncaskw0c4gwgggsso.jpg	1
5	f704463a-2ad7-4a1f-bd1c-8c7874e98c6d.1cq96fh7a8cg4gsow4k0sg4c8.jpg	1
6	af58cda1-57fa-4aa6-a613-428042bc8770.dse1xtwbhlw0g8oww04wsow00.jpg	2
7	e7f22320-b91f-45ee-b9e2-d435539c182e.8o3ewkubfpk44wc40k08skkg8.jpg	2
8	68fc8dda-dd2b-4abc-b2e4-c1af9558d147.	2
9	34769130-b48a-4945-adfb-d30a0fa9c7b2.	2
10	0cf9a308-031f-4058-b675-74c176bdfc30.	2
16	f75a2975-3e29-4d29-9032-c6b34cce24ed.uqju1qw9wn40cg08cs04cg0w.jpg	4
17	eb40818a-9194-4124-81b3-79bde804cd47.3tuycrgx8z28s8s44w4ks8o4c.jpg	4
18	67f0c01c-c1b0-44ea-bebf-8f4fee39fe54.	4
19	b69a45fe-2d9b-474f-9807-b3cd0e37f203.	4
20	b4e89fcd-2c25-47db-aecb-3a8db281dcfb.	4
21	4e616574-043d-4a9a-af0e-bcf7911aea14.b41he3f4aw8o4wc0cwskog00c.jpg	5
22	f0bb0b7d-b621-4186-9526-47059c623b5d.	5
23	df99d366-4c95-429c-afcc-8e4efbabefaf.	5
24	6775f2d6-b920-4b61-bca6-01df91e2dce3.	5
25	521c2a35-3bf9-4dd9-8eb3-a51b92206763.	5
26	3a73b741-85a6-4db4-a893-1fcb70e9aa1e.ctrs7t5d2lss8ossokg84co0k.jpeg	6
27	ebf63693-de76-4f58-bcdf-ddf646f4f670.4wbvxh3wn8qo0sc8oc004ss08.jpeg	6
28	7c272666-5f35-4950-a5b9-ad03e2f35860.	6
29	51c15f02-ad76-4ce3-bac7-e72d3d42a427.	6
30	5d975545-b051-412b-9a7e-723cd8a69aa6.	6
31	b4829343-61f7-4ab8-bc03-cbf6f64fe151.c6xqm40ocrso0gg8gg48c8k4o.jpg	7
32	bab3303b-6ba1-4a04-b983-574201dc6b85.9do2ek3nl9ss0s4s440gg4wcg.jpg	7
33	8ba8fa99-dc48-43e2-b2dd-44afbbc9d3d2.	7
34	fdcf16fa-ed67-4027-b1f5-5c2c37d7e4eb.	7
35	1a88591f-c19e-4dc4-ae60-bbf73ede35d7.	7
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, count, date_time, number, price, status, person_id, product_id) FROM stdin;
1	1	2023-05-25 23:26:14.683859	e9b38a77-bc59-4a13-9b67-6a8b51d01f04	85000	2	2	2
2	1	2023-05-25 23:26:14.696863	e9b38a77-bc59-4a13-9b67-6a8b51d01f04	45000	2	2	5
3	1	2023-05-25 23:26:37.075992	f5eaa4c8-f1c0-47fa-98ce-fa5dc960db5d	45000	1	3	7
4	1	2023-05-25 23:26:37.079994	f5eaa4c8-f1c0-47fa-98ce-fa5dc960db5d	163000	1	3	6
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, login, password, role) FROM stdin;
1	admin	$2a$10$GtIdFH9GGUs0jNgguu7Sauyam7QiQ5sZuRmmg2mfYSk25ea2cukqK	ROLE_ADMIN
2	user1	$2a$10$19WZJa7IWa5pZAmBZXTzw.4Be8HXdbxvhs6EGvJyOK6JfjcPfcHwW	ROLE_USER
3	user2	$2a$10$6kZ6ZNUOEfaZ6Gq85Ox.nOBAxaYjGW6o/hOjs0GPG6nAebj2FlG3m	ROLE_USER
4	admin1	$2a$10$gs9ql4CPgqsxuCQvLOgmme2Smh6aHladpdlzZjkGXXdp9hgqVCUtq	ROLE_USER
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, date_time, description, price, seller, title, warehouse, category_id) FROM stdin;
2	2023-05-25 23:14:17.453339	это стратокастер, которого еще никогда не было в линейке Affinity. Теперь классический дизайн страта дополнен двумя мощными керамическими хамбакерами, которые позволяют работать в любом тяжелом жанре рока и металла. Сочетание удобства и эргономики страта, а также мощи керамических хамбакеров открывает совершенно новое поле для экспериментов.	85000	MuzMaf	Fender Strarocaster 	Москва	1
4	2023-05-25 23:16:42.540389	Бас-гитара с кейсом, цвет 2-х цветный санберст	140000	MuzMag	Fender	Москва	2
5	2023-05-25 23:18:15.763459	Электроакустическая гитара типа DREADNOUGHT CUTAWAY, цвет натуральный, верхняя дека массив ели, нижняя дека и обечайки - орех, гриф махогани, накладка на гриф - терминалия, преамп TK-40D со встроенным тюнером	45000	MuzMag	TAKAMINE	Москва	3
6	2023-05-25 23:19:27.580545	Электроакустическая гитара, цвет - натуральный, верхняя дека - массив ситхинской ели, нижняя дека и обечайка - массив фигурного клена, гриф - 3-слоя клен/махагони, накладка грифа - индийская лаурель. Профиль грифа - Rounded C, 20 ладов, мензура - 25,55``. Звукосниматель - Fishman Sonitone, преамп - Fishman Sonicore, регуляторы - 1 громкость, 1 тон, скрытый монтаж. Колки - Epiphone Deluxe (Grover). Цвет фурнитуры - никель. Поставляется без батареек.	163000	MuzMAg	EPIPHONE J-200	Москва	3
1	\N	Дека гитары сделана из отборного махагони с топом из клена. Гриф сделан из махогани с классической накладкой из черного дерева (эбони). Количество ладов грифа - 22. Мензура инструмента составляет 24,75". На деку гитары установлено два мощных хамбакера, спецификация - Н/Н, модели - Burstbucker Pro Rhythm neck & Burstbucker Pro + Lead bridge pickups. Органы настройки звучания гитары - 2 volumes, 2 tones, 3-позиционный переключатель. Бридж фиксированный, модель Tune-O-Matic, струнодержатель - Stop Bar	185000	МузМаг	Электрогитара Gibson Les Paul	Москва	1
7	2023-05-25 23:21:09.092302	Бас гитара 4 струны	45000	Москва	Ibanez	Москва	2
\.


--
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_cart (id, person_id, product_id) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 35, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 4, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 7, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--

