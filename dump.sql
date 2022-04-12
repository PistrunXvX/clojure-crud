--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg100+1)

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
-- Name: patient; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    first_name character varying(100),
    second_name character varying(100),
    middle_name character varying(100),
    gender character varying(30),
    birthday_date character varying(100),
    address_name text,
    policy_number character varying(16)
);


ALTER TABLE public.patient OWNER TO admin;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_id_seq OWNER TO admin;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.schema_migrations (
    id bigint NOT NULL,
    applied timestamp without time zone,
    description character varying(1024)
);


ALTER TABLE public.schema_migrations OWNER TO admin;

--
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.patient (id, first_name, second_name, middle_name, gender, birthday_date, address_name, policy_number) FROM stdin;
4	Михаил	Васильев	Артемьевич	male	1940-11-20	Волгоградская область, город Люберцы, шоссе 1905 года, 07	8257969321490147
5	Никита	Смирнов	Александрович	male	2022-02-24	Брянская область, город Подольск, шоссе Ломоносова, 87	3474261494867954
6	Роман	Захаров	Фёдорович	male	1910-05-01	Тульская область, город Озёры, бульвар Ладыгина, 14	6600557613554866
7	Ярослав	Лебедев	Иванович	male	1954-07-26	Ивановская область, город Егорьевск, пр. Бухарестская, 81	9782432082093748
8	Владимир	Левин	Данилович	male	1911-09-11	Самарская область, город Серебряные Пруды, наб. Ленина, 40	9128391672125386
9	Александр	Калашников	Максимович	male	1965-11-14	Тверская область, город Чехов, въезд Гоголя, 40	8258521756641921
10	Даниил	Соболев	Давидович	male	2018-10-10	Курская область, город Дорохово, проезд Ладыгина, 87	4074434820447928
11	Павел	Морозов	Арсентьевич	male	1917-11-29	Курганская область, город Павловский Посад, пр. Ладыгина, 98	2881170760943462
12	Артём	Москвин	Андреевич	male	2022-01-27	Тамбовская область, город Шатура, ул. Гагарина, 20	1269545956933327
13	Владимир	Герасимов	Ярославович	male	1963-07-21	Орловская область, город Ступино, въезд Бухарестская, 34	4429624418013303
14	Святослав	Андреев	Ильич	non-binary	1946-05-18	Липецкая область, город Талдом, въезд Славы, 71	6222516325251179
15	Демид	Сидоров	Артёмович	non-binary	2015-03-28	Белгородская область, город Павловский Посад, пр. Космонавтов, 06	9156772023178454
16	Степан	Баженов	Елисеевич	non-binary	1937-07-12	Тульская область, город Озёры, спуск Домодедовская, 57	2782788366668195
17	Надежда	Сорокина	Арсентьевна	non-binary	1931-06-24	Ярославская область, город Мытищи, пер. Будапештсткая, 05	4633946529831115
18	Артур	Черкасов	Ильич	non-binary	2021-10-14	Омская область, город Балашиха, бульвар Косиора, 50	5445824514186685
19	Юлия	Богданова	Ярославовна	female	1968-11-14	Омская область, город Сергиев Посад, наб. Ломоносова, 74	5829282570170779
20	Мария	Киреева	Александровна	female	1997-01-22	Белгородская область, город Егорьевск, пл. Гоголя, 63	4457691883342265
21	Анна	Галкина	Адамовна	female	2018-12-13	Ивановская область, город Волоколамск, спуск Косиора, 92	3287446262354132
22	Диана	Соловьева	Михайловна	female	1909-09-04	Сахалинская область, город Домодедово, пл. Домодедовская, 72	8779142562701449
23	Мария	Павлова	Германовна	female	1995-05-26	Тверская область, город Наро-Фоминск, пер. Гагарина, 51	3170456968025243
24	София	Сафонова	Глебовна	female	2000-01-03	Костромская область, город Егорьевск, проезд Бухарестская, 44	6630504939514031
25	Вероника	Чернова	Львовна	female	1950-07-23	Ленинградская область, город Луховицы, пр. Ладыгина, 27	8208260168846298
26	Вероника	Исаева	Тимуровна	female	1910-01-17	Брянская область, город Коломна, ул. Домодедовская, 27	1197776830935337
27	Марьям	Зубкова	Святославовна	female	1961-12-27	Самарская область, город Ногинск, въезд Домодедовская, 79	3757215118740478
28	Юлия	Кондрашова	Константиновна	female	1969-05-30	Ульяновская область, город Мытищи, пр. Ладыгина, 11	5312036483179974
29	Ксения	Малышева	Семёновна	female	1932-04-08	Курская область, город Серебряные Пруды, пл. Балканская, 97	4262058788832834
30	Кира	Исаева	Юрьевна	female	1973-09-25	Читинская область, город Серпухов, пер. Балканская, 68	6780181631156756
31	София	Калинина	Фёдоровна	female	1976-03-27	Ленинградская область, город Можайск, пер. Ленина, 81	5456744116618449
32	Юлия	Сафонова	Николаевна	female	2946-03-26	Пензенская область, город Озёры, шоссе Домодедовская, 75	7575187274734251
33	Варвара	Мартынова	Марсельевна	female	1978-05-23	Оренбургская область, город Раменское, спуск Косиора, 95	4785516186211494
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.schema_migrations (id, applied, description) FROM stdin;
20220408200222	2022-04-11 17:09:21.697	create-patient-table
\.


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.patient_id_seq', 33, true);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_id_key UNIQUE (id);


--
-- PostgreSQL database dump complete
--

