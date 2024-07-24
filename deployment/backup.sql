--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: CannotConnectWarnings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CannotConnectWarnings" (
    "Id" uuid NOT NULL,
    "StallId" uuid,
    "SensorId" uuid NOT NULL,
    "MeterId" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL
);


ALTER TABLE public."CannotConnectWarnings" OWNER TO postgres;

--
-- Name: GasMeters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GasMeters" (
    "Id" uuid NOT NULL,
    "StallId" uuid,
    "StallCode" character varying(40),
    "SensorId" uuid NOT NULL,
    "SensorCode" character varying(40) NOT NULL,
    "MeterId" uuid NOT NULL,
    "MeterCode" character varying(40) NOT NULL,
    "Value" double precision NOT NULL,
    "Raw" double precision NOT NULL,
    "Pre" double precision NOT NULL,
    "Error" text NOT NULL,
    "Rate" character varying(40) NOT NULL,
    "FromTimestamp" timestamp with time zone NOT NULL,
    "ToTimestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public."GasMeters" OWNER TO postgres;

--
-- Name: MeterErrors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MeterErrors" (
    "Id" uuid NOT NULL,
    "Topic" character varying(100),
    "StallId" uuid,
    "SensorId" uuid,
    "MeterId" uuid,
    "CreatedDate" timestamp with time zone NOT NULL,
    "Payload" character varying(200),
    "Reason" character varying(100)
);


ALTER TABLE public."MeterErrors" OWNER TO postgres;

--
-- Name: Meters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Meters" (
    "Id" uuid NOT NULL,
    "MeterCode" character varying(40) NOT NULL,
    "MeterType" character varying(40) NOT NULL,
    "IsActive" boolean NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL
);


ALTER TABLE public."Meters" OWNER TO postgres;

--
-- Name: NoIncomingMessageWarnings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NoIncomingMessageWarnings" (
    "Id" uuid NOT NULL,
    "StallId" uuid,
    "SensorId" uuid NOT NULL,
    "MeterId" uuid NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL
);


ALTER TABLE public."NoIncomingMessageWarnings" OWNER TO postgres;

--
-- Name: Sensors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sensors" (
    "Id" uuid NOT NULL,
    "SensorCode" character varying(40) NOT NULL,
    "SensorName" character varying(300) NOT NULL,
    "IsActive" boolean NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "StallId" uuid,
    "MeterId" uuid,
    "IpAddress" character varying(100) NOT NULL
);


ALTER TABLE public."Sensors" OWNER TO postgres;

--
-- Name: Settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Settings" (
    "InvoicePublishDay" integer NOT NULL,
    "WaterUnitPrice" double precision NOT NULL,
    "GasUnitPrice" double precision NOT NULL,
    "MQTTIP" character varying(15) DEFAULT ''::character varying NOT NULL,
    "SensorIPTemplate" character varying(15) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public."Settings" OWNER TO postgres;

--
-- Name: StallGasInvoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StallGasInvoices" (
    "Id" uuid NOT NULL,
    "StallId" uuid NOT NULL,
    "MeterId" uuid NOT NULL,
    "InvoiceCode" character varying(100),
    "Quantity" double precision NOT NULL,
    "Payment" double precision NOT NULL,
    "StartDate" timestamp with time zone NOT NULL,
    "EndDate" timestamp with time zone NOT NULL,
    "StartValue" double precision NOT NULL,
    "EndValue" double precision NOT NULL,
    "Comments" character varying(300),
    "IsPrinted" boolean NOT NULL,
    "IsPaid" boolean NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL
);


ALTER TABLE public."StallGasInvoices" OWNER TO postgres;

--
-- Name: StallWaterInvoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StallWaterInvoices" (
    "Id" uuid NOT NULL,
    "StallId" uuid NOT NULL,
    "MeterId" uuid NOT NULL,
    "InvoiceCode" character varying(100),
    "Quantity" double precision NOT NULL,
    "Payment" double precision NOT NULL,
    "StartDate" timestamp with time zone NOT NULL,
    "EndDate" timestamp with time zone NOT NULL,
    "StartValue" double precision NOT NULL,
    "EndValue" double precision NOT NULL,
    "Comments" character varying(300),
    "IsPrinted" boolean NOT NULL,
    "IsPaid" boolean NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL
);


ALTER TABLE public."StallWaterInvoices" OWNER TO postgres;

--
-- Name: Stalls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Stalls" (
    "Id" uuid NOT NULL,
    "StallCode" character varying(40) NOT NULL,
    "StallName" character varying(300) NOT NULL,
    "StallFloor" character varying(40),
    "StallLot" character varying(40),
    "StallInfo" character varying(300),
    "IsActive" boolean NOT NULL,
    "CreatedDate" timestamp with time zone NOT NULL,
    "InvoicePublishDay" integer NOT NULL
);


ALTER TABLE public."Stalls" OWNER TO postgres;

--
-- Name: WaterMeters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WaterMeters" (
    "Id" uuid NOT NULL,
    "StallId" uuid,
    "StallCode" character varying(40),
    "SensorId" uuid NOT NULL,
    "SensorCode" character varying(40) NOT NULL,
    "MeterId" uuid NOT NULL,
    "MeterCode" character varying(40) NOT NULL,
    "Value" double precision NOT NULL,
    "Raw" double precision NOT NULL,
    "Pre" double precision NOT NULL,
    "Error" text,
    "Rate" character varying(40),
    "FromTimestamp" timestamp with time zone NOT NULL,
    "ToTimestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public."WaterMeters" OWNER TO postgres;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- Data for Name: CannotConnectWarnings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CannotConnectWarnings" ("Id", "StallId", "SensorId", "MeterId", "CreatedDate") FROM stdin;
17922061-11ea-4e01-aff1-bfaee545caa2	\N	404c64d6-9759-42aa-baaa-c995219aaaae	a935f87a-156d-44e7-8d23-fb7461103ea3	2024-07-17 15:15:50.530652+00
68cbdad9-fad1-4c7f-bc0c-1715ca73d811	\N	cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	30774349-ddf8-2528-c7cb-a006425d756b	2024-07-17 15:15:50.530652+00
6f96716d-20c1-4e55-80c2-d8f183614026	\N	adb3dca1-d698-69c4-69a4-9296381eb19d	b40e63d8-f7f0-4cb3-8762-bd5981ca9175	2024-07-17 15:15:50.530652+00
a6109795-d464-40c1-9b21-67e60293dd90	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-17 15:15:50.530652+00
004c413e-ebff-4bfc-bf62-1698741fc4dd	\N	adb3dca1-d698-69c4-69a4-9296381eb19d	b40e63d8-f7f0-4cb3-8762-bd5981ca9175	2024-07-17 15:16:02.668779+00
567a11a7-0fd4-4286-bf08-42a6af65a223	\N	cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	30774349-ddf8-2528-c7cb-a006425d756b	2024-07-17 15:16:02.668779+00
ee85404e-2384-4eb9-b417-f74001cd8396	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-17 15:16:02.668779+00
f87593b2-70c0-4460-8aa7-9c564ac9ba84	\N	404c64d6-9759-42aa-baaa-c995219aaaae	a935f87a-156d-44e7-8d23-fb7461103ea3	2024-07-17 15:16:02.668779+00
3d370c8d-ed91-4c83-b147-c92ac308b654	\N	404c64d6-9759-42aa-baaa-c995219aaaae	a935f87a-156d-44e7-8d23-fb7461103ea3	2024-07-17 15:16:14.68236+00
6611f4ac-8014-4b9d-b3d3-3a6c585a41e3	\N	adb3dca1-d698-69c4-69a4-9296381eb19d	b40e63d8-f7f0-4cb3-8762-bd5981ca9175	2024-07-17 15:16:14.68236+00
b90c6f58-5871-487a-af0d-620f74dcd7cf	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-17 15:16:14.68236+00
f4beecdd-4354-4f28-8ecc-432ed0b5ea26	\N	cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	30774349-ddf8-2528-c7cb-a006425d756b	2024-07-17 15:16:14.68236+00
\.


--
-- Data for Name: GasMeters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GasMeters" ("Id", "StallId", "StallCode", "SensorId", "SensorCode", "MeterId", "MeterCode", "Value", "Raw", "Pre", "Error", "Rate", "FromTimestamp", "ToTimestamp") FROM stdin;
cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	\N	\N	cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	sensor4	30774349-ddf8-2528-c7cb-a006425d756b	meter4	5	1	2	no error	0.1	2024-07-14 17:00:00+00	2024-07-14 17:00:00+00
\.


--
-- Data for Name: MeterErrors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MeterErrors" ("Id", "Topic", "StallId", "SensorId", "MeterId", "CreatedDate", "Payload", "Reason") FROM stdin;
f4f7fd84-dbb8-4b1e-bea8-60b2b158f761	water/sensor1/main/json	\N	\N	\N	2024-07-14 12:13:19.061988+00	{\n    "value": "00000.3",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2000-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExist
bb1bd303-55bc-4f44-9cef-8302c62737e2	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	\N	2024-07-14 14:00:56.943838+00	{\n    "value": "00000.3",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2000-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
67352f03-6b56-48a5-9229-8e089b233322	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	\N	2024-07-14 14:06:28.237564+00	{\n    "value": "00000.3",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error 1",\n    "rate": "0.2",\n    "timestamp": "2000-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
c0644e4e-b42c-4e63-ab9f-92e19042d79f	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:10:48.220514+00	{\n    "value": "00000.3",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error 1",\n    "rate": "0.2",\n    "timestamp": "2000-12-14T10:46:16+0700"\n  }	SensorMessageHasError
52b27ce5-d5b1-428b-87c0-146a387a084a	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:14:53.728419+00	{\n    "value": "00000.3",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2000-12-14T10:46:16+0700"\n  }	SensorMessageHasError
6838198b-23f9-4f4c-8fdc-7e06074e56c3	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:19:24.498318+00	{\n    "value": "00000.3",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	MessageValueIsNotCorrect
13787e79-4f70-4135-b8a4-b9a82d505b6c	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:26:08.524569+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
b5b8c9bc-db61-487a-b601-14f82573b0e4	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:28:22.941475+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
544c1961-b23b-44dc-88bc-cb714aa08d51	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:29:09.453291+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
806b5ce0-364f-469c-bae1-9c1078074c19	water/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:30:06.700188+00	{\n    "value": "00000.5",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
ca3f92a0-d1ee-4751-8e3c-d39f9666d19c	water/sensor1/main/json	001b653d-a477-4ccc-a6d6-109b4ef15e41	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 14:36:47.245259+00	{\n    "value": "00000.5",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
e55a7543-e727-4604-9565-b4b5529d2e3c	gas/sensor1/main/json	001b653d-a477-4ccc-a6d6-109b4ef15e41	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 15:12:04.942436+00	{\n    "value": "00000.1",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	MessageValueIsNotCorrect
bf0907b4-d2bf-43f3-8900-7b0323f5f20e	gas/sensor1/main/json	001b653d-a477-4ccc-a6d6-109b4ef15e41	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 15:12:27.48233+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error 1",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorMessageHasError-HasError
31f8b8c6-56cb-460b-89ea-61738e98747d	gas/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 15:14:14.62426+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error 2",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorMessageHasError-HasError
286e3392-fd0b-4f70-b6a3-bb79fac157fc	gas/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	cfb6863c-f301-497a-bff5-e49b8adf8467	2024-07-14 15:14:41.142319+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
9f04c321-06d8-48b5-8c8c-99134c216abe	gas/sensor1/main/json	\N	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	\N	2024-07-14 15:15:08.41231+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
6e98eb03-4477-427d-9f9d-6ef3ac2291c7	gas/sensor2/main/json	\N	\N	\N	2024-07-14 15:15:34.261664+00	{\n    "value": "00000.4",\n    "raw": "00000.2",\n    "pre": "00000.2",\n    "error": "no error",\n    "rate": "0.2",\n    "timestamp": "2011-12-14T10:46:16+0700"\n  }	SensorOrMeterDoesNotExistOrActive
\.


--
-- Data for Name: Meters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Meters" ("Id", "MeterCode", "MeterType", "IsActive", "CreatedDate") FROM stdin;
cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	water	t	2024-07-14 14:10:09.743271+00
b40e63d8-f7f0-4cb3-8762-bd5981ca9175	meter2	gas	t	2024-07-15 07:50:40.0776+00
a935f87a-156d-44e7-8d23-fb7461103ea3	meter3	water	t	2024-07-15 07:50:57.737738+00
30774349-ddf8-2528-c7cb-a006425d756b	meter4	gas	t	2024-07-14 12:16:36.395+00
\.


--
-- Data for Name: NoIncomingMessageWarnings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NoIncomingMessageWarnings" ("Id", "StallId", "SensorId", "MeterId", "CreatedDate") FROM stdin;
042d19a3-73a5-459d-8755-4600d044bad4	\N	cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	30774349-ddf8-2528-c7cb-a006425d756b	2024-07-17 14:10:00.615663+00
7f0baea0-707a-4b3a-baa9-b80e85a04214	\N	adb3dca1-d698-69c4-69a4-9296381eb19d	b40e63d8-f7f0-4cb3-8762-bd5981ca9175	2024-07-17 14:10:00.615663+00
d6784f10-925f-4ad7-b6f1-678c9fff5b64	\N	404c64d6-9759-42aa-baaa-c995219aaaae	a935f87a-156d-44e7-8d23-fb7461103ea3	2024-07-17 14:10:00.615663+00
92ef7a50-6100-405c-85c8-46d2fbc37880	\N	adb3dca1-d698-69c4-69a4-9296381eb19d	b40e63d8-f7f0-4cb3-8762-bd5981ca9175	2024-07-17 14:11:00.03359+00
9de88953-67a3-4061-9fb5-d1114578b225	\N	404c64d6-9759-42aa-baaa-c995219aaaae	a935f87a-156d-44e7-8d23-fb7461103ea3	2024-07-17 14:11:00.03359+00
a82a0d12-8249-45e8-a750-bb1f3ba4e601	\N	cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	30774349-ddf8-2528-c7cb-a006425d756b	2024-07-17 14:11:00.03359+00
39f34bab-f811-4b4e-aee1-014411ca65fb	\N	404c64d6-9759-42aa-baaa-c995219aaaae	a935f87a-156d-44e7-8d23-fb7461103ea3	2024-07-17 14:12:00.02021+00
5f2adc63-56ba-4a61-b49c-d1a206cc5a9a	\N	cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	30774349-ddf8-2528-c7cb-a006425d756b	2024-07-17 14:12:00.02021+00
b912d956-34d5-48a9-a3c7-dcce965306c7	\N	adb3dca1-d698-69c4-69a4-9296381eb19d	b40e63d8-f7f0-4cb3-8762-bd5981ca9175	2024-07-17 14:12:00.02021+00
\.


--
-- Data for Name: Sensors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sensors" ("Id", "SensorCode", "SensorName", "IsActive", "CreatedDate", "StallId", "MeterId", "IpAddress") FROM stdin;
404c64d6-9759-42aa-baaa-c995219aaaae	sensor3	sensor 3	t	2024-07-15 07:53:05.474367+00	\N	a935f87a-156d-44e7-8d23-fb7461103ea3	192.168.1.4
adb3dca1-d698-69c4-69a4-9296381eb19d	sensor2	Sensor 2	t	2024-07-14 12:16:36.395+00	\N	b40e63d8-f7f0-4cb3-8762-bd5981ca9175	192.168.1.2
cfae4c89-c9eb-2e4c-b7e8-56c7b7f7d720	sensor4	Sensor 4	t	2024-07-14 12:16:36.395+00	\N	30774349-ddf8-2528-c7cb-a006425d756b	192.168.1.3
688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	Sensor 1	t	2024-07-14 12:16:36.395538+00	\N	cfb6863c-f301-497a-bff5-e49b8adf8467	192.168.1.5
\.


--
-- Data for Name: Settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Settings" ("InvoicePublishDay", "WaterUnitPrice", "GasUnitPrice", "MQTTIP", "SensorIPTemplate") FROM stdin;
\.


--
-- Data for Name: StallGasInvoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."StallGasInvoices" ("Id", "StallId", "MeterId", "InvoiceCode", "Quantity", "Payment", "StartDate", "EndDate", "StartValue", "EndValue", "Comments", "IsPrinted", "IsPaid", "CreatedDate") FROM stdin;
\.


--
-- Data for Name: StallWaterInvoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."StallWaterInvoices" ("Id", "StallId", "MeterId", "InvoiceCode", "Quantity", "Payment", "StartDate", "EndDate", "StartValue", "EndValue", "Comments", "IsPrinted", "IsPaid", "CreatedDate") FROM stdin;
\.


--
-- Data for Name: Stalls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Stalls" ("Id", "StallCode", "StallName", "StallFloor", "StallLot", "StallInfo", "IsActive", "CreatedDate", "InvoicePublishDay") FROM stdin;
001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	stall 1	\N	\N	\N	t	2024-07-14 14:36:24.108612+00	1
e80baed9-f42c-4c57-ad00-76107af766b0	stall2	Stall 2	\N	\N	\N	f	2024-07-15 07:49:32.210467+00	2
\.


--
-- Data for Name: WaterMeters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WaterMeters" ("Id", "StallId", "StallCode", "SensorId", "SensorCode", "MeterId", "MeterCode", "Value", "Raw", "Pre", "Error", "Rate", "FromTimestamp", "ToTimestamp") FROM stdin;
c26521a5-92a4-4752-8c33-c5e78bce3b20	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.1	1	1	no error	0.5	2024-07-14 17:00:00+00	2024-07-14 17:00:00+00
010049d9-92d9-453d-b4ff-62df3c9badf2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.2	1	1	no error	0.5	2024-07-14 17:01:00+00	2024-07-14 17:02:00+00
348d725e-cac9-4873-ab39-0ed055016ac8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.30000000000000004	1	1	no error	0.5	2024-07-14 17:03:00+00	2024-07-14 17:05:00+00
d002ed10-82bc-4dd5-a046-e5d54864bf7a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.4	1	1	no error	0.5	2024-07-14 17:06:00+00	2024-07-14 17:09:00+00
57d08fea-e260-4119-9978-430c3dc2c496	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.5	1	1	no error	0.5	2024-07-14 17:10:00+00	2024-07-14 17:14:00+00
87873edc-5dcb-402d-9266-5ba0ee956f5c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.6	1	1	no error	0.5	2024-07-14 17:15:00+00	2024-07-14 17:20:00+00
217a1b6a-748d-4355-8978-dcf0c4f51e43	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.7	1	1	no error	0.5	2024-07-14 17:21:00+00	2024-07-14 17:27:00+00
b592898b-c6fe-47f4-b237-6ca3899d943e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.7999999999999999	1	1	no error	0.5	2024-07-14 17:28:00+00	2024-07-14 17:35:00+00
81fa2b9c-50ad-4180-b996-b886d2dc57e0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.8999999999999999	1	1	no error	0.5	2024-07-14 17:36:00+00	2024-07-14 17:44:00+00
8f798d1a-ff82-4dd5-9918-f993d950d2ae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	0.9999999999999999	1	1	no error	0.5	2024-07-14 17:45:00+00	2024-07-14 17:54:00+00
780c3210-0f5c-4d30-9fb7-77dafdf659bd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.0999999999999999	1	1	no error	0.5	2024-07-14 17:55:00+00	2024-07-14 17:55:00+00
dcc6451d-0bb2-497c-bec7-d60fd4a25435	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.2	1	1	no error	0.5	2024-07-14 17:56:00+00	2024-07-14 17:57:00+00
9f105914-5b37-4111-a1f4-c28572e33d9e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.3	1	1	no error	0.5	2024-07-14 17:58:00+00	2024-07-14 18:00:00+00
5a9b7461-b3d1-4fa4-9673-582bcbdad724	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.4000000000000001	1	1	no error	0.5	2024-07-14 18:01:00+00	2024-07-14 18:04:00+00
ca129abc-c151-41cf-831a-588a5ae36fc7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.5000000000000002	1	1	no error	0.5	2024-07-14 18:05:00+00	2024-07-14 18:09:00+00
d15474ad-083f-471d-bae7-c88d4fa7d68e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.6000000000000003	1	1	no error	0.5	2024-07-14 18:10:00+00	2024-07-14 18:15:00+00
589c7b9e-24ef-41bb-8de2-b223eb3e0d57	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.7000000000000004	1	1	no error	0.5	2024-07-14 18:16:00+00	2024-07-14 18:22:00+00
a3d3e736-f976-4692-b6f4-34e756858b14	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.8000000000000005	1	1	no error	0.5	2024-07-14 18:23:00+00	2024-07-14 18:30:00+00
6d4ae85c-5491-41b4-95b4-e62040513d53	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	1.9000000000000006	1	1	no error	0.5	2024-07-14 18:31:00+00	2024-07-14 18:39:00+00
a26dfb3a-16aa-48d2-92a8-d66ab32773ae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.0000000000000004	1	1	no error	0.5	2024-07-14 18:40:00+00	2024-07-14 18:49:00+00
ca178f7e-3fb7-4a85-b285-fd5074c2da62	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.1000000000000005	1	1	no error	0.5	2024-07-14 18:50:00+00	2024-07-14 18:50:00+00
70417f15-4a28-453f-bd24-523a76fcc408	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.2000000000000006	1	1	no error	0.5	2024-07-14 18:51:00+00	2024-07-14 18:52:00+00
219762a7-6dae-419a-b190-05c2d78ee200	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.3000000000000007	1	1	no error	0.5	2024-07-14 18:53:00+00	2024-07-14 18:55:00+00
10c2a397-9dea-46a3-895e-1fe909636bbe	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.400000000000001	1	1	no error	0.5	2024-07-14 18:56:00+00	2024-07-14 18:59:00+00
78c46673-41bd-4c33-9e45-4d8f80bf24b3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.500000000000001	1	1	no error	0.5	2024-07-14 19:00:00+00	2024-07-14 19:04:00+00
b4e04078-6e56-49a9-8480-11457cdc05d6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.600000000000001	1	1	no error	0.5	2024-07-14 19:05:00+00	2024-07-14 19:10:00+00
d45d3906-8b3a-40fd-8225-fa293d2b3c26	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.700000000000001	1	1	no error	0.5	2024-07-14 19:11:00+00	2024-07-14 19:17:00+00
7f220f7d-8220-4848-b491-3e06fae97388	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.800000000000001	1	1	no error	0.5	2024-07-14 19:18:00+00	2024-07-14 19:25:00+00
85e29f89-87a6-4865-8ca0-e4b3473ea94d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	2.9000000000000012	1	1	no error	0.5	2024-07-14 19:26:00+00	2024-07-14 19:34:00+00
76561d00-8171-42a5-8208-6a15ba8812f0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.0000000000000013	1	1	no error	0.5	2024-07-14 19:35:00+00	2024-07-14 19:44:00+00
10b2ef3e-55ec-431e-82e2-3b4dabc565de	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.1000000000000014	1	1	no error	0.5	2024-07-14 19:45:00+00	2024-07-14 19:45:00+00
73cf4864-f582-4101-b096-d01abec719dc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.2000000000000015	1	1	no error	0.5	2024-07-14 19:46:00+00	2024-07-14 19:47:00+00
dc10a0de-e189-45c3-8c66-a0a220eb9383	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.3000000000000016	1	1	no error	0.5	2024-07-14 19:48:00+00	2024-07-14 19:50:00+00
a08706e8-a3ce-4d8f-843e-538e5c93ba53	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.4000000000000017	1	1	no error	0.5	2024-07-14 19:51:00+00	2024-07-14 19:54:00+00
d0d00240-c5d0-4a78-a34c-712d2b2a03a8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.5000000000000018	1	1	no error	0.5	2024-07-14 19:55:00+00	2024-07-14 19:59:00+00
52d24bc2-bb7c-4995-a398-c4394f06f72e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.600000000000002	1	1	no error	0.5	2024-07-14 20:00:00+00	2024-07-14 20:05:00+00
01a69ec9-75c2-498a-a065-4c7a07a6f209	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.700000000000002	1	1	no error	0.5	2024-07-14 20:06:00+00	2024-07-14 20:12:00+00
7f2c8a18-4bf2-4f31-87cf-b9eb5d3cf7ea	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.800000000000002	1	1	no error	0.5	2024-07-14 20:13:00+00	2024-07-14 20:20:00+00
3e46c159-d212-4251-b690-c46e7d61dea5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	3.900000000000002	1	1	no error	0.5	2024-07-14 20:21:00+00	2024-07-14 20:29:00+00
1c2e8785-05dc-47d1-bd74-89236617f295	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.000000000000002	1	1	no error	0.5	2024-07-14 20:30:00+00	2024-07-14 20:39:00+00
ed50d98a-3b52-4619-94db-7fc50ba6f697	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.100000000000001	1	1	no error	0.5	2024-07-14 20:40:00+00	2024-07-14 20:40:00+00
b351fc9f-511a-4a3d-8422-e61ccf2badf5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.200000000000001	1	1	no error	0.5	2024-07-14 20:41:00+00	2024-07-14 20:42:00+00
3b252876-24e4-46c7-8366-29938933634e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.300000000000001	1	1	no error	0.5	2024-07-14 20:43:00+00	2024-07-14 20:45:00+00
ea33b0a1-364a-4cf5-ad67-31fcae8bb727	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.4	1	1	no error	0.5	2024-07-14 20:46:00+00	2024-07-14 20:49:00+00
b0b9f323-af5b-4000-9f9e-d86c01d1985a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.5	1	1	no error	0.5	2024-07-14 20:50:00+00	2024-07-14 20:54:00+00
fff1e4e4-6245-4aff-abc0-2275d1b7eb68	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.6	1	1	no error	0.5	2024-07-14 20:55:00+00	2024-07-14 21:00:00+00
79683486-85dd-493b-9ca1-6f9ae9a8a635	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.699999999999999	1	1	no error	0.5	2024-07-14 21:01:00+00	2024-07-14 21:07:00+00
e0300c82-47ef-4789-b8b4-929255fca7ce	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.799999999999999	1	1	no error	0.5	2024-07-14 21:08:00+00	2024-07-14 21:15:00+00
30c16491-2910-4f67-ad0f-2db81a0fc7da	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.899999999999999	1	1	no error	0.5	2024-07-14 21:16:00+00	2024-07-14 21:24:00+00
b3240f43-3385-4db2-a7e0-b8f520b675f0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	4.999999999999998	1	1	no error	0.5	2024-07-14 21:25:00+00	2024-07-14 21:34:00+00
ec7f659b-ee2f-4c76-a953-84b0299b0032	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.099999999999998	1	1	no error	0.5	2024-07-14 21:35:00+00	2024-07-14 21:35:00+00
18391a5c-5f74-4e7a-b958-7ee6690f2b95	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.1999999999999975	1	1	no error	0.5	2024-07-14 21:36:00+00	2024-07-14 21:37:00+00
67da2c5b-d0ba-4478-9d6e-8ada68e92208	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.299999999999997	1	1	no error	0.5	2024-07-14 21:38:00+00	2024-07-14 21:40:00+00
12481fa3-c998-41cc-9557-d29dd8772627	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.399999999999997	1	1	no error	0.5	2024-07-14 21:41:00+00	2024-07-14 21:44:00+00
2aa77bda-6f48-49ff-b27a-24b4142a70e0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.4999999999999964	1	1	no error	0.5	2024-07-14 21:45:00+00	2024-07-14 21:49:00+00
d86780cb-cb8f-4327-baee-01679f2403f7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.599999999999996	1	1	no error	0.5	2024-07-14 21:50:00+00	2024-07-14 21:55:00+00
5997227a-4675-4b8b-a775-a7c2a2cba858	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.699999999999996	1	1	no error	0.5	2024-07-14 21:56:00+00	2024-07-14 22:02:00+00
1f7c9aba-24e3-4a7f-b239-e88e3d4e70cd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.799999999999995	1	1	no error	0.5	2024-07-14 22:03:00+00	2024-07-14 22:10:00+00
b954af7f-5b19-471b-8a3a-52673ecba34e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.899999999999995	1	1	no error	0.5	2024-07-14 22:11:00+00	2024-07-14 22:19:00+00
455ecce8-ef0b-44a5-a0cf-c6d886dcd350	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	5.999999999999995	1	1	no error	0.5	2024-07-14 22:20:00+00	2024-07-14 22:29:00+00
2a0f3e0b-4030-4f3f-a5ab-5108f112483c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.099999999999994	1	1	no error	0.5	2024-07-14 22:30:00+00	2024-07-14 22:30:00+00
9f6715e3-c6f6-447e-b760-cb83ae905533	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.199999999999994	1	1	no error	0.5	2024-07-14 22:31:00+00	2024-07-14 22:32:00+00
79d4d9fc-8b81-4abe-bf6e-69dfdb1a4815	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.299999999999994	1	1	no error	0.5	2024-07-14 22:33:00+00	2024-07-14 22:35:00+00
2d191b86-3c12-499c-bfcb-1f4b61e434a1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.399999999999993	1	1	no error	0.5	2024-07-14 22:36:00+00	2024-07-14 22:39:00+00
3b26214c-a968-4a2b-8b5a-2350f2e7abb9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.499999999999993	1	1	no error	0.5	2024-07-14 22:40:00+00	2024-07-14 22:44:00+00
004fe798-32d5-463c-948f-f3e86eddf2d3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.5999999999999925	1	1	no error	0.5	2024-07-14 22:45:00+00	2024-07-14 22:50:00+00
479de7dc-1bc2-4db4-be58-51c50889b814	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.699999999999992	1	1	no error	0.5	2024-07-14 22:51:00+00	2024-07-14 22:57:00+00
0092d0aa-df9f-4bea-b0ce-17a8d69dedbb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.799999999999992	1	1	no error	0.5	2024-07-14 22:58:00+00	2024-07-14 23:05:00+00
81aad73c-fab7-451d-a5b5-197aba9ff793	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.8999999999999915	1	1	no error	0.5	2024-07-14 23:06:00+00	2024-07-14 23:14:00+00
d7a646f0-ba0b-4120-80d9-9ec2c798ebbf	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	6.999999999999991	1	1	no error	0.5	2024-07-14 23:15:00+00	2024-07-14 23:24:00+00
6176a25e-203a-4d0b-bb83-6c167f354817	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.099999999999991	1	1	no error	0.5	2024-07-14 23:25:00+00	2024-07-14 23:25:00+00
8e51cd8f-5e27-428e-ab63-14afffdf9bfd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.19999999999999	1	1	no error	0.5	2024-07-14 23:26:00+00	2024-07-14 23:27:00+00
6fafe5dc-244c-4ff8-bc4b-dff599a317ad	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.29999999999999	1	1	no error	0.5	2024-07-14 23:28:00+00	2024-07-14 23:30:00+00
d1b840d9-cd54-47ca-b57e-3667ee714645	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.39999999999999	1	1	no error	0.5	2024-07-14 23:31:00+00	2024-07-14 23:34:00+00
32240917-899a-4b3d-ad8d-adfdfe507e84	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.499999999999989	1	1	no error	0.5	2024-07-14 23:35:00+00	2024-07-14 23:39:00+00
4cd04bc1-f142-4366-8f8e-e72ae042e2c4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.599999999999989	1	1	no error	0.5	2024-07-14 23:40:00+00	2024-07-14 23:45:00+00
5121fb29-ad12-41eb-aae3-900ed3be6ada	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.699999999999989	1	1	no error	0.5	2024-07-14 23:46:00+00	2024-07-14 23:52:00+00
a03723a7-b661-4f2a-a79a-f22c0f830551	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.799999999999988	1	1	no error	0.5	2024-07-14 23:53:00+00	2024-07-15 00:00:00+00
3a14d5a9-1dfe-4cf7-b962-0b45d8acab15	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.899999999999988	1	1	no error	0.5	2024-07-15 00:01:00+00	2024-07-15 00:09:00+00
431ce4d3-dd0b-4f46-9bf7-6bc2bdc32399	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	7.999999999999988	1	1	no error	0.5	2024-07-15 00:10:00+00	2024-07-15 00:19:00+00
c43dedae-6dc7-470c-9a8f-8347539cf1ba	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.099999999999987	1	1	no error	0.5	2024-07-15 00:20:00+00	2024-07-15 00:20:00+00
338e238d-038f-43e3-bfc5-68b5d6e2889c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.199999999999987	1	1	no error	0.5	2024-07-15 00:21:00+00	2024-07-15 00:22:00+00
1630fb54-4dd8-489d-9295-c3470a7ca60b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.299999999999986	1	1	no error	0.5	2024-07-15 00:23:00+00	2024-07-15 00:25:00+00
a125d35b-32d1-4b93-9a74-da7331b52260	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.399999999999986	1	1	no error	0.5	2024-07-15 00:26:00+00	2024-07-15 00:29:00+00
5dbe22bc-261f-48fe-900b-f1911a74f373	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.499999999999986	1	1	no error	0.5	2024-07-15 00:30:00+00	2024-07-15 00:34:00+00
de0f4416-9ef6-4054-8967-ebf702a26bfb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.599999999999985	1	1	no error	0.5	2024-07-15 00:35:00+00	2024-07-15 00:40:00+00
1aa0ef2d-0d06-4470-90c0-d172b708bdd5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.699999999999985	1	1	no error	0.5	2024-07-15 00:41:00+00	2024-07-15 00:47:00+00
055cbdc6-fae0-44ca-9131-c6574e2fec91	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.799999999999985	1	1	no error	0.5	2024-07-15 00:48:00+00	2024-07-15 00:55:00+00
0eae85d0-d2dc-450d-8946-e15978923909	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.899999999999984	1	1	no error	0.5	2024-07-15 00:56:00+00	2024-07-15 01:04:00+00
baadefde-bfe0-4b20-8778-e0a6485ef7fa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	8.999999999999984	1	1	no error	0.5	2024-07-15 01:05:00+00	2024-07-15 01:14:00+00
c07c1dff-1ead-4b49-aef8-9e87c60af4f7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.099999999999984	1	1	no error	0.5	2024-07-15 01:15:00+00	2024-07-15 01:15:00+00
254df3c0-ec71-499b-85c4-a1067c78c697	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.199999999999983	1	1	no error	0.5	2024-07-15 01:16:00+00	2024-07-15 01:17:00+00
8f9b8c4d-e6a4-476a-8eab-31b61d523be0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.299999999999983	1	1	no error	0.5	2024-07-15 01:18:00+00	2024-07-15 01:20:00+00
875500ed-a1a0-44fb-b0ee-40b59558e913	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.399999999999983	1	1	no error	0.5	2024-07-15 01:21:00+00	2024-07-15 01:24:00+00
23262f1a-33f6-4fe2-9734-4f28e671a336	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.499999999999982	1	1	no error	0.5	2024-07-15 01:25:00+00	2024-07-15 01:29:00+00
d31df9f3-79da-4318-8546-ae1493c1cc5a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.599999999999982	1	1	no error	0.5	2024-07-15 01:30:00+00	2024-07-15 01:35:00+00
de7abc98-efc7-4682-9c57-d6dcd9b0f73f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.699999999999982	1	1	no error	0.5	2024-07-15 01:36:00+00	2024-07-15 01:42:00+00
8fe7e517-2b5d-45dc-9272-2089897ebdf3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.799999999999981	1	1	no error	0.5	2024-07-15 01:43:00+00	2024-07-15 01:50:00+00
cbe8b1f9-fc5b-466a-80e3-bee66ad20380	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.89999999999998	1	1	no error	0.5	2024-07-15 01:51:00+00	2024-07-15 01:59:00+00
85e2dffe-8c73-4149-82d2-9eee029d1d0f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	9.99999999999998	1	1	no error	0.5	2024-07-15 02:00:00+00	2024-07-15 02:09:00+00
214046bb-6b3f-4928-8f41-589c7f1b006f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.09999999999998	1	1	no error	0.5	2024-07-15 02:10:00+00	2024-07-15 02:10:00+00
0e1fe324-c2df-4791-8213-48f5e2ed1532	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.19999999999998	1	1	no error	0.5	2024-07-15 02:11:00+00	2024-07-15 02:12:00+00
dce0f54b-7eff-4219-a491-97fff2fbd36d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.29999999999998	1	1	no error	0.5	2024-07-15 02:13:00+00	2024-07-15 02:15:00+00
33d184d3-55cc-4f85-aee2-c0c9ac9b87d4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.399999999999979	1	1	no error	0.5	2024-07-15 02:16:00+00	2024-07-15 02:19:00+00
e454b9b2-7f1c-437e-ad9c-5f902d77ba90	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.499999999999979	1	1	no error	0.5	2024-07-15 02:20:00+00	2024-07-15 02:24:00+00
15ddcbb8-d397-475f-918f-4e6f1c72d82f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.599999999999978	1	1	no error	0.5	2024-07-15 02:25:00+00	2024-07-15 02:30:00+00
a0898923-e195-461c-97f0-0e2eb2b02573	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.699999999999978	1	1	no error	0.5	2024-07-15 02:31:00+00	2024-07-15 02:37:00+00
28aa58db-036f-42d6-8e41-cee954d05237	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.799999999999978	1	1	no error	0.5	2024-07-15 02:38:00+00	2024-07-15 02:45:00+00
5fe87219-79ba-4cd0-9341-bdf7740d1266	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.899999999999977	1	1	no error	0.5	2024-07-15 02:46:00+00	2024-07-15 02:54:00+00
d27bf67f-7def-4a97-9c7d-bc5f9120c877	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	10.999999999999977	1	1	no error	0.5	2024-07-15 02:55:00+00	2024-07-15 03:04:00+00
7bb73a19-dfea-4836-847a-061fe1bda87e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.099999999999977	1	1	no error	0.5	2024-07-15 03:05:00+00	2024-07-15 03:05:00+00
c777c8ef-e07e-4293-a001-758b5fe55513	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.199999999999976	1	1	no error	0.5	2024-07-15 03:06:00+00	2024-07-15 03:07:00+00
c4f94006-2196-4fb5-8261-a28cd6825602	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.299999999999976	1	1	no error	0.5	2024-07-15 03:08:00+00	2024-07-15 03:10:00+00
49f1c5d1-6a1e-4ece-ad70-5308778c7629	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.399999999999975	1	1	no error	0.5	2024-07-15 03:11:00+00	2024-07-15 03:14:00+00
a130c950-9bb3-494f-bbbd-e68e068f73dd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.499999999999975	1	1	no error	0.5	2024-07-15 03:15:00+00	2024-07-15 03:19:00+00
bb1f6b67-e743-4b2a-a458-2756c65e77cf	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.599999999999975	1	1	no error	0.5	2024-07-15 03:20:00+00	2024-07-15 03:25:00+00
66ec0a61-66f8-4941-aca6-2fb0bc5d1f06	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.699999999999974	1	1	no error	0.5	2024-07-15 03:26:00+00	2024-07-15 03:32:00+00
810e5b01-7b62-4214-9772-c6945f001e6c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.799999999999974	1	1	no error	0.5	2024-07-15 03:33:00+00	2024-07-15 03:40:00+00
f0d5d444-b122-46db-a479-74d82e5a6f78	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.899999999999974	1	1	no error	0.5	2024-07-15 03:41:00+00	2024-07-15 03:49:00+00
2ca65d5c-c0b3-4c6e-9495-a771df010584	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	11.999999999999973	1	1	no error	0.5	2024-07-15 03:50:00+00	2024-07-15 03:59:00+00
37aea1a3-7d7b-4631-a070-a5d74aa22d8e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.099999999999973	1	1	no error	0.5	2024-07-15 04:00:00+00	2024-07-15 04:00:00+00
18e2d297-2b98-4ccc-bc7d-8e2d52f1810f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.199999999999973	1	1	no error	0.5	2024-07-15 04:01:00+00	2024-07-15 04:02:00+00
8f0928b6-5f95-4577-82c1-13f42bbbac6f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.299999999999972	1	1	no error	0.5	2024-07-15 04:03:00+00	2024-07-15 04:05:00+00
b88044c4-ed08-4c81-acec-a6d9960a3105	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.399999999999972	1	1	no error	0.5	2024-07-15 04:06:00+00	2024-07-15 04:09:00+00
25baf302-3353-46b2-9647-6fa4b5ab3690	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.499999999999972	1	1	no error	0.5	2024-07-15 04:10:00+00	2024-07-15 04:14:00+00
a182582a-54e2-497d-892c-993ea82ea9bc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.599999999999971	1	1	no error	0.5	2024-07-15 04:15:00+00	2024-07-15 04:20:00+00
9715b632-7702-43c4-bae7-515dff57e92a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.69999999999997	1	1	no error	0.5	2024-07-15 04:21:00+00	2024-07-15 04:27:00+00
ee73c326-6cf9-46fe-a79e-42489563193f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.79999999999997	1	1	no error	0.5	2024-07-15 04:28:00+00	2024-07-15 04:35:00+00
1df7bc3f-6143-4501-99bf-8af6946475f2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.89999999999997	1	1	no error	0.5	2024-07-15 04:36:00+00	2024-07-15 04:44:00+00
97038474-3243-4dc0-9d0b-ad5d319a9c22	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	12.99999999999997	1	1	no error	0.5	2024-07-15 04:45:00+00	2024-07-15 04:54:00+00
d952bb9d-4f5b-45b1-802c-be615a5b2a42	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.09999999999997	1	1	no error	0.5	2024-07-15 04:55:00+00	2024-07-15 04:55:00+00
1e767f32-195f-4cd7-907d-a44d4b075e22	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.199999999999969	1	1	no error	0.5	2024-07-15 04:56:00+00	2024-07-15 04:57:00+00
2ca25173-c9c6-4a94-87cb-4dfdb85d97e8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.299999999999969	1	1	no error	0.5	2024-07-15 04:58:00+00	2024-07-15 05:00:00+00
c53570f7-f129-4867-b3b8-dcc42972bbf2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.399999999999968	1	1	no error	0.5	2024-07-15 05:01:00+00	2024-07-15 05:04:00+00
c1a80acd-05e9-49f9-9133-4cfc5728854d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.499999999999968	1	1	no error	0.5	2024-07-15 05:05:00+00	2024-07-15 05:09:00+00
61d415d5-3778-4793-813d-b0acfa6b2d43	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.599999999999968	1	1	no error	0.5	2024-07-15 05:10:00+00	2024-07-15 05:15:00+00
cd941d70-f9ed-416e-b4ce-41aab439adf9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.699999999999967	1	1	no error	0.5	2024-07-15 05:16:00+00	2024-07-15 05:22:00+00
a0b2dc38-9a15-48cc-8177-d575643f0183	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.799999999999967	1	1	no error	0.5	2024-07-15 05:23:00+00	2024-07-15 05:30:00+00
77daeff1-d63d-4847-99a5-c025b091cfc7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.899999999999967	1	1	no error	0.5	2024-07-15 05:31:00+00	2024-07-15 05:39:00+00
dc74117f-cb00-4e41-b035-a8c3263b3ebc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	13.999999999999966	1	1	no error	0.5	2024-07-15 05:40:00+00	2024-07-15 05:49:00+00
3774db72-18f5-4404-b21a-ec8141ecd8d5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.099999999999966	1	1	no error	0.5	2024-07-15 05:50:00+00	2024-07-15 05:50:00+00
5631d948-e6f5-43a4-af3e-7c021ced93a2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.199999999999966	1	1	no error	0.5	2024-07-15 05:51:00+00	2024-07-15 05:52:00+00
bfc1d14e-1edb-45ad-83a9-e6313dcab16e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.299999999999965	1	1	no error	0.5	2024-07-15 05:53:00+00	2024-07-15 05:55:00+00
b2c67e59-a311-4623-9af7-c78e59f07515	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.399999999999965	1	1	no error	0.5	2024-07-15 05:56:00+00	2024-07-15 05:59:00+00
e50b1c9a-0464-4992-a22b-3cef1a2a4e24	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.499999999999964	1	1	no error	0.5	2024-07-15 06:00:00+00	2024-07-15 06:04:00+00
cb3be93a-bd20-4a22-b213-a2c26e55db71	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.599999999999964	1	1	no error	0.5	2024-07-15 06:05:00+00	2024-07-15 06:10:00+00
85de9ae6-ed5f-4054-9d77-70029d1fcedb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.699999999999964	1	1	no error	0.5	2024-07-15 06:11:00+00	2024-07-15 06:17:00+00
1d146ede-828f-4093-84b2-c5d4d644f582	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.799999999999963	1	1	no error	0.5	2024-07-15 06:18:00+00	2024-07-15 06:25:00+00
0308f0ee-91ac-4ebd-a0b2-1e4a5adc1b6e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.899999999999963	1	1	no error	0.5	2024-07-15 06:26:00+00	2024-07-15 06:34:00+00
f828a8f1-96a6-40a8-9054-f35e8e415bb0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	14.999999999999963	1	1	no error	0.5	2024-07-15 06:35:00+00	2024-07-15 06:44:00+00
534e658c-08d2-4939-8282-142792441fd7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.099999999999962	1	1	no error	0.5	2024-07-15 06:45:00+00	2024-07-15 06:45:00+00
d2faa61a-ba48-4840-a225-4dc459f75ebb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.199999999999962	1	1	no error	0.5	2024-07-15 06:46:00+00	2024-07-15 06:47:00+00
29f721da-2cb4-455d-bd55-faad313deb19	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.299999999999962	1	1	no error	0.5	2024-07-15 06:48:00+00	2024-07-15 06:50:00+00
176a5c69-39de-4b7f-88bc-7ad2c2558ffe	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.399999999999961	1	1	no error	0.5	2024-07-15 06:51:00+00	2024-07-15 06:54:00+00
abf2de0e-b848-4583-8fe8-56409dae0c63	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.499999999999961	1	1	no error	0.5	2024-07-15 06:55:00+00	2024-07-15 06:59:00+00
2438a8a8-1bd6-4600-af8e-0d804488358e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.59999999999996	1	1	no error	0.5	2024-07-15 07:00:00+00	2024-07-15 07:05:00+00
b854b4c5-1d3d-4ff5-a85c-8dd380d80d3c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.69999999999996	1	1	no error	0.5	2024-07-15 07:06:00+00	2024-07-15 07:12:00+00
b345527f-15e1-4dad-b7e5-79eacaa5ede0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.79999999999996	1	1	no error	0.5	2024-07-15 07:13:00+00	2024-07-15 07:20:00+00
360e9516-e782-4a91-9916-22402ba4cd83	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.89999999999996	1	1	no error	0.5	2024-07-15 07:21:00+00	2024-07-15 07:29:00+00
7425fc55-7c99-4520-9fcc-57dd7aed64f2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	15.99999999999996	1	1	no error	0.5	2024-07-15 07:30:00+00	2024-07-15 07:39:00+00
63133ee7-65e6-4e86-9473-ca11781fd9d1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.09999999999996	1	1	no error	0.5	2024-07-15 07:40:00+00	2024-07-15 07:40:00+00
3dfa7ca4-7f09-45d4-a8b7-402f04ea2d44	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.19999999999996	1	1	no error	0.5	2024-07-15 07:41:00+00	2024-07-15 07:42:00+00
43f04107-1a9c-4a9f-bd0f-f2ada78c77ab	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.29999999999996	1	1	no error	0.5	2024-07-15 07:43:00+00	2024-07-15 07:45:00+00
bd7cc3a4-f4bd-4587-9cd2-3b55a78693e4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.399999999999963	1	1	no error	0.5	2024-07-15 07:46:00+00	2024-07-15 07:49:00+00
8ae28c23-7f42-494b-b561-da11f12fc977	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.499999999999964	1	1	no error	0.5	2024-07-15 07:50:00+00	2024-07-15 07:54:00+00
e1cea249-e327-4ad9-8f89-112f8ab44928	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.599999999999966	1	1	no error	0.5	2024-07-15 07:55:00+00	2024-07-15 08:00:00+00
8aff8d1f-4e92-4cdc-86ae-57cfc642910d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.699999999999967	1	1	no error	0.5	2024-07-15 08:01:00+00	2024-07-15 08:07:00+00
db6b9db9-cdda-4ee9-b0ec-713d74288d87	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.79999999999997	1	1	no error	0.5	2024-07-15 08:08:00+00	2024-07-15 08:15:00+00
c304043b-5353-43d6-b41b-c87acd5a096e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.89999999999997	1	1	no error	0.5	2024-07-15 08:16:00+00	2024-07-15 08:24:00+00
153a0501-627c-4eec-adc0-62828bbced9f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	16.99999999999997	1	1	no error	0.5	2024-07-15 08:25:00+00	2024-07-15 08:34:00+00
c7bbd5bf-390e-446c-8d3f-efabae3d3ae7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.099999999999973	1	1	no error	0.5	2024-07-15 08:35:00+00	2024-07-15 08:35:00+00
7899d166-9b93-4285-b5c6-3986fffaeb20	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.199999999999974	1	1	no error	0.5	2024-07-15 08:36:00+00	2024-07-15 08:37:00+00
243ff576-8553-406a-bbed-56f8f1b37350	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.299999999999976	1	1	no error	0.5	2024-07-15 08:38:00+00	2024-07-15 08:40:00+00
3b642221-eed3-496c-b299-cc71ac1c0077	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.399999999999977	1	1	no error	0.5	2024-07-15 08:41:00+00	2024-07-15 08:44:00+00
2b17f8fe-a55e-48b3-b372-b28b1118425a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.49999999999998	1	1	no error	0.5	2024-07-15 08:45:00+00	2024-07-15 08:49:00+00
bd5e6635-867f-4f7a-89d5-f1ceea38fd69	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.59999999999998	1	1	no error	0.5	2024-07-15 08:50:00+00	2024-07-15 08:55:00+00
1618f498-2b02-46ae-8c6f-5eb127c0f152	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.69999999999998	1	1	no error	0.5	2024-07-15 08:56:00+00	2024-07-15 09:02:00+00
15c29f96-ba8f-4506-86d6-80e4f6b3543f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.799999999999983	1	1	no error	0.5	2024-07-15 09:03:00+00	2024-07-15 09:10:00+00
f5bfd487-7432-4036-b06f-abb9ccae1d11	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.899999999999984	1	1	no error	0.5	2024-07-15 09:11:00+00	2024-07-15 09:19:00+00
d01209f5-98fe-4209-8c47-9c69fce8e025	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	17.999999999999986	1	1	no error	0.5	2024-07-15 09:20:00+00	2024-07-15 09:29:00+00
b7328344-ac79-4691-a012-2c6a3b8e64f3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.099999999999987	1	1	no error	0.5	2024-07-15 09:30:00+00	2024-07-15 09:30:00+00
17d52643-1f97-4166-812b-bf10aed75cd9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.19999999999999	1	1	no error	0.5	2024-07-15 09:31:00+00	2024-07-15 09:32:00+00
2b18fd7e-be19-489c-b02f-9e4a3b4162df	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.29999999999999	1	1	no error	0.5	2024-07-15 09:33:00+00	2024-07-15 09:35:00+00
30fb5ae1-8470-4fc6-9a06-07680d3c35ec	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.39999999999999	1	1	no error	0.5	2024-07-15 09:36:00+00	2024-07-15 09:39:00+00
a0fbe0c4-8b39-4c49-8fe8-2f5ed39d7cf9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.499999999999993	1	1	no error	0.5	2024-07-15 09:40:00+00	2024-07-15 09:44:00+00
c2aacab6-6dd3-4b31-877b-feea3d6c673e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.599999999999994	1	1	no error	0.5	2024-07-15 09:45:00+00	2024-07-15 09:50:00+00
29c993bf-70d6-4b53-8721-62627f9f1e9e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.699999999999996	1	1	no error	0.5	2024-07-15 09:51:00+00	2024-07-15 09:57:00+00
57aff528-cd74-4c2b-9dca-d27554ddadfd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.799999999999997	1	1	no error	0.5	2024-07-15 09:58:00+00	2024-07-15 10:05:00+00
a9019087-513a-491e-8800-68b0670efd24	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	18.9	1	1	no error	0.5	2024-07-15 10:06:00+00	2024-07-15 10:14:00+00
c4e3496d-a767-4de7-bb33-6e88e2592155	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19	1	1	no error	0.5	2024-07-15 10:15:00+00	2024-07-15 10:24:00+00
6293b120-9fd0-4641-a265-956e8640b99c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.1	1	1	no error	0.5	2024-07-15 10:25:00+00	2024-07-15 10:25:00+00
e8bb3a38-1ffa-4de1-836e-a00ae2dccd0c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.200000000000003	1	1	no error	0.5	2024-07-15 10:26:00+00	2024-07-15 10:27:00+00
c788530f-27e1-4aa8-b594-ece7179700df	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.300000000000004	1	1	no error	0.5	2024-07-15 10:28:00+00	2024-07-15 10:30:00+00
47eea21c-b67f-407a-ab3f-81aaa9edfb42	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.400000000000006	1	1	no error	0.5	2024-07-15 10:31:00+00	2024-07-15 10:34:00+00
4c0578cc-48f6-4853-aced-453fdd9ab92c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.500000000000007	1	1	no error	0.5	2024-07-15 10:35:00+00	2024-07-15 10:39:00+00
109e1f19-78fc-485c-8bd1-03cdd2499bb8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.60000000000001	1	1	no error	0.5	2024-07-15 10:40:00+00	2024-07-15 10:45:00+00
25ab255b-a264-4996-89e9-0d632d10b4fa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.70000000000001	1	1	no error	0.5	2024-07-15 10:46:00+00	2024-07-15 10:52:00+00
d7503773-e3ec-49f6-974c-f15cdcc6a189	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.80000000000001	1	1	no error	0.5	2024-07-15 10:53:00+00	2024-07-15 11:00:00+00
acd76ec8-9650-43e5-a6a3-93c2ebcc7d2b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	19.900000000000013	1	1	no error	0.5	2024-07-15 11:01:00+00	2024-07-15 11:09:00+00
e7128ef6-40a7-4301-9f5a-d3706bbc19b3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.000000000000014	1	1	no error	0.5	2024-07-15 11:10:00+00	2024-07-15 11:19:00+00
15106cb2-d41d-400c-b764-f0eab62be22e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.100000000000016	1	1	no error	0.5	2024-07-15 11:20:00+00	2024-07-15 11:20:00+00
a04d8213-048f-45d8-b0df-55946e2328a7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.200000000000017	1	1	no error	0.5	2024-07-15 11:21:00+00	2024-07-15 11:22:00+00
20984bff-f5b9-41de-8338-f3ca94e77943	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.30000000000002	1	1	no error	0.5	2024-07-15 11:23:00+00	2024-07-15 11:25:00+00
3d2062aa-8544-4b70-b188-95527d2088e7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.40000000000002	1	1	no error	0.5	2024-07-15 11:26:00+00	2024-07-15 11:29:00+00
0137e104-9dc3-4a19-888c-478594d6d08c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.50000000000002	1	1	no error	0.5	2024-07-15 11:30:00+00	2024-07-15 11:34:00+00
70af905e-c254-4a98-b63e-7f96720d17a4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.600000000000023	1	1	no error	0.5	2024-07-15 11:35:00+00	2024-07-15 11:40:00+00
b68daa5d-c12f-4a9f-a06e-7f676d327355	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.700000000000024	1	1	no error	0.5	2024-07-15 11:41:00+00	2024-07-15 11:47:00+00
7e2aadc3-b194-410b-a689-74d90b7a39fc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.800000000000026	1	1	no error	0.5	2024-07-15 11:48:00+00	2024-07-15 11:55:00+00
6fead1c1-84f5-41b7-b545-5476a7da0c15	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	20.900000000000027	1	1	no error	0.5	2024-07-15 11:56:00+00	2024-07-15 12:04:00+00
565d176c-7e4e-4043-baa5-fb81003c785e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.00000000000003	1	1	no error	0.5	2024-07-15 12:05:00+00	2024-07-15 12:14:00+00
2ae3e278-97d3-43fb-9801-202b63aede3c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.10000000000003	1	1	no error	0.5	2024-07-15 12:15:00+00	2024-07-15 12:15:00+00
da980f67-4253-4486-b4c5-8c3dfe2e9249	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.20000000000003	1	1	no error	0.5	2024-07-15 12:16:00+00	2024-07-15 12:17:00+00
4ee50860-351b-43c2-ac94-6dacceee05cc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.300000000000033	1	1	no error	0.5	2024-07-15 12:18:00+00	2024-07-15 12:20:00+00
e62d5364-a67e-462d-9cb7-ac23eb4562c7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.400000000000034	1	1	no error	0.5	2024-07-15 12:21:00+00	2024-07-15 12:24:00+00
2d1c3458-8a60-4d7b-848d-e15030d84390	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.500000000000036	1	1	no error	0.5	2024-07-15 12:25:00+00	2024-07-15 12:29:00+00
156b3c84-974f-4c6a-b11b-1eaef932831a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.600000000000037	1	1	no error	0.5	2024-07-15 12:30:00+00	2024-07-15 12:35:00+00
d4cb4ed9-4527-4f6b-9b7e-733b243208bc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.70000000000004	1	1	no error	0.5	2024-07-15 12:36:00+00	2024-07-15 12:42:00+00
08370f16-8fcd-4f9d-8955-1f8255f61efa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.80000000000004	1	1	no error	0.5	2024-07-15 12:43:00+00	2024-07-15 12:50:00+00
c99b53a7-e67f-4085-a98a-e1078e794565	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	21.90000000000004	1	1	no error	0.5	2024-07-15 12:51:00+00	2024-07-15 12:59:00+00
e7303b5a-dc09-4629-a4c5-c30f57aba655	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.000000000000043	1	1	no error	0.5	2024-07-15 13:00:00+00	2024-07-15 13:09:00+00
3c7d90e9-9c64-4490-a501-fbf00a8ff0b6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.100000000000044	1	1	no error	0.5	2024-07-15 13:10:00+00	2024-07-15 13:10:00+00
c4e827a0-28c7-4aff-8e4b-6dd2f78d4508	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.200000000000045	1	1	no error	0.5	2024-07-15 13:11:00+00	2024-07-15 13:12:00+00
7419900a-c16b-4477-8b5d-4fad0fdffffc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.300000000000047	1	1	no error	0.5	2024-07-15 13:13:00+00	2024-07-15 13:15:00+00
9f4f1873-6bcc-4115-9a3e-937c3c43d104	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.40000000000005	1	1	no error	0.5	2024-07-15 13:16:00+00	2024-07-15 13:19:00+00
7edfe5e9-f9d3-49db-9ff2-abb78e7423df	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.50000000000005	1	1	no error	0.5	2024-07-15 13:20:00+00	2024-07-15 13:24:00+00
dfe4ab91-86f6-430f-9cde-9fd53b74cbfb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.60000000000005	1	1	no error	0.5	2024-07-15 13:25:00+00	2024-07-15 13:30:00+00
28a03f11-8164-4cbb-9cfd-c923f0f410b0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.700000000000053	1	1	no error	0.5	2024-07-15 13:31:00+00	2024-07-15 13:37:00+00
fa120947-3ab0-4d91-a8cf-f6e34296346c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.800000000000054	1	1	no error	0.5	2024-07-15 13:38:00+00	2024-07-15 13:45:00+00
ab290e30-4961-4c0d-bd23-4a6c0ee98376	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	22.900000000000055	1	1	no error	0.5	2024-07-15 13:46:00+00	2024-07-15 13:54:00+00
023e1056-6d1a-44c4-a8ef-e7808e67925d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.000000000000057	1	1	no error	0.5	2024-07-15 13:55:00+00	2024-07-15 14:04:00+00
fb581232-03b4-40c4-96a4-57a5c6b59dc3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.10000000000006	1	1	no error	0.5	2024-07-15 14:05:00+00	2024-07-15 14:05:00+00
8ccd24bb-4c6f-4fb7-83ba-8ff6db2378fa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.20000000000006	1	1	no error	0.5	2024-07-15 14:06:00+00	2024-07-15 14:07:00+00
b13149cc-7ff5-4137-890b-0305a664de44	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.30000000000006	1	1	no error	0.5	2024-07-15 14:08:00+00	2024-07-15 14:10:00+00
f93cc0d8-65bc-42ce-83a9-67dae2fdd07e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.400000000000063	1	1	no error	0.5	2024-07-15 14:11:00+00	2024-07-15 14:14:00+00
dfb237ef-35e2-4fa8-842f-366d50cdfc06	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.500000000000064	1	1	no error	0.5	2024-07-15 14:15:00+00	2024-07-15 14:19:00+00
1076bb38-8c54-44ab-8da6-fffeda37048b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.600000000000065	1	1	no error	0.5	2024-07-15 14:20:00+00	2024-07-15 14:25:00+00
6289f82d-6247-4c1d-8b7a-10bd34c3455f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.700000000000067	1	1	no error	0.5	2024-07-15 14:26:00+00	2024-07-15 14:32:00+00
62227f8f-270d-4a9b-9b08-dce2286850a0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.800000000000068	1	1	no error	0.5	2024-07-15 14:33:00+00	2024-07-15 14:40:00+00
b4f86e3a-79bb-47ae-abff-67ed76c33200	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	23.90000000000007	1	1	no error	0.5	2024-07-15 14:41:00+00	2024-07-15 14:49:00+00
f45428d2-a148-443d-8ffe-ce0fa985d46f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.00000000000007	1	1	no error	0.5	2024-07-15 14:50:00+00	2024-07-15 14:59:00+00
2106a1f9-b1be-4e08-907c-3d4900abb4e6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.100000000000072	1	1	no error	0.5	2024-07-15 15:00:00+00	2024-07-15 15:00:00+00
309ec4e5-fcaa-4b8b-bf6b-410c263991f3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.200000000000074	1	1	no error	0.5	2024-07-15 15:01:00+00	2024-07-15 15:02:00+00
1d0c5993-9e99-4a1c-a08a-19a4a75b2789	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.300000000000075	1	1	no error	0.5	2024-07-15 15:03:00+00	2024-07-15 15:05:00+00
e0d91b1d-a272-49d5-81fd-3293c48c3d74	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.400000000000077	1	1	no error	0.5	2024-07-15 15:06:00+00	2024-07-15 15:09:00+00
3145d90c-cb7e-440f-90ff-1853e64e95fd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.500000000000078	1	1	no error	0.5	2024-07-15 15:10:00+00	2024-07-15 15:14:00+00
fc4d5d9c-e55f-4f27-b79e-60333a2b7c7f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.60000000000008	1	1	no error	0.5	2024-07-15 15:15:00+00	2024-07-15 15:20:00+00
c1faf4c2-def0-4824-8782-9b9977018dc0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.70000000000008	1	1	no error	0.5	2024-07-15 15:21:00+00	2024-07-15 15:27:00+00
b527096b-e19f-40b9-927f-eb387451bb79	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.800000000000082	1	1	no error	0.5	2024-07-15 15:28:00+00	2024-07-15 15:35:00+00
d00b8621-d301-4d6e-a193-112fa52cf2eb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	24.900000000000084	1	1	no error	0.5	2024-07-15 15:36:00+00	2024-07-15 15:44:00+00
9cd1ed05-d201-48e6-a44c-99bb25e0f505	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.000000000000085	1	1	no error	0.5	2024-07-15 15:45:00+00	2024-07-15 15:54:00+00
a7d3cd93-2414-4bbf-9e44-664c42dcda79	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.100000000000087	1	1	no error	0.5	2024-07-15 15:55:00+00	2024-07-15 15:55:00+00
28ec624a-b94e-446c-8777-ce39c65ce799	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.200000000000088	1	1	no error	0.5	2024-07-15 15:56:00+00	2024-07-15 15:57:00+00
d75ae3c1-e051-4ac0-bd02-421acc62aa50	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.30000000000009	1	1	no error	0.5	2024-07-15 15:58:00+00	2024-07-15 16:00:00+00
7d40fe11-dd49-41c7-a9c0-d4b820e0834d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.40000000000009	1	1	no error	0.5	2024-07-15 16:01:00+00	2024-07-15 16:04:00+00
c6b6e564-e4ab-41c1-8b67-fabede32cd21	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.500000000000092	1	1	no error	0.5	2024-07-15 16:05:00+00	2024-07-15 16:09:00+00
9780df5a-2540-41be-8070-a860facc588a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.600000000000094	1	1	no error	0.5	2024-07-15 16:10:00+00	2024-07-15 16:15:00+00
a2a696b9-da0b-4943-a3e7-a7d322762017	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.700000000000095	1	1	no error	0.5	2024-07-15 16:16:00+00	2024-07-15 16:22:00+00
2beb1689-1122-4ad3-8184-70739fe1d4e8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.800000000000097	1	1	no error	0.5	2024-07-15 16:23:00+00	2024-07-15 16:30:00+00
acd0e1e7-e662-486a-a76d-b2fd7374dae1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	25.900000000000098	1	1	no error	0.5	2024-07-15 16:31:00+00	2024-07-15 16:39:00+00
68f8b7cd-0135-4286-9858-23b43b2562a3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.0000000000001	1	1	no error	0.5	2024-07-15 16:40:00+00	2024-07-15 16:49:00+00
1468b0ea-9cf8-471a-8ac8-d5001bf163e2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.1000000000001	1	1	no error	0.5	2024-07-15 16:50:00+00	2024-07-15 16:50:00+00
0abf187f-7764-421d-b935-41f3ddd7c313	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.200000000000102	1	1	no error	0.5	2024-07-15 16:51:00+00	2024-07-15 16:52:00+00
85ad6e6d-a9cf-4680-8132-b47b507d761f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.300000000000104	1	1	no error	0.5	2024-07-15 16:53:00+00	2024-07-15 16:55:00+00
9ed4c7bd-96fa-40c3-aa59-580729112ca6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.400000000000105	1	1	no error	0.5	2024-07-15 16:56:00+00	2024-07-15 16:59:00+00
aa73d4cc-7481-44e2-b748-27f8348fae26	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.500000000000107	1	1	no error	0.5	2024-07-15 17:00:00+00	2024-07-15 17:04:00+00
a61cb27d-811a-48f4-8af4-e96112041c30	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.600000000000108	1	1	no error	0.5	2024-07-15 17:05:00+00	2024-07-15 17:10:00+00
473df41c-33d3-4a0f-8ddb-f9c13bc3f198	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.70000000000011	1	1	no error	0.5	2024-07-15 17:11:00+00	2024-07-15 17:17:00+00
d80d9216-5ced-4054-b939-f8077a53a571	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.80000000000011	1	1	no error	0.5	2024-07-15 17:18:00+00	2024-07-15 17:25:00+00
8ac9df11-e5bd-489f-a1d3-db1ecb0ce035	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	26.900000000000112	1	1	no error	0.5	2024-07-15 17:26:00+00	2024-07-15 17:34:00+00
21d83b07-145c-4311-b015-a7b04d0f2b7b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.000000000000114	1	1	no error	0.5	2024-07-15 17:35:00+00	2024-07-15 17:44:00+00
f627359a-60d9-4eaa-b660-7025eb925a63	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.100000000000115	1	1	no error	0.5	2024-07-15 17:45:00+00	2024-07-15 17:45:00+00
fd71811f-8085-47d5-981e-a84b48e2e2ec	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.200000000000117	1	1	no error	0.5	2024-07-15 17:46:00+00	2024-07-15 17:47:00+00
e151bbed-9f81-4325-8351-62a7413a755a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.300000000000118	1	1	no error	0.5	2024-07-15 17:48:00+00	2024-07-15 17:50:00+00
a0e262a8-981e-475a-ae78-bb552feabd46	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.40000000000012	1	1	no error	0.5	2024-07-15 17:51:00+00	2024-07-15 17:54:00+00
870068ad-91a1-4fe0-a4d6-cb12d4f298e7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.50000000000012	1	1	no error	0.5	2024-07-15 17:55:00+00	2024-07-15 17:59:00+00
d4961399-c285-4a1b-a2f6-d28063db0056	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.600000000000122	1	1	no error	0.5	2024-07-15 18:00:00+00	2024-07-15 18:05:00+00
0de176dd-7974-408a-a51f-4353e3e139d5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.700000000000124	1	1	no error	0.5	2024-07-15 18:06:00+00	2024-07-15 18:12:00+00
c12a950d-bdc0-4ba2-9f57-54cedcf1a775	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.800000000000125	1	1	no error	0.5	2024-07-15 18:13:00+00	2024-07-15 18:20:00+00
58f08810-1dbe-41fe-9bfe-176ad9229564	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	27.900000000000126	1	1	no error	0.5	2024-07-15 18:21:00+00	2024-07-15 18:29:00+00
380eacfe-cd60-4fcd-9535-6a5d21588ae1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.000000000000128	1	1	no error	0.5	2024-07-15 18:30:00+00	2024-07-15 18:39:00+00
2103403e-bd51-4ce0-b9c1-6d955fa044fd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.10000000000013	1	1	no error	0.5	2024-07-15 18:40:00+00	2024-07-15 18:40:00+00
db1fd58b-10fe-4dd0-80cc-952cbee0b030	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.20000000000013	1	1	no error	0.5	2024-07-15 18:41:00+00	2024-07-15 18:42:00+00
36eccfc8-69ab-4be2-b0e0-9302a67c6c83	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.300000000000132	1	1	no error	0.5	2024-07-15 18:43:00+00	2024-07-15 18:45:00+00
cddca009-61f6-427f-a878-580258e91003	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.400000000000134	1	1	no error	0.5	2024-07-15 18:46:00+00	2024-07-15 18:49:00+00
d07735e6-f990-4150-a792-af53ba065086	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.500000000000135	1	1	no error	0.5	2024-07-15 18:50:00+00	2024-07-15 18:54:00+00
e3530225-257b-4ef4-91ec-c908467a4632	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.600000000000136	1	1	no error	0.5	2024-07-15 18:55:00+00	2024-07-15 19:00:00+00
d18863b3-8ae0-400d-8200-f0dfa3dfbbce	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.700000000000138	1	1	no error	0.5	2024-07-15 19:01:00+00	2024-07-15 19:07:00+00
38389cff-764c-4d45-bebc-355fd667e081	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.80000000000014	1	1	no error	0.5	2024-07-15 19:08:00+00	2024-07-15 19:15:00+00
577454af-d724-46dc-8eab-7cd16491dafd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	28.90000000000014	1	1	no error	0.5	2024-07-15 19:16:00+00	2024-07-15 19:24:00+00
718dc97a-70f3-41c9-8a4d-c21e9d58e066	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.000000000000142	1	1	no error	0.5	2024-07-15 19:25:00+00	2024-07-15 19:34:00+00
075762d7-1711-4968-8f36-8bc0ed8488ec	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.100000000000144	1	1	no error	0.5	2024-07-15 19:35:00+00	2024-07-15 19:35:00+00
5763b705-7b24-4465-8759-14d8c717165f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.200000000000145	1	1	no error	0.5	2024-07-15 19:36:00+00	2024-07-15 19:37:00+00
04431304-2801-40c2-8945-080216fd5388	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.300000000000146	1	1	no error	0.5	2024-07-15 19:38:00+00	2024-07-15 19:40:00+00
18812f26-37ce-4366-b6ea-f9dd741b842f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.400000000000148	1	1	no error	0.5	2024-07-15 19:41:00+00	2024-07-15 19:44:00+00
277c12f9-42bc-4d04-8f13-d6bbd58118ca	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.50000000000015	1	1	no error	0.5	2024-07-15 19:45:00+00	2024-07-15 19:49:00+00
9247c0b9-7aee-4ace-8d64-927d6832fb46	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.60000000000015	1	1	no error	0.5	2024-07-15 19:50:00+00	2024-07-15 19:55:00+00
b882d25c-c6a5-42a1-af58-f513fabddb8e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.700000000000152	1	1	no error	0.5	2024-07-15 19:56:00+00	2024-07-15 20:02:00+00
3c7ec823-d731-4638-ba84-4e0afd1d7204	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.800000000000153	1	1	no error	0.5	2024-07-15 20:03:00+00	2024-07-15 20:10:00+00
455cd40e-ada2-48dc-8853-eaf7df3d14b0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	29.900000000000155	1	1	no error	0.5	2024-07-15 20:11:00+00	2024-07-15 20:19:00+00
0c976056-c1a2-4cb4-a8c8-f6dc2c989ac9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.000000000000156	1	1	no error	0.5	2024-07-15 20:20:00+00	2024-07-15 20:29:00+00
e484b067-2d84-49bc-8a09-12cb61b9c234	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.100000000000158	1	1	no error	0.5	2024-07-15 20:30:00+00	2024-07-15 20:30:00+00
8e456dc2-ff97-4488-851c-df0d256c9cfd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.20000000000016	1	1	no error	0.5	2024-07-15 20:31:00+00	2024-07-15 20:32:00+00
d2df5418-540e-40c4-afeb-108d6833775a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.30000000000016	1	1	no error	0.5	2024-07-15 20:33:00+00	2024-07-15 20:35:00+00
e2f96597-1d70-4070-8466-01cbfccd4114	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.400000000000162	1	1	no error	0.5	2024-07-15 20:36:00+00	2024-07-15 20:39:00+00
bf085fb3-b402-45b7-99b5-df8ba0d300d1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.500000000000163	1	1	no error	0.5	2024-07-15 20:40:00+00	2024-07-15 20:44:00+00
c948beaf-324d-4a7a-964e-ed8e973fbf9e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.600000000000165	1	1	no error	0.5	2024-07-15 20:45:00+00	2024-07-15 20:50:00+00
6cbd3bc0-ea79-41d3-bcb7-e26d9981bb5a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.700000000000166	1	1	no error	0.5	2024-07-15 20:51:00+00	2024-07-15 20:57:00+00
d89d6eb9-f362-4fe5-b864-54421dcc518b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.800000000000168	1	1	no error	0.5	2024-07-15 20:58:00+00	2024-07-15 21:05:00+00
c1486343-0d38-474f-819e-97dd9a4f05e9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	30.90000000000017	1	1	no error	0.5	2024-07-15 21:06:00+00	2024-07-15 21:14:00+00
86caad99-867c-4fae-a279-55aa873c949a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.00000000000017	1	1	no error	0.5	2024-07-15 21:15:00+00	2024-07-15 21:24:00+00
7ceab475-4c9b-41cf-9b35-152dc427a00e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.100000000000172	1	1	no error	0.5	2024-07-15 21:25:00+00	2024-07-15 21:25:00+00
01e88b59-cc86-44c1-9578-3f2f5060c587	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.200000000000173	1	1	no error	0.5	2024-07-15 21:26:00+00	2024-07-15 21:27:00+00
d1f9ddf0-8e4d-4c53-9f84-9a5b10ca70b7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.300000000000175	1	1	no error	0.5	2024-07-15 21:28:00+00	2024-07-15 21:30:00+00
aef6bf3a-1f60-45cc-bad0-c7d8e0f62148	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.400000000000176	1	1	no error	0.5	2024-07-15 21:31:00+00	2024-07-15 21:34:00+00
44c7779c-5f23-466c-bf5d-66f4a0922857	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.500000000000178	1	1	no error	0.5	2024-07-15 21:35:00+00	2024-07-15 21:39:00+00
eb65d6d6-f51e-412d-b512-2aa92e668a8f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.60000000000018	1	1	no error	0.5	2024-07-15 21:40:00+00	2024-07-15 21:45:00+00
86d840fd-5a0a-454f-bbda-6f22f62eb71b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.70000000000018	1	1	no error	0.5	2024-07-15 21:46:00+00	2024-07-15 21:52:00+00
26265538-affb-4b7d-bd7e-4d719c63c2eb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.800000000000182	1	1	no error	0.5	2024-07-15 21:53:00+00	2024-07-15 22:00:00+00
bc58f3bc-0812-4522-8b9e-ecd6c307b2ea	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	31.900000000000183	1	1	no error	0.5	2024-07-15 22:01:00+00	2024-07-15 22:09:00+00
77fbc86a-275f-49ef-b4a7-20e4031d247a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.000000000000185	1	1	no error	0.5	2024-07-15 22:10:00+00	2024-07-15 22:19:00+00
943d8683-782d-47e1-bd71-7b35a7a242a0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.100000000000186	1	1	no error	0.5	2024-07-15 22:20:00+00	2024-07-15 22:20:00+00
6585032f-d6c8-4a3c-bad8-c55596854d0c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.20000000000019	1	1	no error	0.5	2024-07-15 22:21:00+00	2024-07-15 22:22:00+00
2c991ef2-115f-4aaf-bcd0-a2fe261e360b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.30000000000019	1	1	no error	0.5	2024-07-15 22:23:00+00	2024-07-15 22:25:00+00
47bd0e75-a6ba-4039-8294-446c8b7a3d20	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.40000000000019	1	1	no error	0.5	2024-07-15 22:26:00+00	2024-07-15 22:29:00+00
aefbf8a5-ceba-4013-b74c-e6f30eb86c15	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.50000000000019	1	1	no error	0.5	2024-07-15 22:30:00+00	2024-07-15 22:34:00+00
fdef3fe7-f8df-4780-b33a-b6ac2856a119	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.60000000000019	1	1	no error	0.5	2024-07-15 22:35:00+00	2024-07-15 22:40:00+00
986235d5-e01e-43c9-a677-2a7b4d76f462	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.700000000000195	1	1	no error	0.5	2024-07-15 22:41:00+00	2024-07-15 22:47:00+00
3b48f89f-9f77-48ed-b863-cf7fc2ac5a44	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.800000000000196	1	1	no error	0.5	2024-07-15 22:48:00+00	2024-07-15 22:55:00+00
523205cc-67c8-4c47-8315-fc8042be561d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	32.9000000000002	1	1	no error	0.5	2024-07-15 22:56:00+00	2024-07-15 23:04:00+00
4cc66ddd-5905-44db-89af-17b18202abbb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.0000000000002	1	1	no error	0.5	2024-07-15 23:05:00+00	2024-07-15 23:14:00+00
01fb279d-7723-4fed-ae8e-d7093df083b1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.1000000000002	1	1	no error	0.5	2024-07-15 23:15:00+00	2024-07-15 23:15:00+00
8dbd4710-3291-45a0-9eac-e9d5a4a037c0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.2000000000002	1	1	no error	0.5	2024-07-15 23:16:00+00	2024-07-15 23:17:00+00
3b8bbd52-b67d-48e7-93b1-4ec35e8c2f7c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.3000000000002	1	1	no error	0.5	2024-07-15 23:18:00+00	2024-07-15 23:20:00+00
c155e51c-e187-4d5a-835a-a76365252ad4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.400000000000205	1	1	no error	0.5	2024-07-15 23:21:00+00	2024-07-15 23:24:00+00
f01da801-4dd1-4d90-bd64-4745fed99307	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.500000000000206	1	1	no error	0.5	2024-07-15 23:25:00+00	2024-07-15 23:29:00+00
f8a5b878-6feb-48de-8bb6-3054e28d01bd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.60000000000021	1	1	no error	0.5	2024-07-15 23:30:00+00	2024-07-15 23:35:00+00
06f1cd89-60dc-4e6f-a65f-31340947e201	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.70000000000021	1	1	no error	0.5	2024-07-15 23:36:00+00	2024-07-15 23:42:00+00
f215a9f1-acf8-4fdd-ba13-40f0fe847d76	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.80000000000021	1	1	no error	0.5	2024-07-15 23:43:00+00	2024-07-15 23:50:00+00
2e065554-b7d1-44db-baa9-8abf9e67a9c6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	33.90000000000021	1	1	no error	0.5	2024-07-15 23:51:00+00	2024-07-15 23:59:00+00
e1c8f95c-f114-47a9-9796-b1ed1732e5ae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.00000000000021	1	1	no error	0.5	2024-07-16 00:00:00+00	2024-07-16 00:09:00+00
cf4076df-8180-4d8e-b893-e30346614108	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.100000000000215	1	1	no error	0.5	2024-07-16 00:10:00+00	2024-07-16 00:10:00+00
c9fa13a9-5951-413e-9648-71c7fbfd6386	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.200000000000216	1	1	no error	0.5	2024-07-16 00:11:00+00	2024-07-16 00:12:00+00
f97bf145-e076-4a77-adad-0e99db46e59c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.30000000000022	1	1	no error	0.5	2024-07-16 00:13:00+00	2024-07-16 00:15:00+00
f5cc7a0b-efe6-431d-a108-36357befabe7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.40000000000022	1	1	no error	0.5	2024-07-16 00:16:00+00	2024-07-16 00:19:00+00
98515801-b0c3-447a-976c-4ea2ff53352a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.50000000000022	1	1	no error	0.5	2024-07-16 00:20:00+00	2024-07-16 00:24:00+00
ad2d4d25-9164-4362-8347-d3a3d8b0b099	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.60000000000022	1	1	no error	0.5	2024-07-16 00:25:00+00	2024-07-16 00:30:00+00
1c144126-0e11-41e3-b3b9-c07116ab9c28	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.70000000000022	1	1	no error	0.5	2024-07-16 00:31:00+00	2024-07-16 00:37:00+00
f058bad0-31d9-42ce-ab1b-49817c68cafa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.800000000000225	1	1	no error	0.5	2024-07-16 00:38:00+00	2024-07-16 00:45:00+00
30f44405-b6fa-4563-b0e2-9bae8a8f73f6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	34.900000000000226	1	1	no error	0.5	2024-07-16 00:46:00+00	2024-07-16 00:54:00+00
c34298d8-8d96-4a21-9358-d3846b3a0a1c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.00000000000023	1	1	no error	0.5	2024-07-16 00:55:00+00	2024-07-16 01:04:00+00
10046414-1b35-444a-8129-d3b3d6948d19	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.10000000000023	1	1	no error	0.5	2024-07-16 01:05:00+00	2024-07-16 01:05:00+00
033aa51e-0054-4837-96d0-a13ac77421a6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.20000000000023	1	1	no error	0.5	2024-07-16 01:06:00+00	2024-07-16 01:07:00+00
311ba621-8b5a-408f-bcac-ab507e3070b9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.30000000000023	1	1	no error	0.5	2024-07-16 01:08:00+00	2024-07-16 01:10:00+00
acc4a864-9275-4366-9fa9-ddd2cb643ef5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.40000000000023	1	1	no error	0.5	2024-07-16 01:11:00+00	2024-07-16 01:14:00+00
c7ea0998-993b-42f8-aedd-95540e76c32b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.500000000000234	1	1	no error	0.5	2024-07-16 01:15:00+00	2024-07-16 01:19:00+00
0ac77d01-5caa-463a-a167-d6b5b7917b9a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.600000000000236	1	1	no error	0.5	2024-07-16 01:20:00+00	2024-07-16 01:25:00+00
0ec1d0c2-e7a3-4853-8639-67270f502bb3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.70000000000024	1	1	no error	0.5	2024-07-16 01:26:00+00	2024-07-16 01:32:00+00
2f772ed2-3013-4dd2-ad9d-79b1117b6b6f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.80000000000024	1	1	no error	0.5	2024-07-16 01:33:00+00	2024-07-16 01:40:00+00
d52ace97-7e4c-4224-8ecd-85d884e6f5c3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	35.90000000000024	1	1	no error	0.5	2024-07-16 01:41:00+00	2024-07-16 01:49:00+00
b0768604-5046-4abf-ae39-da3b38fd29d3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.00000000000024	1	1	no error	0.5	2024-07-16 01:50:00+00	2024-07-16 01:59:00+00
94a7454c-b49d-4c52-b763-b16170e9520f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.10000000000024	1	1	no error	0.5	2024-07-16 02:00:00+00	2024-07-16 02:00:00+00
7198d62d-cd20-45e3-ba10-41dcf83a66b5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.200000000000244	1	1	no error	0.5	2024-07-16 02:01:00+00	2024-07-16 02:02:00+00
0d3294c8-ceee-4461-9c83-15c45349f741	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.300000000000246	1	1	no error	0.5	2024-07-16 02:03:00+00	2024-07-16 02:05:00+00
17a13661-16f1-43eb-b1c3-79eb39d776c9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.40000000000025	1	1	no error	0.5	2024-07-16 02:06:00+00	2024-07-16 02:09:00+00
7bdcacc0-e71e-4466-a3cc-46fca6755399	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.50000000000025	1	1	no error	0.5	2024-07-16 02:10:00+00	2024-07-16 02:14:00+00
fa73135b-c5bd-404a-a74e-5691dd51338a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.60000000000025	1	1	no error	0.5	2024-07-16 02:15:00+00	2024-07-16 02:20:00+00
21689483-30a1-4770-be87-4e0226bf1e39	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.70000000000025	1	1	no error	0.5	2024-07-16 02:21:00+00	2024-07-16 02:27:00+00
c8b0574c-d307-40ef-a076-490a2067ad1e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.80000000000025	1	1	no error	0.5	2024-07-16 02:28:00+00	2024-07-16 02:35:00+00
7e6fed16-1db8-4cee-8edf-4f1506007be2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	36.900000000000254	1	1	no error	0.5	2024-07-16 02:36:00+00	2024-07-16 02:44:00+00
b7e4e57d-fb30-42c9-8eb2-73ee97f45d6c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.000000000000256	1	1	no error	0.5	2024-07-16 02:45:00+00	2024-07-16 02:54:00+00
bc61563b-066b-4d4b-903f-9bc2fab501d0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.10000000000026	1	1	no error	0.5	2024-07-16 02:55:00+00	2024-07-16 02:55:00+00
ff339ecd-df15-47b2-a13e-0bb085eb8356	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.20000000000026	1	1	no error	0.5	2024-07-16 02:56:00+00	2024-07-16 02:57:00+00
1d1b73d7-b473-4ef8-bc34-84aff49b3765	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.30000000000026	1	1	no error	0.5	2024-07-16 02:58:00+00	2024-07-16 03:00:00+00
f9e634d3-e904-47cf-bc3e-6c200216b5a9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.40000000000026	1	1	no error	0.5	2024-07-16 03:01:00+00	2024-07-16 03:04:00+00
d27a83f3-4034-45bd-9b6b-6666fd3c75ce	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.50000000000026	1	1	no error	0.5	2024-07-16 03:05:00+00	2024-07-16 03:09:00+00
fe483700-580e-4f81-a6b7-5790c6b0bc4c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.600000000000264	1	1	no error	0.5	2024-07-16 03:10:00+00	2024-07-16 03:15:00+00
08b1a0b5-93f9-410b-afc7-f2f9ba813e10	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.700000000000266	1	1	no error	0.5	2024-07-16 03:16:00+00	2024-07-16 03:22:00+00
3edca196-9d56-4558-b357-3dcb300d0368	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.80000000000027	1	1	no error	0.5	2024-07-16 03:23:00+00	2024-07-16 03:30:00+00
76ae10d6-8fa7-4ee5-8612-3fe07579b9b5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	37.90000000000027	1	1	no error	0.5	2024-07-16 03:31:00+00	2024-07-16 03:39:00+00
8ab07427-6cfa-4886-a01b-cc886517bbc6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.00000000000027	1	1	no error	0.5	2024-07-16 03:40:00+00	2024-07-16 03:49:00+00
17c64438-6a8f-4490-a54e-178729ae0676	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.10000000000027	1	1	no error	0.5	2024-07-16 03:50:00+00	2024-07-16 03:50:00+00
9311750d-13dd-404e-8c88-291f3cf57668	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.20000000000027	1	1	no error	0.5	2024-07-16 03:51:00+00	2024-07-16 03:52:00+00
370d8c35-a4da-4c65-9a1f-41bf84560277	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.300000000000274	1	1	no error	0.5	2024-07-16 03:53:00+00	2024-07-16 03:55:00+00
375842f9-fe88-4140-88f1-7a6db0cfbecc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.400000000000276	1	1	no error	0.5	2024-07-16 03:56:00+00	2024-07-16 03:59:00+00
c096a5b1-5cb7-4ecd-8c6f-833bf2eb426a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.50000000000028	1	1	no error	0.5	2024-07-16 04:00:00+00	2024-07-16 04:04:00+00
2232a22c-3233-4880-99f3-5cc2784e2a87	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.60000000000028	1	1	no error	0.5	2024-07-16 04:05:00+00	2024-07-16 04:10:00+00
cb91a92f-1315-44d6-b0c4-8e65df195c87	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.70000000000028	1	1	no error	0.5	2024-07-16 04:11:00+00	2024-07-16 04:17:00+00
037dcb1b-ba5c-4998-97be-f456c3ca8af6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.80000000000028	1	1	no error	0.5	2024-07-16 04:18:00+00	2024-07-16 04:25:00+00
f809aa90-6be8-4918-986e-0aa163b8192d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	38.90000000000028	1	1	no error	0.5	2024-07-16 04:26:00+00	2024-07-16 04:34:00+00
f6aa3247-4651-4bb1-b793-683ecdb25554	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.000000000000284	1	1	no error	0.5	2024-07-16 04:35:00+00	2024-07-16 04:44:00+00
973cef8d-894e-4586-b46c-ca96990eb915	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.100000000000286	1	1	no error	0.5	2024-07-16 04:45:00+00	2024-07-16 04:45:00+00
c7017dda-656c-45ae-8351-70ec379155ed	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.20000000000029	1	1	no error	0.5	2024-07-16 04:46:00+00	2024-07-16 04:47:00+00
87455bb2-e3bc-4972-b780-69181417a2e6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.30000000000029	1	1	no error	0.5	2024-07-16 04:48:00+00	2024-07-16 04:50:00+00
63b6887d-f69f-44f0-8cf4-379b6d5ff853	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.40000000000029	1	1	no error	0.5	2024-07-16 04:51:00+00	2024-07-16 04:54:00+00
5be02d14-5365-4b59-9a3c-e8b4cc51be6c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.50000000000029	1	1	no error	0.5	2024-07-16 04:55:00+00	2024-07-16 04:59:00+00
300d6220-f32e-4836-ae00-57ee41bc73a6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.60000000000029	1	1	no error	0.5	2024-07-16 05:00:00+00	2024-07-16 05:05:00+00
42fd4b65-ffe5-43df-b3c5-e06d5a9a0eab	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.700000000000294	1	1	no error	0.5	2024-07-16 05:06:00+00	2024-07-16 05:12:00+00
6ba0e39e-a48c-44bc-a7c0-9eba2703f160	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.800000000000296	1	1	no error	0.5	2024-07-16 05:13:00+00	2024-07-16 05:20:00+00
e0a1cb57-dc6b-4a45-9177-192c025aed0c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	39.9000000000003	1	1	no error	0.5	2024-07-16 05:21:00+00	2024-07-16 05:29:00+00
a25fcd48-4ecd-4fc4-94c2-44a02d962029	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.0000000000003	1	1	no error	0.5	2024-07-16 05:30:00+00	2024-07-16 05:39:00+00
06f2898b-9e3c-40ff-baad-ffa1cf06cf5f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.1000000000003	1	1	no error	0.5	2024-07-16 05:40:00+00	2024-07-16 05:40:00+00
991c3519-0c41-48b1-bae9-48a7d3b84199	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.2000000000003	1	1	no error	0.5	2024-07-16 05:41:00+00	2024-07-16 05:42:00+00
55f9b178-14db-4da7-b163-43ec9b44ab67	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.3000000000003	1	1	no error	0.5	2024-07-16 05:43:00+00	2024-07-16 05:45:00+00
c9fcbf96-c37b-496e-8110-2f71d2f88ea9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.400000000000304	1	1	no error	0.5	2024-07-16 05:46:00+00	2024-07-16 05:49:00+00
dd100f19-c89d-493a-958c-86bf29a5819e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.500000000000306	1	1	no error	0.5	2024-07-16 05:50:00+00	2024-07-16 05:54:00+00
95ef54ca-9d97-4f4f-a230-69c0a6ae7c63	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.60000000000031	1	1	no error	0.5	2024-07-16 05:55:00+00	2024-07-16 06:00:00+00
b4a931c3-0a56-4942-a85b-f2ec42f15200	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.70000000000031	1	1	no error	0.5	2024-07-16 06:01:00+00	2024-07-16 06:07:00+00
c6c98630-54d9-4a23-b1b0-6fb33895d4c2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.80000000000031	1	1	no error	0.5	2024-07-16 06:08:00+00	2024-07-16 06:15:00+00
4d010e84-4e74-4fa0-8da8-3dd0a2e8117e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	40.90000000000031	1	1	no error	0.5	2024-07-16 06:16:00+00	2024-07-16 06:24:00+00
b204e58c-2a68-48a9-9b29-d009723fb51d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.00000000000031	1	1	no error	0.5	2024-07-16 06:25:00+00	2024-07-16 06:34:00+00
ef61149f-7b94-4fa1-9368-c4597d888523	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.100000000000314	1	1	no error	0.5	2024-07-16 06:35:00+00	2024-07-16 06:35:00+00
992dce43-95db-412b-9799-95e398abd197	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.200000000000315	1	1	no error	0.5	2024-07-16 06:36:00+00	2024-07-16 06:37:00+00
61ac17f6-ca37-42ca-b21a-eba06b54d8d6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.30000000000032	1	1	no error	0.5	2024-07-16 06:38:00+00	2024-07-16 06:40:00+00
4d83fffe-8785-4dd4-a081-7c71c1ea58e8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.40000000000032	1	1	no error	0.5	2024-07-16 06:41:00+00	2024-07-16 06:44:00+00
461d4b02-9470-4087-8bf3-2381e5e24cfa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.50000000000032	1	1	no error	0.5	2024-07-16 06:45:00+00	2024-07-16 06:49:00+00
9b1f04aa-62d5-4fd1-8e24-892706bb61be	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.60000000000032	1	1	no error	0.5	2024-07-16 06:50:00+00	2024-07-16 06:55:00+00
24da1866-3291-48d4-940b-bb23453c01c7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.70000000000032	1	1	no error	0.5	2024-07-16 06:56:00+00	2024-07-16 07:02:00+00
d74162b2-aeb8-46dc-82ee-0f5aa7e742d0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.800000000000324	1	1	no error	0.5	2024-07-16 07:03:00+00	2024-07-16 07:10:00+00
7f2fe509-ab33-40e3-80bb-c0d6300edb33	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	41.900000000000325	1	1	no error	0.5	2024-07-16 07:11:00+00	2024-07-16 07:19:00+00
989b426f-d99b-4ccc-bb0c-997dd863ace0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.00000000000033	1	1	no error	0.5	2024-07-16 07:20:00+00	2024-07-16 07:29:00+00
59fec0ef-b073-472e-96a7-b1c152de9cae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.10000000000033	1	1	no error	0.5	2024-07-16 07:30:00+00	2024-07-16 07:30:00+00
24f6ec77-84f7-46a9-9811-deacecb66618	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.20000000000033	1	1	no error	0.5	2024-07-16 07:31:00+00	2024-07-16 07:32:00+00
0dfcb72e-36ca-48cc-a34a-deffb4fbdc26	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.30000000000033	1	1	no error	0.5	2024-07-16 07:33:00+00	2024-07-16 07:35:00+00
0800e0eb-296a-4a32-9b14-9379289b4056	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.40000000000033	1	1	no error	0.5	2024-07-16 07:36:00+00	2024-07-16 07:39:00+00
214052a0-0e30-4987-ab11-d02b2e73b5f2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.500000000000334	1	1	no error	0.5	2024-07-16 07:40:00+00	2024-07-16 07:44:00+00
cb25b71f-341e-4fdb-a34a-6d62400533ab	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.600000000000335	1	1	no error	0.5	2024-07-16 07:45:00+00	2024-07-16 07:50:00+00
75686c77-8bae-4812-b6cf-7c6e06c55b91	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.70000000000034	1	1	no error	0.5	2024-07-16 07:51:00+00	2024-07-16 07:57:00+00
e0ffa051-7a2f-4529-b717-68997180b839	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.80000000000034	1	1	no error	0.5	2024-07-16 07:58:00+00	2024-07-16 08:05:00+00
4bf86dcd-bc54-4ad8-8384-c697e12027b9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	42.90000000000034	1	1	no error	0.5	2024-07-16 08:06:00+00	2024-07-16 08:14:00+00
02b4b6c1-34c5-4401-9273-885b179cc037	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.00000000000034	1	1	no error	0.5	2024-07-16 08:15:00+00	2024-07-16 08:24:00+00
ce9aecaf-1a9d-476b-acef-3f508684042c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.10000000000034	1	1	no error	0.5	2024-07-16 08:25:00+00	2024-07-16 08:25:00+00
170c8e9b-dbbc-4965-88e8-ec1274fdb4fd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.200000000000344	1	1	no error	0.5	2024-07-16 08:26:00+00	2024-07-16 08:27:00+00
eaadac07-0f92-4896-8ed1-23d5e2527e58	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.300000000000345	1	1	no error	0.5	2024-07-16 08:28:00+00	2024-07-16 08:30:00+00
f0de1b4e-ef68-4266-a75c-d94c0911fa48	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.40000000000035	1	1	no error	0.5	2024-07-16 08:31:00+00	2024-07-16 08:34:00+00
97d80cf9-8298-4029-a708-36555cf01c9c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.50000000000035	1	1	no error	0.5	2024-07-16 08:35:00+00	2024-07-16 08:39:00+00
8de5b8ea-1505-473c-9732-c44ee2336173	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.60000000000035	1	1	no error	0.5	2024-07-16 08:40:00+00	2024-07-16 08:45:00+00
54b3b216-ee33-473a-bd46-e5e55fc7c4c4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.70000000000035	1	1	no error	0.5	2024-07-16 08:46:00+00	2024-07-16 08:52:00+00
b303155e-6513-49d5-8a66-0caa7b6f3db9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.80000000000035	1	1	no error	0.5	2024-07-16 08:53:00+00	2024-07-16 09:00:00+00
f317a637-1ebc-4400-9258-fae77b878988	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	43.900000000000354	1	1	no error	0.5	2024-07-16 09:01:00+00	2024-07-16 09:09:00+00
9e0027c8-1ccc-4b54-8f72-546b260b3c2c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.000000000000355	1	1	no error	0.5	2024-07-16 09:10:00+00	2024-07-16 09:19:00+00
b9e1204a-c801-4757-bccd-8dabbf191cf6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.10000000000036	1	1	no error	0.5	2024-07-16 09:20:00+00	2024-07-16 09:20:00+00
095d7185-3035-4f41-8cca-cbf20f8ae856	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.20000000000036	1	1	no error	0.5	2024-07-16 09:21:00+00	2024-07-16 09:22:00+00
4c909b42-5f99-467f-98f7-67bc2b0a85c3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.30000000000036	1	1	no error	0.5	2024-07-16 09:23:00+00	2024-07-16 09:25:00+00
af813680-a7c8-4702-9ef6-a659339e1da6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.40000000000036	1	1	no error	0.5	2024-07-16 09:26:00+00	2024-07-16 09:29:00+00
0bb1bee2-50fc-4b8b-b28f-4d893aa94029	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.50000000000036	1	1	no error	0.5	2024-07-16 09:30:00+00	2024-07-16 09:34:00+00
f8b016bb-35eb-43c0-b598-183b83e5d2d6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.600000000000364	1	1	no error	0.5	2024-07-16 09:35:00+00	2024-07-16 09:40:00+00
11b41fa1-2274-4145-940a-36d2a6ee62b1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.700000000000365	1	1	no error	0.5	2024-07-16 09:41:00+00	2024-07-16 09:47:00+00
3d77015a-8073-4040-b90e-82a1dd33241d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.80000000000037	1	1	no error	0.5	2024-07-16 09:48:00+00	2024-07-16 09:55:00+00
57607ac7-3839-4049-9eb0-b7505d6aca3b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	44.90000000000037	1	1	no error	0.5	2024-07-16 09:56:00+00	2024-07-16 10:04:00+00
f676a891-1adb-432c-9cd5-e1a90513e1fb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.00000000000037	1	1	no error	0.5	2024-07-16 10:05:00+00	2024-07-16 10:14:00+00
77a4d852-faf9-4a8e-9c2d-e291cee4e4aa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.10000000000037	1	1	no error	0.5	2024-07-16 10:15:00+00	2024-07-16 10:15:00+00
36f235c8-e6af-4a0b-953b-642652127f13	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.20000000000037	1	1	no error	0.5	2024-07-16 10:16:00+00	2024-07-16 10:17:00+00
a03b7218-81ab-45d6-8266-fc9eddc00d52	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.300000000000374	1	1	no error	0.5	2024-07-16 10:18:00+00	2024-07-16 10:20:00+00
eebbb704-6b33-43a8-90a5-dbc11cefa5f5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.400000000000375	1	1	no error	0.5	2024-07-16 10:21:00+00	2024-07-16 10:24:00+00
31c59da6-c71d-41dd-8fa3-f37392c87a12	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.50000000000038	1	1	no error	0.5	2024-07-16 10:25:00+00	2024-07-16 10:29:00+00
9d1a32bf-341e-4efe-9216-1fbe5d06f96c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.60000000000038	1	1	no error	0.5	2024-07-16 10:30:00+00	2024-07-16 10:35:00+00
bb722257-1cc0-4e9f-9974-edda37d558be	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.70000000000038	1	1	no error	0.5	2024-07-16 10:36:00+00	2024-07-16 10:42:00+00
c0d8569b-83e3-48e7-85e1-0c382239f059	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.80000000000038	1	1	no error	0.5	2024-07-16 10:43:00+00	2024-07-16 10:50:00+00
e83083b6-7ae0-4f61-b812-9fca9486fcb1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	45.90000000000038	1	1	no error	0.5	2024-07-16 10:51:00+00	2024-07-16 10:59:00+00
6d435bd9-0079-4f1b-a79e-62d70e93db75	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.000000000000384	1	1	no error	0.5	2024-07-16 11:00:00+00	2024-07-16 11:09:00+00
8e38c528-1691-4a5c-9db7-bb3310fce82e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.100000000000385	1	1	no error	0.5	2024-07-16 11:10:00+00	2024-07-16 11:10:00+00
2376579f-592e-4a1d-a2d2-9c7c4bab37b7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.20000000000039	1	1	no error	0.5	2024-07-16 11:11:00+00	2024-07-16 11:12:00+00
5c8615e6-7caf-4b46-8be3-830974abc13b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.30000000000039	1	1	no error	0.5	2024-07-16 11:13:00+00	2024-07-16 11:15:00+00
88eb3fa4-b9cc-4ec2-9cf5-2dff53dd8718	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.40000000000039	1	1	no error	0.5	2024-07-16 11:16:00+00	2024-07-16 11:19:00+00
6b0f3565-f6e0-4f81-b6f0-fde5f16aa983	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.50000000000039	1	1	no error	0.5	2024-07-16 11:20:00+00	2024-07-16 11:24:00+00
719fc691-32ae-48b6-9962-14949255b8fe	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.60000000000039	1	1	no error	0.5	2024-07-16 11:25:00+00	2024-07-16 11:30:00+00
579da164-ed5b-4a57-8539-a41db8a5e46b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.700000000000394	1	1	no error	0.5	2024-07-16 11:31:00+00	2024-07-16 11:37:00+00
e519e768-afed-4d4b-8ac5-b46d0403a8c5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.800000000000395	1	1	no error	0.5	2024-07-16 11:38:00+00	2024-07-16 11:45:00+00
c9b2f75e-7f9e-43e5-a706-81284151d091	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	46.9000000000004	1	1	no error	0.5	2024-07-16 11:46:00+00	2024-07-16 11:54:00+00
55aaead5-1dc1-4f62-b569-8ac20f404a92	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.0000000000004	1	1	no error	0.5	2024-07-16 11:55:00+00	2024-07-16 12:04:00+00
8784eb9f-979b-444c-b06d-95cd25537cf7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.1000000000004	1	1	no error	0.5	2024-07-16 12:05:00+00	2024-07-16 12:05:00+00
8475fa68-53a7-439a-bbed-0d08540cf345	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.2000000000004	1	1	no error	0.5	2024-07-16 12:06:00+00	2024-07-16 12:07:00+00
bf684b97-b44d-4b8e-90e5-f36ece837a02	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.3000000000004	1	1	no error	0.5	2024-07-16 12:08:00+00	2024-07-16 12:10:00+00
a02e3457-6ede-4d17-9c29-84a85eee49db	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.400000000000404	1	1	no error	0.5	2024-07-16 12:11:00+00	2024-07-16 12:14:00+00
bb428210-335c-4d1c-8bc2-24d74aa054d0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.500000000000405	1	1	no error	0.5	2024-07-16 12:15:00+00	2024-07-16 12:19:00+00
3fbdd57d-fbad-456e-a9b8-24cca670dcc6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.600000000000406	1	1	no error	0.5	2024-07-16 12:20:00+00	2024-07-16 12:25:00+00
abf99ab1-e676-40a8-a032-7946548a26d4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.70000000000041	1	1	no error	0.5	2024-07-16 12:26:00+00	2024-07-16 12:32:00+00
e5a3a3c5-964d-4139-a287-d0634e2f71fc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.80000000000041	1	1	no error	0.5	2024-07-16 12:33:00+00	2024-07-16 12:40:00+00
8ca0a8be-abb3-492d-9269-baa909d40045	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	47.90000000000041	1	1	no error	0.5	2024-07-16 12:41:00+00	2024-07-16 12:49:00+00
da773b09-faa7-4361-b234-ca9da2adc836	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.00000000000041	1	1	no error	0.5	2024-07-16 12:50:00+00	2024-07-16 12:59:00+00
fcecb8f7-3f16-40f6-9e6c-db3c4c3442a9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.10000000000041	1	1	no error	0.5	2024-07-16 13:00:00+00	2024-07-16 13:00:00+00
d1789092-ab52-4d2f-b63b-fcd2cfb86249	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.200000000000415	1	1	no error	0.5	2024-07-16 13:01:00+00	2024-07-16 13:02:00+00
a36c8b21-36a1-46c0-910f-ab11f29eb616	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.300000000000416	1	1	no error	0.5	2024-07-16 13:03:00+00	2024-07-16 13:05:00+00
cca30ea6-0913-491a-8dd9-112d018bfce6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.40000000000042	1	1	no error	0.5	2024-07-16 13:06:00+00	2024-07-16 13:09:00+00
40c9d5c5-c752-4213-a185-d7c896618027	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.50000000000042	1	1	no error	0.5	2024-07-16 13:10:00+00	2024-07-16 13:14:00+00
3d9d998f-415e-4c0f-933a-c7ad8d0b8f35	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.60000000000042	1	1	no error	0.5	2024-07-16 13:15:00+00	2024-07-16 13:20:00+00
b0ee0960-618d-4970-a89a-4272aa297115	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.70000000000042	1	1	no error	0.5	2024-07-16 13:21:00+00	2024-07-16 13:27:00+00
9617f7f6-2d3f-4e99-b047-75c73b1e90fd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.80000000000042	1	1	no error	0.5	2024-07-16 13:28:00+00	2024-07-16 13:35:00+00
395be500-6a45-4048-918d-2de1f571de49	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	48.900000000000425	1	1	no error	0.5	2024-07-16 13:36:00+00	2024-07-16 13:44:00+00
202a1e51-6e7d-4a33-906f-5b48ee4752e1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.000000000000426	1	1	no error	0.5	2024-07-16 13:45:00+00	2024-07-16 13:54:00+00
05c379a3-a5e5-4935-88c4-0195d7e8557b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.10000000000043	1	1	no error	0.5	2024-07-16 13:55:00+00	2024-07-16 13:55:00+00
7646d042-fec6-4326-8d3a-f1a3e80cde53	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.20000000000043	1	1	no error	0.5	2024-07-16 13:56:00+00	2024-07-16 13:57:00+00
add10a6c-8252-42a6-90ad-f5e52c97c92d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.30000000000043	1	1	no error	0.5	2024-07-16 13:58:00+00	2024-07-16 14:00:00+00
9e256b8a-91a2-4d84-b7c0-e644e3a0ef3f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.40000000000043	1	1	no error	0.5	2024-07-16 14:01:00+00	2024-07-16 14:04:00+00
86e8f561-75b7-4ae2-a152-6f169121a38f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.50000000000043	1	1	no error	0.5	2024-07-16 14:05:00+00	2024-07-16 14:09:00+00
fc96fe1d-c665-47e1-aaad-529165348acb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.600000000000435	1	1	no error	0.5	2024-07-16 14:10:00+00	2024-07-16 14:15:00+00
c7418bd1-6af3-47bf-9885-0977e947568e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.700000000000436	1	1	no error	0.5	2024-07-16 14:16:00+00	2024-07-16 14:22:00+00
8941b653-6a79-4664-bac5-c9e2ba544cb3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.80000000000044	1	1	no error	0.5	2024-07-16 14:23:00+00	2024-07-16 14:30:00+00
130a5efc-b2e7-48c8-a4c1-fc222e815a27	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	49.90000000000044	1	1	no error	0.5	2024-07-16 14:31:00+00	2024-07-16 14:39:00+00
37bb0e60-b9cb-4f15-bb73-6a8f36208072	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.00000000000044	1	1	no error	0.5	2024-07-16 14:40:00+00	2024-07-16 14:49:00+00
a6fcce86-37e0-43ec-9fa4-05ad851b513c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.10000000000044	1	1	no error	0.5	2024-07-16 14:50:00+00	2024-07-16 14:50:00+00
fd6df4ae-31d0-4c51-ba41-5d2763555aef	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.20000000000044	1	1	no error	0.5	2024-07-16 14:51:00+00	2024-07-16 14:52:00+00
73e99d5f-535a-4bb5-93f4-912716da15d0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.300000000000445	1	1	no error	0.5	2024-07-16 14:53:00+00	2024-07-16 14:55:00+00
6676d2c4-66eb-4ceb-b66d-56c67d17f8c9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.400000000000446	1	1	no error	0.5	2024-07-16 14:56:00+00	2024-07-16 14:59:00+00
aa0c205a-9387-4554-86cc-2b39a81988e9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.50000000000045	1	1	no error	0.5	2024-07-16 15:00:00+00	2024-07-16 15:04:00+00
2493c84d-05d3-403b-a5c3-c33fd4c0ae01	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.60000000000045	1	1	no error	0.5	2024-07-16 15:05:00+00	2024-07-16 15:10:00+00
f9bac24c-a72b-4ea2-90d9-1ad5afe06f8c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.70000000000045	1	1	no error	0.5	2024-07-16 15:11:00+00	2024-07-16 15:17:00+00
d0a79cd5-1af6-4622-bec6-45b5aba53fc7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.80000000000045	1	1	no error	0.5	2024-07-16 15:18:00+00	2024-07-16 15:25:00+00
0842be15-ed68-4061-9997-f98bb4989d99	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	50.90000000000045	1	1	no error	0.5	2024-07-16 15:26:00+00	2024-07-16 15:34:00+00
49d44e4c-5a86-4033-8e9e-8055243dd64b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.000000000000455	1	1	no error	0.5	2024-07-16 15:35:00+00	2024-07-16 15:44:00+00
8cbee8c6-7212-4d03-b164-2bab0b763c65	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.100000000000456	1	1	no error	0.5	2024-07-16 15:45:00+00	2024-07-16 15:45:00+00
ce651cba-78b0-4481-963f-2b4dea29fa3a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.20000000000046	1	1	no error	0.5	2024-07-16 15:46:00+00	2024-07-16 15:47:00+00
15a526b2-983c-4f8f-ae52-73e0d321f478	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.30000000000046	1	1	no error	0.5	2024-07-16 15:48:00+00	2024-07-16 15:50:00+00
e60f4a6d-28c3-4033-8fca-4d346e9a0eb7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.40000000000046	1	1	no error	0.5	2024-07-16 15:51:00+00	2024-07-16 15:54:00+00
e262b779-1a64-4208-b6f4-69215658e92c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.50000000000046	1	1	no error	0.5	2024-07-16 15:55:00+00	2024-07-16 15:59:00+00
9e182572-2624-4015-953a-ebdaf40cc271	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.60000000000046	1	1	no error	0.5	2024-07-16 16:00:00+00	2024-07-16 16:05:00+00
97744dce-cad1-4493-8fae-e593389f073a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.700000000000465	1	1	no error	0.5	2024-07-16 16:06:00+00	2024-07-16 16:12:00+00
1f5fa82c-f367-45ac-b585-861765ded607	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.800000000000466	1	1	no error	0.5	2024-07-16 16:13:00+00	2024-07-16 16:20:00+00
bb4cf152-f080-432d-a3d9-a8546ddf681f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	51.90000000000047	1	1	no error	0.5	2024-07-16 16:21:00+00	2024-07-16 16:29:00+00
cd892bcc-9041-410d-a713-5633a8dbfce4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.00000000000047	1	1	no error	0.5	2024-07-16 16:30:00+00	2024-07-16 16:39:00+00
9879aa45-c1cf-4f6a-a627-c7440445d04b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.10000000000047	1	1	no error	0.5	2024-07-16 16:40:00+00	2024-07-16 16:40:00+00
25e0974c-5e36-482f-bcfd-184223ad582a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.20000000000047	1	1	no error	0.5	2024-07-16 16:41:00+00	2024-07-16 16:42:00+00
f8fd629a-45c7-4ba4-9e16-0c936156ddb2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.30000000000047	1	1	no error	0.5	2024-07-16 16:43:00+00	2024-07-16 16:45:00+00
692b9822-e8bf-4aec-89af-fb817d89c5ed	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.400000000000475	1	1	no error	0.5	2024-07-16 16:46:00+00	2024-07-16 16:49:00+00
27196278-414c-4100-9dd8-543d3eeb9ec3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.500000000000476	1	1	no error	0.5	2024-07-16 16:50:00+00	2024-07-16 16:54:00+00
61c8a167-49c1-4317-a8c5-053c9b81a591	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.60000000000048	1	1	no error	0.5	2024-07-16 16:55:00+00	2024-07-16 17:00:00+00
9ed99461-6b8c-4213-9133-7387e711b305	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.70000000000048	1	1	no error	0.5	2024-07-16 17:01:00+00	2024-07-16 17:07:00+00
0c7009a7-b7fd-44cd-be01-45840c4f7478	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.80000000000048	1	1	no error	0.5	2024-07-16 17:08:00+00	2024-07-16 17:15:00+00
8fb60eaf-659f-4a10-8a6f-79f193b5f7a1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	52.90000000000048	1	1	no error	0.5	2024-07-16 17:16:00+00	2024-07-16 17:24:00+00
72d4a9a7-add0-4bde-83b8-a0518c2a82e3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.00000000000048	1	1	no error	0.5	2024-07-16 17:25:00+00	2024-07-16 17:34:00+00
041654e6-7871-48b1-ba02-a1c11b54669d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.100000000000485	1	1	no error	0.5	2024-07-16 17:35:00+00	2024-07-16 17:35:00+00
4ab2f7e4-d6aa-420e-97d1-b2b1593924a7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.200000000000486	1	1	no error	0.5	2024-07-16 17:36:00+00	2024-07-16 17:37:00+00
49978536-7e0f-425a-acff-ad8806cf8c05	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.30000000000049	1	1	no error	0.5	2024-07-16 17:38:00+00	2024-07-16 17:40:00+00
1b0487d5-39d0-44fb-a970-c99a40f64dc9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.40000000000049	1	1	no error	0.5	2024-07-16 17:41:00+00	2024-07-16 17:44:00+00
73f49905-3535-4179-8893-33c795ad5324	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.50000000000049	1	1	no error	0.5	2024-07-16 17:45:00+00	2024-07-16 17:49:00+00
6f346940-953f-4bad-a779-6d53b3f8ce31	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.60000000000049	1	1	no error	0.5	2024-07-16 17:50:00+00	2024-07-16 17:55:00+00
2777eea8-9655-45ea-a62c-adc4d6466122	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.70000000000049	1	1	no error	0.5	2024-07-16 17:56:00+00	2024-07-16 18:02:00+00
784e0e2f-e804-4408-b46b-916267b9b3a4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.800000000000495	1	1	no error	0.5	2024-07-16 18:03:00+00	2024-07-16 18:10:00+00
5f11e7c4-c2f7-4e1d-97fc-886a9c9e315a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	53.900000000000496	1	1	no error	0.5	2024-07-16 18:11:00+00	2024-07-16 18:19:00+00
5f3eee55-e34e-400a-bc4f-ae59c727abae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.0000000000005	1	1	no error	0.5	2024-07-16 18:20:00+00	2024-07-16 18:29:00+00
7616abfa-083d-4384-bc72-9cfdfbca017e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.1000000000005	1	1	no error	0.5	2024-07-16 18:30:00+00	2024-07-16 18:30:00+00
0a88dbdd-ceac-4a92-84a1-ddc4246326a3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.2000000000005	1	1	no error	0.5	2024-07-16 18:31:00+00	2024-07-16 18:32:00+00
c568be7d-873c-44c2-b0cf-6f2071aef753	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.3000000000005	1	1	no error	0.5	2024-07-16 18:33:00+00	2024-07-16 18:35:00+00
a9c85b59-2543-4f1e-b179-1701c5d62661	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.4000000000005	1	1	no error	0.5	2024-07-16 18:36:00+00	2024-07-16 18:39:00+00
ec0aebfa-547f-41b5-8a27-82e9a3653244	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.500000000000504	1	1	no error	0.5	2024-07-16 18:40:00+00	2024-07-16 18:44:00+00
930706c5-b26e-43cf-829e-18b3fe218832	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.600000000000506	1	1	no error	0.5	2024-07-16 18:45:00+00	2024-07-16 18:50:00+00
d450981b-28a6-4aa8-ba78-820ef9915e5c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.70000000000051	1	1	no error	0.5	2024-07-16 18:51:00+00	2024-07-16 18:57:00+00
0ff88e1b-6dea-490a-b396-032ad944d276	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.80000000000051	1	1	no error	0.5	2024-07-16 18:58:00+00	2024-07-16 19:05:00+00
618b8916-9183-4b5b-9980-5585d9b0c7e4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	54.90000000000051	1	1	no error	0.5	2024-07-16 19:06:00+00	2024-07-16 19:14:00+00
9c74e824-9bb8-4a42-a52f-573e0f6a63e3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.00000000000051	1	1	no error	0.5	2024-07-16 19:15:00+00	2024-07-16 19:24:00+00
dfd1151b-4aa6-41a0-8d3e-d4adf2c886d3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.10000000000051	1	1	no error	0.5	2024-07-16 19:25:00+00	2024-07-16 19:25:00+00
bcae427c-9b06-480a-9746-b227edca2f1c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.200000000000514	1	1	no error	0.5	2024-07-16 19:26:00+00	2024-07-16 19:27:00+00
8da33995-5f23-4945-b714-cf9b781dddc4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.300000000000516	1	1	no error	0.5	2024-07-16 19:28:00+00	2024-07-16 19:30:00+00
2bf18857-72a0-4b58-8679-c332a23e3318	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.40000000000052	1	1	no error	0.5	2024-07-16 19:31:00+00	2024-07-16 19:34:00+00
139b7d09-138e-4cbd-9739-11c8f33e40ed	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.50000000000052	1	1	no error	0.5	2024-07-16 19:35:00+00	2024-07-16 19:39:00+00
936c71f0-0eac-4f36-9a00-195d587bb39a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.60000000000052	1	1	no error	0.5	2024-07-16 19:40:00+00	2024-07-16 19:45:00+00
174d4cb6-083f-4e5b-934a-509dfa174c79	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.70000000000052	1	1	no error	0.5	2024-07-16 19:46:00+00	2024-07-16 19:52:00+00
339fa80a-ad07-4fa4-9be0-5c122e47cce4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.80000000000052	1	1	no error	0.5	2024-07-16 19:53:00+00	2024-07-16 20:00:00+00
6efb2e5d-bba9-413e-bb61-00e026f81719	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	55.900000000000524	1	1	no error	0.5	2024-07-16 20:01:00+00	2024-07-16 20:09:00+00
9970b8c0-d28e-4f8c-a95c-9fd693d09552	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.000000000000526	1	1	no error	0.5	2024-07-16 20:10:00+00	2024-07-16 20:19:00+00
7d9729a6-a8e1-4c50-8ead-5e5f5bf30d8d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.10000000000053	1	1	no error	0.5	2024-07-16 20:20:00+00	2024-07-16 20:20:00+00
47f76191-eb52-4e67-a2f2-0aeaff61c0a2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.20000000000053	1	1	no error	0.5	2024-07-16 20:21:00+00	2024-07-16 20:22:00+00
4739fbe7-6b23-4a87-a036-d551a820755d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.30000000000053	1	1	no error	0.5	2024-07-16 20:23:00+00	2024-07-16 20:25:00+00
e21646e0-bbc8-4727-84b3-e0d83f262399	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.40000000000053	1	1	no error	0.5	2024-07-16 20:26:00+00	2024-07-16 20:29:00+00
83ad806e-626e-4d09-b9c3-ff1e848e4af2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.50000000000053	1	1	no error	0.5	2024-07-16 20:30:00+00	2024-07-16 20:34:00+00
6d6034d8-efe0-4417-ba0a-f62007579b2b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.600000000000534	1	1	no error	0.5	2024-07-16 20:35:00+00	2024-07-16 20:40:00+00
bef499eb-d87e-4edd-9770-8935e20cacaa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.700000000000536	1	1	no error	0.5	2024-07-16 20:41:00+00	2024-07-16 20:47:00+00
eb862357-741f-467b-93ab-58208c731448	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.80000000000054	1	1	no error	0.5	2024-07-16 20:48:00+00	2024-07-16 20:55:00+00
3fdab795-61e7-4ca4-8f15-4239d70cfb47	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	56.90000000000054	1	1	no error	0.5	2024-07-16 20:56:00+00	2024-07-16 21:04:00+00
dd4dc770-5df4-4ea3-9b54-4c4394a3e373	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.00000000000054	1	1	no error	0.5	2024-07-16 21:05:00+00	2024-07-16 21:14:00+00
230456ec-48ae-45de-9b24-3e155e9499be	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.10000000000054	1	1	no error	0.5	2024-07-16 21:15:00+00	2024-07-16 21:15:00+00
75362d0b-0509-4df9-88d0-3a4284d776bb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.20000000000054	1	1	no error	0.5	2024-07-16 21:16:00+00	2024-07-16 21:17:00+00
2911b550-0832-45bd-a441-fc9fbab0a8e0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.300000000000544	1	1	no error	0.5	2024-07-16 21:18:00+00	2024-07-16 21:20:00+00
5cc220bf-d579-4120-90d2-9e9c4fb4b106	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.400000000000546	1	1	no error	0.5	2024-07-16 21:21:00+00	2024-07-16 21:24:00+00
92dd627d-46e7-43e6-b9b0-1b2e7df5a5d6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.50000000000055	1	1	no error	0.5	2024-07-16 21:25:00+00	2024-07-16 21:29:00+00
cf0ade24-596e-4418-a7f5-b32919b5ab2c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.60000000000055	1	1	no error	0.5	2024-07-16 21:30:00+00	2024-07-16 21:35:00+00
88203bce-855e-4949-af64-fa7e1b902fb7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.70000000000055	1	1	no error	0.5	2024-07-16 21:36:00+00	2024-07-16 21:42:00+00
9ed439be-cce0-4ccf-8faf-b4c4b8f033fb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.80000000000055	1	1	no error	0.5	2024-07-16 21:43:00+00	2024-07-16 21:50:00+00
dfc6ad60-8769-4588-9ba8-4c5419a49367	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	57.90000000000055	1	1	no error	0.5	2024-07-16 21:51:00+00	2024-07-16 21:59:00+00
1ec12d3f-97f9-4d8f-89fc-1e1282231c93	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.000000000000554	1	1	no error	0.5	2024-07-16 22:00:00+00	2024-07-16 22:09:00+00
90ee088b-fd61-46bc-a48e-0b2669dacf2d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.100000000000556	1	1	no error	0.5	2024-07-16 22:10:00+00	2024-07-16 22:10:00+00
6f0fa193-40c3-45e0-bfee-73c72cd6ba80	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.20000000000056	1	1	no error	0.5	2024-07-16 22:11:00+00	2024-07-16 22:12:00+00
ef60a2a9-e2b5-4f60-82fc-cb51e982f775	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.30000000000056	1	1	no error	0.5	2024-07-16 22:13:00+00	2024-07-16 22:15:00+00
b6a6b378-6403-4338-bf02-bfea55cb84a9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.40000000000056	1	1	no error	0.5	2024-07-16 22:16:00+00	2024-07-16 22:19:00+00
8dfc360d-a816-4fdf-9f9b-1561511937f8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.50000000000056	1	1	no error	0.5	2024-07-16 22:20:00+00	2024-07-16 22:24:00+00
75dafde3-3e55-4d98-b578-4f18367fc4ae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.60000000000056	1	1	no error	0.5	2024-07-16 22:25:00+00	2024-07-16 22:30:00+00
b5f6ae6e-1ac8-40eb-b952-b8f62bc7bb62	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.700000000000564	1	1	no error	0.5	2024-07-16 22:31:00+00	2024-07-16 22:37:00+00
2a05a24d-3ed9-42b5-b9c7-21092340406b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.800000000000566	1	1	no error	0.5	2024-07-16 22:38:00+00	2024-07-16 22:45:00+00
06504fc7-d543-42e9-b0c0-a5b61718b611	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	58.90000000000057	1	1	no error	0.5	2024-07-16 22:46:00+00	2024-07-16 22:54:00+00
d3b5b879-a4e3-4e54-82a5-7df579a18bfb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.00000000000057	1	1	no error	0.5	2024-07-16 22:55:00+00	2024-07-16 23:04:00+00
c3846f22-f77f-442a-b137-c44b84dad62f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.10000000000057	1	1	no error	0.5	2024-07-16 23:05:00+00	2024-07-16 23:05:00+00
8bdd33a3-1299-4511-911e-e7996d2b8288	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.20000000000057	1	1	no error	0.5	2024-07-16 23:06:00+00	2024-07-16 23:07:00+00
18b055fa-48c2-466e-a8a0-d666bce12aff	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.30000000000057	1	1	no error	0.5	2024-07-16 23:08:00+00	2024-07-16 23:10:00+00
77540974-3552-4b33-997e-4afbedb7702b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.400000000000574	1	1	no error	0.5	2024-07-16 23:11:00+00	2024-07-16 23:14:00+00
3807595a-ae9f-4388-9702-2a248d204171	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.500000000000576	1	1	no error	0.5	2024-07-16 23:15:00+00	2024-07-16 23:19:00+00
f1216c5f-ca11-454c-9055-8abec9058b58	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.60000000000058	1	1	no error	0.5	2024-07-16 23:20:00+00	2024-07-16 23:25:00+00
88b7c736-11f1-4873-a1a2-b173dd9d2a41	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.70000000000058	1	1	no error	0.5	2024-07-16 23:26:00+00	2024-07-16 23:32:00+00
bcc68b04-f03b-4c6e-b296-ac8f2c3acc1a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.80000000000058	1	1	no error	0.5	2024-07-16 23:33:00+00	2024-07-16 23:40:00+00
c30f4590-c780-4ce1-88a7-48296c9e7a30	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	59.90000000000058	1	1	no error	0.5	2024-07-16 23:41:00+00	2024-07-16 23:49:00+00
44528436-4934-4056-9ea4-4e48072725b4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.00000000000058	1	1	no error	0.5	2024-07-16 23:50:00+00	2024-07-16 23:59:00+00
10fd4101-3ca7-4b62-a2f9-8bfb514fb3bb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.100000000000584	1	1	no error	0.5	2024-07-17 00:00:00+00	2024-07-17 00:00:00+00
aa656134-0a56-406e-97db-3a5017db6847	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.200000000000585	1	1	no error	0.5	2024-07-17 00:01:00+00	2024-07-17 00:02:00+00
a8aaf014-406c-46bf-9196-cc0ab63e6108	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.30000000000059	1	1	no error	0.5	2024-07-17 00:03:00+00	2024-07-17 00:05:00+00
ac71e22d-32fc-4a2d-a40f-5720ed8f2cbd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.40000000000059	1	1	no error	0.5	2024-07-17 00:06:00+00	2024-07-17 00:09:00+00
9d7d0e0a-a3c9-4bfe-8c95-39f58a72a20c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.50000000000059	1	1	no error	0.5	2024-07-17 00:10:00+00	2024-07-17 00:14:00+00
6ab554eb-2eac-432e-87ec-5f8a32c95c37	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.60000000000059	1	1	no error	0.5	2024-07-17 00:15:00+00	2024-07-17 00:20:00+00
fa470e1b-fd5d-4a63-a921-3db813ff23c5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.70000000000059	1	1	no error	0.5	2024-07-17 00:21:00+00	2024-07-17 00:27:00+00
1fbc8d42-d980-4b12-80e3-036527586f96	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.800000000000594	1	1	no error	0.5	2024-07-17 00:28:00+00	2024-07-17 00:35:00+00
17095b22-9ef5-43c1-b457-864bd6487639	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	60.900000000000595	1	1	no error	0.5	2024-07-17 00:36:00+00	2024-07-17 00:44:00+00
e7e03e7f-479b-4a50-87ab-b52c35dd9430	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.0000000000006	1	1	no error	0.5	2024-07-17 00:45:00+00	2024-07-17 00:54:00+00
5772eea3-66dc-4b7e-b972-2bc106d3ac0e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.1000000000006	1	1	no error	0.5	2024-07-17 00:55:00+00	2024-07-17 00:55:00+00
8c5de909-25be-4adb-a8dc-4c08b1648c0d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.2000000000006	1	1	no error	0.5	2024-07-17 00:56:00+00	2024-07-17 00:57:00+00
630b9507-1bd3-4368-8b6d-b332864925c9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.3000000000006	1	1	no error	0.5	2024-07-17 00:58:00+00	2024-07-17 01:00:00+00
1449f3b0-de8f-47ea-8b90-842f3d69b604	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.4000000000006	1	1	no error	0.5	2024-07-17 01:01:00+00	2024-07-17 01:04:00+00
e0f226d8-9e4f-46d0-b167-7a90a1bc278a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.500000000000604	1	1	no error	0.5	2024-07-17 01:05:00+00	2024-07-17 01:09:00+00
1a4b92ba-d146-4194-a7c1-da53016875f0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.600000000000605	1	1	no error	0.5	2024-07-17 01:10:00+00	2024-07-17 01:15:00+00
5bb522ae-fc36-4b66-b1be-a92b708989ce	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.70000000000061	1	1	no error	0.5	2024-07-17 01:16:00+00	2024-07-17 01:22:00+00
efb68833-b3de-4840-8e02-be1225cff53c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.80000000000061	1	1	no error	0.5	2024-07-17 01:23:00+00	2024-07-17 01:30:00+00
9e122c75-3e19-4d27-85eb-33424348120a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	61.90000000000061	1	1	no error	0.5	2024-07-17 01:31:00+00	2024-07-17 01:39:00+00
ebc00873-3d74-4371-aebf-0fb5793d80b7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.00000000000061	1	1	no error	0.5	2024-07-17 01:40:00+00	2024-07-17 01:49:00+00
6d651491-6d21-47a8-837f-7a981b6349e3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.10000000000061	1	1	no error	0.5	2024-07-17 01:50:00+00	2024-07-17 01:50:00+00
bea2dba0-817d-416d-99cc-8b24f985cf20	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.200000000000614	1	1	no error	0.5	2024-07-17 01:51:00+00	2024-07-17 01:52:00+00
5181488f-ff0d-4684-a6bc-509a4278b9be	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.300000000000615	1	1	no error	0.5	2024-07-17 01:53:00+00	2024-07-17 01:55:00+00
383b85bf-9e25-4473-8a57-bb3cfa581b61	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.40000000000062	1	1	no error	0.5	2024-07-17 01:56:00+00	2024-07-17 01:59:00+00
b4ff818f-145f-47ab-bcef-09520b8eb8a3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.50000000000062	1	1	no error	0.5	2024-07-17 02:00:00+00	2024-07-17 02:04:00+00
ef5bba8a-210e-4875-9709-66edaa96dbe2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.60000000000062	1	1	no error	0.5	2024-07-17 02:05:00+00	2024-07-17 02:10:00+00
66d42233-0813-4d75-8af6-bad8cc1a7112	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.70000000000062	1	1	no error	0.5	2024-07-17 02:11:00+00	2024-07-17 02:17:00+00
a3d0e86b-05a6-42aa-8b18-a16f14ab4557	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.80000000000062	1	1	no error	0.5	2024-07-17 02:18:00+00	2024-07-17 02:25:00+00
78431a64-e0c8-4824-a41b-c1d703d84f2f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	62.900000000000624	1	1	no error	0.5	2024-07-17 02:26:00+00	2024-07-17 02:34:00+00
dd9fce48-3cbf-4b02-9407-e029525188cf	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.000000000000625	1	1	no error	0.5	2024-07-17 02:35:00+00	2024-07-17 02:44:00+00
19b9dd7a-7c26-4b4f-b28b-d42d624e9d9b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.10000000000063	1	1	no error	0.5	2024-07-17 02:45:00+00	2024-07-17 02:45:00+00
8fd33c3d-acb0-40bd-8dae-078f6619f828	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.20000000000063	1	1	no error	0.5	2024-07-17 02:46:00+00	2024-07-17 02:47:00+00
1b54fb9a-20a8-422b-bc1d-e4a35db6cf05	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.30000000000063	1	1	no error	0.5	2024-07-17 02:48:00+00	2024-07-17 02:50:00+00
a24f2348-1e8b-4896-a80a-43e45be14c6c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.40000000000063	1	1	no error	0.5	2024-07-17 02:51:00+00	2024-07-17 02:54:00+00
86e007e1-3922-43db-a020-7af6084352ba	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.50000000000063	1	1	no error	0.5	2024-07-17 02:55:00+00	2024-07-17 02:59:00+00
6004942c-8b25-43d8-9ec1-c4112daa4952	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.600000000000634	1	1	no error	0.5	2024-07-17 03:00:00+00	2024-07-17 03:05:00+00
8ecd809f-ef60-4aeb-aa3b-3f81ce6379c1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.700000000000635	1	1	no error	0.5	2024-07-17 03:06:00+00	2024-07-17 03:12:00+00
6c45a371-8c1c-4e46-8bb5-b1f626720665	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.80000000000064	1	1	no error	0.5	2024-07-17 03:13:00+00	2024-07-17 03:20:00+00
b60f96f7-1c88-427a-904e-536a1f4b24a0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	63.90000000000064	1	1	no error	0.5	2024-07-17 03:21:00+00	2024-07-17 03:29:00+00
1c6504f2-8dcb-459a-9a52-cd7be2cfdc36	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.00000000000064	1	1	no error	0.5	2024-07-17 03:30:00+00	2024-07-17 03:39:00+00
9178293e-7313-44ae-9e84-63b7d089d938	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.10000000000063	1	1	no error	0.5	2024-07-17 03:40:00+00	2024-07-17 03:40:00+00
72a74e85-dcfc-40fc-b433-379c70851e64	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.20000000000063	1	1	no error	0.5	2024-07-17 03:41:00+00	2024-07-17 03:42:00+00
ef4497f2-620f-4ac8-8dad-1232f32ecb60	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.30000000000062	1	1	no error	0.5	2024-07-17 03:43:00+00	2024-07-17 03:45:00+00
d5882957-f063-4253-9f24-5dad12cf537c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.40000000000062	1	1	no error	0.5	2024-07-17 03:46:00+00	2024-07-17 03:49:00+00
3b643b6e-6879-4fab-9e93-fd2b63fab409	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.50000000000061	1	1	no error	0.5	2024-07-17 03:50:00+00	2024-07-17 03:54:00+00
46eb487e-ec9b-4f75-9136-146a6cd3eec9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.6000000000006	1	1	no error	0.5	2024-07-17 03:55:00+00	2024-07-17 04:00:00+00
c27a752e-1852-4aa8-bd06-bf4b93c3a683	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.7000000000006	1	1	no error	0.5	2024-07-17 04:01:00+00	2024-07-17 04:07:00+00
964b8723-4689-4412-9801-a80eeafc4bd0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.8000000000006	1	1	no error	0.5	2024-07-17 04:08:00+00	2024-07-17 04:15:00+00
55e31759-b3d7-4770-8a77-5d5740fa7e9d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	64.90000000000059	1	1	no error	0.5	2024-07-17 04:16:00+00	2024-07-17 04:24:00+00
620c6a26-3227-4202-959e-afbdae391c02	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.00000000000058	1	1	no error	0.5	2024-07-17 04:25:00+00	2024-07-17 04:34:00+00
2c18cec8-6b64-41c8-ba3a-2a397e6e3a81	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.10000000000058	1	1	no error	0.5	2024-07-17 04:35:00+00	2024-07-17 04:35:00+00
f2a05071-19ce-4543-92fc-8905aba8e219	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.20000000000057	1	1	no error	0.5	2024-07-17 04:36:00+00	2024-07-17 04:37:00+00
bf60b7fe-58cd-4730-8d6b-6ebe6f5b8b0b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.30000000000057	1	1	no error	0.5	2024-07-17 04:38:00+00	2024-07-17 04:40:00+00
d39f7a17-d4b3-4eb9-9772-703b46fd9db4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.40000000000056	1	1	no error	0.5	2024-07-17 04:41:00+00	2024-07-17 04:44:00+00
479cd240-8219-43b1-a9f3-1a99416e4824	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.50000000000055	1	1	no error	0.5	2024-07-17 04:45:00+00	2024-07-17 04:49:00+00
de968d14-4a0f-4cbf-a392-3d3c00f28424	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.60000000000055	1	1	no error	0.5	2024-07-17 04:50:00+00	2024-07-17 04:55:00+00
8bc28429-e232-49e7-82bb-2aba4bd9ae2e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.70000000000054	1	1	no error	0.5	2024-07-17 04:56:00+00	2024-07-17 05:02:00+00
0f6432c9-3768-4257-8347-c8f97ceed58c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.80000000000054	1	1	no error	0.5	2024-07-17 05:03:00+00	2024-07-17 05:10:00+00
6df0efc2-4b60-49f6-aaf3-0f0a1e55d8b8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	65.90000000000053	1	1	no error	0.5	2024-07-17 05:11:00+00	2024-07-17 05:19:00+00
dcf3610d-c447-4f1e-aa00-264211b58097	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.00000000000053	1	1	no error	0.5	2024-07-17 05:20:00+00	2024-07-17 05:29:00+00
4084d9f7-6172-4bd3-8600-f187ad25c84c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.10000000000052	1	1	no error	0.5	2024-07-17 05:30:00+00	2024-07-17 05:30:00+00
405f4eb1-bbe7-45a2-aa89-46d82cfc7c5a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.20000000000051	1	1	no error	0.5	2024-07-17 05:31:00+00	2024-07-17 05:32:00+00
f76325ae-83d9-4d21-a206-0183ca6cc2be	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.30000000000051	1	1	no error	0.5	2024-07-17 05:33:00+00	2024-07-17 05:35:00+00
a41e9476-c4ac-439d-9fbe-e9682a9a5180	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.4000000000005	1	1	no error	0.5	2024-07-17 05:36:00+00	2024-07-17 05:39:00+00
aece80fc-d0a0-4170-b6bf-8068f52bed5c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.5000000000005	1	1	no error	0.5	2024-07-17 05:40:00+00	2024-07-17 05:44:00+00
dcf55fb4-ab29-4e46-be1b-191cfcb2836c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.60000000000049	1	1	no error	0.5	2024-07-17 05:45:00+00	2024-07-17 05:50:00+00
5fa4d71f-a307-46cd-9a2e-9cefe7e65126	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.70000000000049	1	1	no error	0.5	2024-07-17 05:51:00+00	2024-07-17 05:57:00+00
abe4826e-097b-4a10-b1b0-f073a182e357	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.80000000000048	1	1	no error	0.5	2024-07-17 05:58:00+00	2024-07-17 06:05:00+00
c111a96c-7284-4760-a4e9-d8fd21a5cac1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	66.90000000000047	1	1	no error	0.5	2024-07-17 06:06:00+00	2024-07-17 06:14:00+00
1b98390b-34a6-40a8-bbcf-f0b7caccda2f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.00000000000047	1	1	no error	0.5	2024-07-17 06:15:00+00	2024-07-17 06:24:00+00
b120143d-3719-4c16-9727-be791b90f5a6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.10000000000046	1	1	no error	0.5	2024-07-17 06:25:00+00	2024-07-17 06:25:00+00
91f38b99-b098-4a2b-b1ec-a23fb8647cef	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.20000000000046	1	1	no error	0.5	2024-07-17 06:26:00+00	2024-07-17 06:27:00+00
2cafe30b-a073-4494-98cd-dc457bc6f304	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.30000000000045	1	1	no error	0.5	2024-07-17 06:28:00+00	2024-07-17 06:30:00+00
6eb521a2-b664-4a60-a476-d17ad0cd183f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.40000000000045	1	1	no error	0.5	2024-07-17 06:31:00+00	2024-07-17 06:34:00+00
a86b373c-5dd4-412d-9f56-f6ae30915a6c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.50000000000044	1	1	no error	0.5	2024-07-17 06:35:00+00	2024-07-17 06:39:00+00
9e46ab83-8b89-4b88-bead-6fa42cf7f238	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.60000000000043	1	1	no error	0.5	2024-07-17 06:40:00+00	2024-07-17 06:45:00+00
26cd8164-80d7-4181-b752-f11ef080af67	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.70000000000043	1	1	no error	0.5	2024-07-17 06:46:00+00	2024-07-17 06:52:00+00
9d111292-6a28-4459-8cd8-d43828b9ff22	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.80000000000042	1	1	no error	0.5	2024-07-17 06:53:00+00	2024-07-17 07:00:00+00
5ff263ed-4733-40d6-85c4-f7c00f151336	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	67.90000000000042	1	1	no error	0.5	2024-07-17 07:01:00+00	2024-07-17 07:09:00+00
c59874b7-9947-4ea8-a64f-81d44792ed3b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.00000000000041	1	1	no error	0.5	2024-07-17 07:10:00+00	2024-07-17 07:19:00+00
07ee3f88-a47c-4713-a144-84f855cbafc8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.1000000000004	1	1	no error	0.5	2024-07-17 07:20:00+00	2024-07-17 07:20:00+00
b1bf7bf0-fb0f-4a4b-9783-5d0401357f2f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.2000000000004	1	1	no error	0.5	2024-07-17 07:21:00+00	2024-07-17 07:22:00+00
1d15eec2-b528-40ca-97f8-15aeccbfca87	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.3000000000004	1	1	no error	0.5	2024-07-17 07:23:00+00	2024-07-17 07:25:00+00
09b5b65a-ae5f-47ef-92da-444f1d8364c1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.40000000000039	1	1	no error	0.5	2024-07-17 07:26:00+00	2024-07-17 07:29:00+00
b8cb738e-f7ee-4a08-a436-143905533f44	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.50000000000038	1	1	no error	0.5	2024-07-17 07:30:00+00	2024-07-17 07:34:00+00
dcf9a552-0514-4d6d-9a35-a85cde115c43	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.60000000000038	1	1	no error	0.5	2024-07-17 07:35:00+00	2024-07-17 07:40:00+00
942b4b41-85dc-4932-a058-6a444951d8ce	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.70000000000037	1	1	no error	0.5	2024-07-17 07:41:00+00	2024-07-17 07:47:00+00
1e31a5bd-ce66-435f-b2a4-fed44877bd86	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.80000000000037	1	1	no error	0.5	2024-07-17 07:48:00+00	2024-07-17 07:55:00+00
7bd546e6-0417-4b86-8e82-6d653ee62ed7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	68.90000000000036	1	1	no error	0.5	2024-07-17 07:56:00+00	2024-07-17 08:04:00+00
a7f077ce-1334-45ac-a5b4-8e04dc75a87b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.00000000000036	1	1	no error	0.5	2024-07-17 08:05:00+00	2024-07-17 08:14:00+00
42a58796-f913-449b-8a98-40cf9aad2d1c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.10000000000035	1	1	no error	0.5	2024-07-17 08:15:00+00	2024-07-17 08:15:00+00
57fc9f83-5a06-4150-8e40-41339c1a8974	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.20000000000034	1	1	no error	0.5	2024-07-17 08:16:00+00	2024-07-17 08:17:00+00
ea979be9-78ed-41b7-a165-ed3747666483	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.30000000000034	1	1	no error	0.5	2024-07-17 08:18:00+00	2024-07-17 08:20:00+00
e5f82b55-cfb4-4654-a139-99407f126a37	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.40000000000033	1	1	no error	0.5	2024-07-17 08:21:00+00	2024-07-17 08:24:00+00
a44e431b-0598-4230-b919-98ced2082a52	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.50000000000033	1	1	no error	0.5	2024-07-17 08:25:00+00	2024-07-17 08:29:00+00
498e706b-e35c-4172-aba3-6a2d15de4db7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.60000000000032	1	1	no error	0.5	2024-07-17 08:30:00+00	2024-07-17 08:35:00+00
30bcf41c-b1a8-4841-bd58-f1c1c906e590	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.70000000000032	1	1	no error	0.5	2024-07-17 08:36:00+00	2024-07-17 08:42:00+00
aa6165bb-68b6-481f-9dc6-2d0621c8198b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.80000000000031	1	1	no error	0.5	2024-07-17 08:43:00+00	2024-07-17 08:50:00+00
c2c1d1a6-c4cd-49ca-91ca-2bd1df5923d3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	69.9000000000003	1	1	no error	0.5	2024-07-17 08:51:00+00	2024-07-17 08:59:00+00
53db3b1c-c2e1-49c2-b18a-12e069dcedfd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.0000000000003	1	1	no error	0.5	2024-07-17 09:00:00+00	2024-07-17 09:09:00+00
36966e6a-4cef-4b41-8295-7e527636eb5f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.10000000000029	1	1	no error	0.5	2024-07-17 09:10:00+00	2024-07-17 09:10:00+00
ff567037-0cfe-4005-97a7-e985d4bc9364	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.20000000000029	1	1	no error	0.5	2024-07-17 09:11:00+00	2024-07-17 09:12:00+00
cf6f7bdd-a9df-4295-9517-8d7ccac04cb6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.30000000000028	1	1	no error	0.5	2024-07-17 09:13:00+00	2024-07-17 09:15:00+00
07a72d96-56d1-4ccb-a59f-b606f471a374	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.40000000000028	1	1	no error	0.5	2024-07-17 09:16:00+00	2024-07-17 09:19:00+00
609a90d2-6d57-4244-8d23-c7d9e8e41cf3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.50000000000027	1	1	no error	0.5	2024-07-17 09:20:00+00	2024-07-17 09:24:00+00
95c80f3d-4bfd-4b80-b4d7-d823c369a840	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.60000000000026	1	1	no error	0.5	2024-07-17 09:25:00+00	2024-07-17 09:30:00+00
c7e2c4dd-5a8d-4753-b823-245a91005491	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.70000000000026	1	1	no error	0.5	2024-07-17 09:31:00+00	2024-07-17 09:37:00+00
88653c2f-e643-44a4-8bef-98ba49753a5d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.80000000000025	1	1	no error	0.5	2024-07-17 09:38:00+00	2024-07-17 09:45:00+00
dd766e5c-1ff7-4116-bda5-e8d2655997fb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	70.90000000000025	1	1	no error	0.5	2024-07-17 09:46:00+00	2024-07-17 09:54:00+00
fb0395c0-020b-4b3f-9fac-e7c113e63303	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.00000000000024	1	1	no error	0.5	2024-07-17 09:55:00+00	2024-07-17 10:04:00+00
daae29a2-2893-4a94-add3-93b93d7edd2b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.10000000000024	1	1	no error	0.5	2024-07-17 10:05:00+00	2024-07-17 10:05:00+00
28abe69d-02ca-4d6a-a3ec-ec6b089e7d95	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.20000000000023	1	1	no error	0.5	2024-07-17 10:06:00+00	2024-07-17 10:07:00+00
948e917b-5530-400f-811e-98f9d22e8b36	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.30000000000022	1	1	no error	0.5	2024-07-17 10:08:00+00	2024-07-17 10:10:00+00
3524b8ac-110e-4b96-9795-23b2c41ae6d9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.40000000000022	1	1	no error	0.5	2024-07-17 10:11:00+00	2024-07-17 10:14:00+00
3f4c37a8-22bb-466b-a7b0-a1e4d32311d8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.50000000000021	1	1	no error	0.5	2024-07-17 10:15:00+00	2024-07-17 10:19:00+00
26028f16-0487-4d34-8667-5d947d22914b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.60000000000021	1	1	no error	0.5	2024-07-17 10:20:00+00	2024-07-17 10:25:00+00
c256946f-e9a0-486e-a788-b00989a6bd59	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.7000000000002	1	1	no error	0.5	2024-07-17 10:26:00+00	2024-07-17 10:32:00+00
e4212ff5-2e5d-4c79-b285-3d636e0420af	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.8000000000002	1	1	no error	0.5	2024-07-17 10:33:00+00	2024-07-17 10:40:00+00
c2abe038-d86e-4fba-835f-5ba986a26326	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	71.90000000000019	1	1	no error	0.5	2024-07-17 10:41:00+00	2024-07-17 10:49:00+00
c5a7acf5-85a4-496a-b398-b933370ab702	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.00000000000018	1	1	no error	0.5	2024-07-17 10:50:00+00	2024-07-17 10:59:00+00
799ecdaa-fe6d-4bda-adb5-160479d95341	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.10000000000018	1	1	no error	0.5	2024-07-17 11:00:00+00	2024-07-17 11:00:00+00
2bd7f8bc-c08b-4ad4-8930-bb9d49b96eb0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.20000000000017	1	1	no error	0.5	2024-07-17 11:01:00+00	2024-07-17 11:02:00+00
e3918b87-199d-436a-af70-7ebc8f31472d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.30000000000017	1	1	no error	0.5	2024-07-17 11:03:00+00	2024-07-17 11:05:00+00
aa269ab7-3d71-4313-92f1-147fe7078827	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.40000000000016	1	1	no error	0.5	2024-07-17 11:06:00+00	2024-07-17 11:09:00+00
6a146224-9fc0-46f3-912f-1457ecd19827	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.50000000000016	1	1	no error	0.5	2024-07-17 11:10:00+00	2024-07-17 11:14:00+00
c78f077d-85cc-4159-9ebd-bbc00b3b91a7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.60000000000015	1	1	no error	0.5	2024-07-17 11:15:00+00	2024-07-17 11:20:00+00
d8b5009d-3c16-4f36-b674-558d60493d5c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.70000000000014	1	1	no error	0.5	2024-07-17 11:21:00+00	2024-07-17 11:27:00+00
ecdb3e25-b9a4-437f-ba28-f5a470d441b3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.80000000000014	1	1	no error	0.5	2024-07-17 11:28:00+00	2024-07-17 11:35:00+00
7891a11d-34f7-4c02-99e0-38f0da1e6b7b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	72.90000000000013	1	1	no error	0.5	2024-07-17 11:36:00+00	2024-07-17 11:44:00+00
fa3a0f05-ad02-45c5-ac17-edbd47c8742d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.00000000000013	1	1	no error	0.5	2024-07-17 11:45:00+00	2024-07-17 11:54:00+00
3c00dc5c-072a-4c8f-bf97-0f2f3bb183dd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.10000000000012	1	1	no error	0.5	2024-07-17 11:55:00+00	2024-07-17 11:55:00+00
0a277f04-2b22-4b14-a59b-5687faf77f14	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.20000000000012	1	1	no error	0.5	2024-07-17 11:56:00+00	2024-07-17 11:57:00+00
67dda834-1b8f-4903-857e-2d7212a7c841	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.30000000000011	1	1	no error	0.5	2024-07-17 11:58:00+00	2024-07-17 12:00:00+00
3ed34daa-0aec-4a2f-8309-f783383ffeb5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.4000000000001	1	1	no error	0.5	2024-07-17 12:01:00+00	2024-07-17 12:04:00+00
c667151d-a3e7-4e39-b9d0-6d0efc2e9a52	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.5000000000001	1	1	no error	0.5	2024-07-17 12:05:00+00	2024-07-17 12:09:00+00
58330f94-a765-4200-8616-83d95e12af81	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.6000000000001	1	1	no error	0.5	2024-07-17 12:10:00+00	2024-07-17 12:15:00+00
65340619-fde3-4805-9550-b5306960b6e5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.70000000000009	1	1	no error	0.5	2024-07-17 12:16:00+00	2024-07-17 12:22:00+00
ae0dd6f9-1573-4b16-8a62-d23d4d5ed6f9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.80000000000008	1	1	no error	0.5	2024-07-17 12:23:00+00	2024-07-17 12:30:00+00
267ec585-9b73-4aaf-8bb3-a5962ce366fa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	73.90000000000008	1	1	no error	0.5	2024-07-17 12:31:00+00	2024-07-17 12:39:00+00
85523d66-75aa-4d44-a777-52f95b8420d4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.00000000000007	1	1	no error	0.5	2024-07-17 12:40:00+00	2024-07-17 12:49:00+00
51b91bce-706b-4487-b4ed-6545fa328ab1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.10000000000007	1	1	no error	0.5	2024-07-17 12:50:00+00	2024-07-17 12:50:00+00
aeab8fa4-c380-4911-8e45-84ab9a6a35c5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.20000000000006	1	1	no error	0.5	2024-07-17 12:51:00+00	2024-07-17 12:52:00+00
e34f9fd9-1f85-485b-82f8-c56fca18aa85	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.30000000000005	1	1	no error	0.5	2024-07-17 12:53:00+00	2024-07-17 12:55:00+00
e13cdb93-b0f8-403e-b8bc-7f3fefe0067e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.40000000000005	1	1	no error	0.5	2024-07-17 12:56:00+00	2024-07-17 12:59:00+00
448884a9-c255-4c50-87df-b006f185d362	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.50000000000004	1	1	no error	0.5	2024-07-17 13:00:00+00	2024-07-17 13:04:00+00
98208f75-3fc6-4e95-bcc3-73b2de86529b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.60000000000004	1	1	no error	0.5	2024-07-17 13:05:00+00	2024-07-17 13:10:00+00
62083791-d272-4178-830b-f8608cfa28da	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.70000000000003	1	1	no error	0.5	2024-07-17 13:11:00+00	2024-07-17 13:17:00+00
d18ce7d1-0443-4542-9fd1-371d362ecd3d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.80000000000003	1	1	no error	0.5	2024-07-17 13:18:00+00	2024-07-17 13:25:00+00
19778a1a-2e95-4d09-935a-fbdcd7721af4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	74.90000000000002	1	1	no error	0.5	2024-07-17 13:26:00+00	2024-07-17 13:34:00+00
977b6e95-a669-4f57-abd0-d90dad71f8c3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.00000000000001	1	1	no error	0.5	2024-07-17 13:35:00+00	2024-07-17 13:44:00+00
8efc4051-1daa-438a-97bd-d6fe1be7e9ed	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.10000000000001	1	1	no error	0.5	2024-07-17 13:45:00+00	2024-07-17 13:45:00+00
92a12148-c8cd-4657-896c-ed6a1f39783d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.2	1	1	no error	0.5	2024-07-17 13:46:00+00	2024-07-17 13:47:00+00
39c63935-c658-47eb-a334-08e47414eab6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.3	1	1	no error	0.5	2024-07-17 13:48:00+00	2024-07-17 13:50:00+00
bcefbe34-69ce-4a4f-a186-d17cc9f64fd9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.39999999999999	1	1	no error	0.5	2024-07-17 13:51:00+00	2024-07-17 13:54:00+00
671a7a5d-9730-4b63-8923-0a8d65e9cd86	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.49999999999999	1	1	no error	0.5	2024-07-17 13:55:00+00	2024-07-17 13:59:00+00
02cd2bed-85be-4ffd-b05d-a1a7afb4cd1c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.59999999999998	1	1	no error	0.5	2024-07-17 14:00:00+00	2024-07-17 14:05:00+00
392a7706-aeea-42a2-88c5-f93784dede80	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.69999999999997	1	1	no error	0.5	2024-07-17 14:06:00+00	2024-07-17 14:12:00+00
f43f3e48-e8ee-4739-ae7f-9a12a5b17839	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.79999999999997	1	1	no error	0.5	2024-07-17 14:13:00+00	2024-07-17 14:20:00+00
2c52b7c7-8a85-4a6b-aa64-c6bb344a20be	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.89999999999996	1	1	no error	0.5	2024-07-17 14:21:00+00	2024-07-17 14:29:00+00
f5d6e8e9-1050-41dd-a925-1143a56d4988	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	75.99999999999996	1	1	no error	0.5	2024-07-17 14:30:00+00	2024-07-17 14:39:00+00
4a91f072-cb28-45a0-903e-3c6c985c1e12	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.09999999999995	1	1	no error	0.5	2024-07-17 14:40:00+00	2024-07-17 14:40:00+00
9c460692-79fe-4d04-8ff6-e2d9aed97df3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.19999999999995	1	1	no error	0.5	2024-07-17 14:41:00+00	2024-07-17 14:42:00+00
4a6785bd-7878-4943-bae7-a5fa94c9fc7d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.29999999999994	1	1	no error	0.5	2024-07-17 14:43:00+00	2024-07-17 14:45:00+00
afbd4d97-b345-465c-8d95-79d255cf2df7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.39999999999993	1	1	no error	0.5	2024-07-17 14:46:00+00	2024-07-17 14:49:00+00
55bac753-9371-499a-9c16-08c4bf8df238	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.49999999999993	1	1	no error	0.5	2024-07-17 14:50:00+00	2024-07-17 14:54:00+00
c970045d-9f48-426b-b3be-eb844784033c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.59999999999992	1	1	no error	0.5	2024-07-17 14:55:00+00	2024-07-17 15:00:00+00
28fa7824-e0a5-4809-b67e-73ac99fa5df3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.69999999999992	1	1	no error	0.5	2024-07-17 15:01:00+00	2024-07-17 15:07:00+00
4af72566-db3e-48df-b26d-f925f6c78fb3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.79999999999991	1	1	no error	0.5	2024-07-17 15:08:00+00	2024-07-17 15:15:00+00
1e7e6c74-7fa9-4c75-b5c9-4ee0f5c0323d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.8999999999999	1	1	no error	0.5	2024-07-17 15:16:00+00	2024-07-17 15:24:00+00
3c3b3fe7-8506-461a-9f43-f9e83e7dda0c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	76.9999999999999	1	1	no error	0.5	2024-07-17 15:25:00+00	2024-07-17 15:34:00+00
00774082-b483-4cd5-9329-be1e2451914a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.0999999999999	1	1	no error	0.5	2024-07-17 15:35:00+00	2024-07-17 15:35:00+00
85936c35-2480-494c-b510-b254622d06b4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.19999999999989	1	1	no error	0.5	2024-07-17 15:36:00+00	2024-07-17 15:37:00+00
aa6b5d43-0776-42d4-ad83-b1f1212ae145	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.29999999999988	1	1	no error	0.5	2024-07-17 15:38:00+00	2024-07-17 15:40:00+00
9c349745-b234-42ad-97f0-c156c906b7c0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.39999999999988	1	1	no error	0.5	2024-07-17 15:41:00+00	2024-07-17 15:44:00+00
bf8fb86a-96a4-4fc3-acff-e5b8f30cd208	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.49999999999987	1	1	no error	0.5	2024-07-17 15:45:00+00	2024-07-17 15:49:00+00
ece8f6f3-780f-4944-8ff9-08af69fcdf18	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.59999999999987	1	1	no error	0.5	2024-07-17 15:50:00+00	2024-07-17 15:55:00+00
1d170507-75a4-43da-883a-3b13ea7892dd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.69999999999986	1	1	no error	0.5	2024-07-17 15:56:00+00	2024-07-17 16:02:00+00
6d94480e-bbe0-4d1e-9b62-5a867694c660	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.79999999999986	1	1	no error	0.5	2024-07-17 16:03:00+00	2024-07-17 16:10:00+00
c5b23a3e-7c04-4a88-b836-c7ae20003bb8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.89999999999985	1	1	no error	0.5	2024-07-17 16:11:00+00	2024-07-17 16:19:00+00
a400835d-699b-4af1-b0c7-86444e99d1cf	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	77.99999999999984	1	1	no error	0.5	2024-07-17 16:20:00+00	2024-07-17 16:29:00+00
a4a560b2-b3ab-40f8-ab64-63042a0c6e1b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.09999999999984	1	1	no error	0.5	2024-07-17 16:30:00+00	2024-07-17 16:30:00+00
5c69659e-6bc1-4fd4-9540-b781463f6c4b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.19999999999983	1	1	no error	0.5	2024-07-17 16:31:00+00	2024-07-17 16:32:00+00
197f1ace-e19b-4a99-9ad8-88a2fbd1428d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.29999999999983	1	1	no error	0.5	2024-07-17 16:33:00+00	2024-07-17 16:35:00+00
3929a5f8-77a4-4a26-8d33-61718bd8c516	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.39999999999982	1	1	no error	0.5	2024-07-17 16:36:00+00	2024-07-17 16:39:00+00
1d32adf7-9479-4352-b605-e9ea7a4f6e3b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.49999999999982	1	1	no error	0.5	2024-07-17 16:40:00+00	2024-07-17 16:44:00+00
14ff184c-1d0b-4e52-b9c1-4d918a54eda3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.59999999999981	1	1	no error	0.5	2024-07-17 16:45:00+00	2024-07-17 16:50:00+00
621a2d7c-820a-47d8-9a0e-eb9015f2cf82	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.6999999999998	1	1	no error	0.5	2024-07-17 16:51:00+00	2024-07-17 16:57:00+00
7f2b9bf1-d2c0-4087-b02e-1b310dbfb76d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.7999999999998	1	1	no error	0.5	2024-07-17 16:58:00+00	2024-07-17 17:05:00+00
b1fccbd8-3ce9-47c0-b3b6-1a035e4004f4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.89999999999979	1	1	no error	0.5	2024-07-17 17:06:00+00	2024-07-17 17:14:00+00
65545fae-b84d-4409-b4ff-ae9485c5d748	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	78.99999999999979	1	1	no error	0.5	2024-07-17 17:15:00+00	2024-07-17 17:24:00+00
73e8374a-59e4-4580-b615-fa906620e24f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.09999999999978	1	1	no error	0.5	2024-07-17 17:25:00+00	2024-07-17 17:25:00+00
3c74f87c-5f8f-49f3-8e8d-ae4ea1fbdb47	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.19999999999978	1	1	no error	0.5	2024-07-17 17:26:00+00	2024-07-17 17:27:00+00
bbed6e71-5473-434e-8ec1-409417e0cf8a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.29999999999977	1	1	no error	0.5	2024-07-17 17:28:00+00	2024-07-17 17:30:00+00
9bedbdd8-28c2-4231-b1bb-a63c579905fb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.39999999999976	1	1	no error	0.5	2024-07-17 17:31:00+00	2024-07-17 17:34:00+00
2d3e6405-26ea-4ad8-8bd6-d9e8a4cad664	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.49999999999976	1	1	no error	0.5	2024-07-17 17:35:00+00	2024-07-17 17:39:00+00
ff125999-b56f-4ca8-a89e-d6024bfa73d2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.59999999999975	1	1	no error	0.5	2024-07-17 17:40:00+00	2024-07-17 17:45:00+00
04d39804-9a6c-4ef2-862e-930f80250ac0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.69999999999975	1	1	no error	0.5	2024-07-17 17:46:00+00	2024-07-17 17:52:00+00
8de7c5b1-6bed-4103-a026-c35139ff2d97	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.79999999999974	1	1	no error	0.5	2024-07-17 17:53:00+00	2024-07-17 18:00:00+00
c9e2bd80-9362-4e5a-a051-acb816cc69e1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.89999999999974	1	1	no error	0.5	2024-07-17 18:01:00+00	2024-07-17 18:09:00+00
076f03a6-47de-45bc-98b1-4c8797e51e92	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	79.99999999999973	1	1	no error	0.5	2024-07-17 18:10:00+00	2024-07-17 18:19:00+00
df9492b3-a3bb-4a5f-8663-41afa74e43e6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.09999999999972	1	1	no error	0.5	2024-07-17 18:20:00+00	2024-07-17 18:20:00+00
cc73a0af-67bd-4f22-803c-41ff71e62e67	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.19999999999972	1	1	no error	0.5	2024-07-17 18:21:00+00	2024-07-17 18:22:00+00
d1395d23-4a17-48ee-8c81-05d13442b338	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.29999999999971	1	1	no error	0.5	2024-07-17 18:23:00+00	2024-07-17 18:25:00+00
ebd35003-9cac-427d-bda0-a467354d130a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.39999999999971	1	1	no error	0.5	2024-07-17 18:26:00+00	2024-07-17 18:29:00+00
116c81a6-b95c-4b21-b786-358af5df6f16	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.4999999999997	1	1	no error	0.5	2024-07-17 18:30:00+00	2024-07-17 18:34:00+00
030e1870-8f95-4be7-8e35-8f7bf8395d9b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.5999999999997	1	1	no error	0.5	2024-07-17 18:35:00+00	2024-07-17 18:40:00+00
aaa3fead-57ac-4de5-ac9a-192208e58a2e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.69999999999969	1	1	no error	0.5	2024-07-17 18:41:00+00	2024-07-17 18:47:00+00
552acec7-ef92-4e65-9db5-4f7ef5e0a3ca	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.79999999999968	1	1	no error	0.5	2024-07-17 18:48:00+00	2024-07-17 18:55:00+00
5973a23f-3c99-423a-b70e-46a6ffdfceda	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.89999999999968	1	1	no error	0.5	2024-07-17 18:56:00+00	2024-07-17 19:04:00+00
e3559443-eba5-46a5-8d59-9f2069a6ed8b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	80.99999999999967	1	1	no error	0.5	2024-07-17 19:05:00+00	2024-07-17 19:14:00+00
4cb26c88-ef9e-4e86-b306-66533f819c54	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.09999999999967	1	1	no error	0.5	2024-07-17 19:15:00+00	2024-07-17 19:15:00+00
30b012fd-878e-4a1e-9b55-9c3bd5675d8e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.19999999999966	1	1	no error	0.5	2024-07-17 19:16:00+00	2024-07-17 19:17:00+00
6a897558-b175-4e05-a7dd-65b2242008a5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.29999999999966	1	1	no error	0.5	2024-07-17 19:18:00+00	2024-07-17 19:20:00+00
ba680085-1539-40e8-9133-fbff25b25dae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.39999999999965	1	1	no error	0.5	2024-07-17 19:21:00+00	2024-07-17 19:24:00+00
e49d3c6f-76c4-4cec-b9c2-da2aab9d17cb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.49999999999964	1	1	no error	0.5	2024-07-17 19:25:00+00	2024-07-17 19:29:00+00
f46ae2fb-856f-483a-b313-3cfc4a9f62df	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.59999999999964	1	1	no error	0.5	2024-07-17 19:30:00+00	2024-07-17 19:35:00+00
10135522-ee99-4dad-9215-f48079fb045d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.69999999999963	1	1	no error	0.5	2024-07-17 19:36:00+00	2024-07-17 19:42:00+00
3aa04f42-0bca-41e3-84b5-f8828c58a0bc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.79999999999963	1	1	no error	0.5	2024-07-17 19:43:00+00	2024-07-17 19:50:00+00
812eef51-e694-414b-b154-82d25da1eab8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.89999999999962	1	1	no error	0.5	2024-07-17 19:51:00+00	2024-07-17 19:59:00+00
ce3ed14e-d1d7-41c5-a532-e4561cd21a10	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	81.99999999999962	1	1	no error	0.5	2024-07-17 20:00:00+00	2024-07-17 20:09:00+00
1685c3c3-d700-4ca4-8a63-6c89939a2871	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.09999999999961	1	1	no error	0.5	2024-07-17 20:10:00+00	2024-07-17 20:10:00+00
7579a0f8-c190-4598-bb09-03f3953c28a4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.1999999999996	1	1	no error	0.5	2024-07-17 20:11:00+00	2024-07-17 20:12:00+00
bf9ddc07-5830-4bdf-b6fc-9dcfa9de4f9d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.2999999999996	1	1	no error	0.5	2024-07-17 20:13:00+00	2024-07-17 20:15:00+00
be209105-30ab-4f64-8579-738b23a2f757	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.3999999999996	1	1	no error	0.5	2024-07-17 20:16:00+00	2024-07-17 20:19:00+00
33093de6-f102-4bb9-a40b-cb1e1e110fb0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.49999999999959	1	1	no error	0.5	2024-07-17 20:20:00+00	2024-07-17 20:24:00+00
7e96ec55-894b-4ee0-aeb7-992ffb563f0e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.59999999999958	1	1	no error	0.5	2024-07-17 20:25:00+00	2024-07-17 20:30:00+00
c573147f-6468-4e7b-8db1-be6947308bf5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.69999999999958	1	1	no error	0.5	2024-07-17 20:31:00+00	2024-07-17 20:37:00+00
937f66ac-e1f8-426b-891e-24133191d959	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.79999999999957	1	1	no error	0.5	2024-07-17 20:38:00+00	2024-07-17 20:45:00+00
96883d10-a192-45e2-af12-91b5bb844fa7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.89999999999957	1	1	no error	0.5	2024-07-17 20:46:00+00	2024-07-17 20:54:00+00
722ee7eb-ed4f-44a2-9c15-3df876594955	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	82.99999999999956	1	1	no error	0.5	2024-07-17 20:55:00+00	2024-07-17 21:04:00+00
603cb1d3-9727-4738-9574-e7f28c156082	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.09999999999955	1	1	no error	0.5	2024-07-17 21:05:00+00	2024-07-17 21:05:00+00
8bf52b86-caad-4cdd-b729-5604bd4545f8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.19999999999955	1	1	no error	0.5	2024-07-17 21:06:00+00	2024-07-17 21:07:00+00
96fc64cc-543e-4007-bfde-3f34294566ee	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.29999999999954	1	1	no error	0.5	2024-07-17 21:08:00+00	2024-07-17 21:10:00+00
3b1705e9-8221-4477-9c1d-2e2996cb9c7f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.39999999999954	1	1	no error	0.5	2024-07-17 21:11:00+00	2024-07-17 21:14:00+00
86aee4b8-6275-4786-aa56-ba25f3c30fc8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.49999999999953	1	1	no error	0.5	2024-07-17 21:15:00+00	2024-07-17 21:19:00+00
1f032779-5780-4394-ae72-d5d1ae8e106e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.59999999999953	1	1	no error	0.5	2024-07-17 21:20:00+00	2024-07-17 21:25:00+00
84d40ad9-7cab-4bfa-b240-2c6d10cc47f6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.69999999999952	1	1	no error	0.5	2024-07-17 21:26:00+00	2024-07-17 21:32:00+00
1ab45268-20e4-4c61-ba04-d005056cf36b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.79999999999951	1	1	no error	0.5	2024-07-17 21:33:00+00	2024-07-17 21:40:00+00
904bf936-bda7-4e59-9495-59e820f75f1b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.89999999999951	1	1	no error	0.5	2024-07-17 21:41:00+00	2024-07-17 21:49:00+00
3f489416-5bd9-4e29-bd5d-cd5aec6da8f9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	83.9999999999995	1	1	no error	0.5	2024-07-17 21:50:00+00	2024-07-17 21:59:00+00
12b2b7c9-d6b5-4f5f-b817-803e269c529d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.0999999999995	1	1	no error	0.5	2024-07-17 22:00:00+00	2024-07-17 22:00:00+00
e07966a1-515a-416c-ac14-3adf75445f67	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.19999999999949	1	1	no error	0.5	2024-07-17 22:01:00+00	2024-07-17 22:02:00+00
e0a55de1-4b6f-4c74-a9a3-0738ea2a44f3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.29999999999949	1	1	no error	0.5	2024-07-17 22:03:00+00	2024-07-17 22:05:00+00
f3262929-6d3c-4c59-a274-8add94ae767c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.39999999999948	1	1	no error	0.5	2024-07-17 22:06:00+00	2024-07-17 22:09:00+00
6fc2021d-b608-4e4e-afac-f7195474f19a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.49999999999947	1	1	no error	0.5	2024-07-17 22:10:00+00	2024-07-17 22:14:00+00
65094ec2-0182-4238-9acf-a0f349217463	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.59999999999947	1	1	no error	0.5	2024-07-17 22:15:00+00	2024-07-17 22:20:00+00
453644eb-0a72-4321-9dea-936068ec0412	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.69999999999946	1	1	no error	0.5	2024-07-17 22:21:00+00	2024-07-17 22:27:00+00
6492c5bb-62d0-4598-ae31-70143663b4c5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.79999999999946	1	1	no error	0.5	2024-07-17 22:28:00+00	2024-07-17 22:35:00+00
36c5cd9f-4434-4e7b-9dcf-0722dfd5b49d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.89999999999945	1	1	no error	0.5	2024-07-17 22:36:00+00	2024-07-17 22:44:00+00
49ec6ed0-d837-4f4a-b946-74b34b2c5864	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	84.99999999999945	1	1	no error	0.5	2024-07-17 22:45:00+00	2024-07-17 22:54:00+00
666bfb0d-cef5-4e36-9c87-d513dd6706c3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.09999999999944	1	1	no error	0.5	2024-07-17 22:55:00+00	2024-07-17 22:55:00+00
bb8618e7-f38f-4bd1-a0e0-db2f43a0efed	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.19999999999943	1	1	no error	0.5	2024-07-17 22:56:00+00	2024-07-17 22:57:00+00
256d2976-7186-442e-8d42-f713431593e8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.29999999999943	1	1	no error	0.5	2024-07-17 22:58:00+00	2024-07-17 23:00:00+00
59d5d013-b5be-4416-86ca-dbe4bb2779c7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.39999999999942	1	1	no error	0.5	2024-07-17 23:01:00+00	2024-07-17 23:04:00+00
fe93250e-02c4-4293-8fd5-3e0caaab5330	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.49999999999942	1	1	no error	0.5	2024-07-17 23:05:00+00	2024-07-17 23:09:00+00
04e1011e-1a0a-4eb2-bf81-3a6c197e385b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.59999999999941	1	1	no error	0.5	2024-07-17 23:10:00+00	2024-07-17 23:15:00+00
8c69486b-22de-4359-8c55-a05d1ea3ccae	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.6999999999994	1	1	no error	0.5	2024-07-17 23:16:00+00	2024-07-17 23:22:00+00
d618cd09-81c8-4244-b2ae-009352786df5	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.7999999999994	1	1	no error	0.5	2024-07-17 23:23:00+00	2024-07-17 23:30:00+00
c5efbb1f-694c-4a1b-8161-ac48725e1742	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.8999999999994	1	1	no error	0.5	2024-07-17 23:31:00+00	2024-07-17 23:39:00+00
bb553714-5fa3-4b4e-a7d9-c4ba4d2b2290	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	85.99999999999939	1	1	no error	0.5	2024-07-17 23:40:00+00	2024-07-17 23:49:00+00
e81e357d-0e2d-462c-a8de-eeb721b15c59	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.09999999999938	1	1	no error	0.5	2024-07-17 23:50:00+00	2024-07-17 23:50:00+00
7631550e-e320-4244-b355-7989ce108e79	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.19999999999938	1	1	no error	0.5	2024-07-17 23:51:00+00	2024-07-17 23:52:00+00
8192438a-7f16-49ff-b6d0-b59d1e8fead1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.29999999999937	1	1	no error	0.5	2024-07-17 23:53:00+00	2024-07-17 23:55:00+00
67411c68-5e0f-4fbb-a365-9f2716471c18	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.39999999999937	1	1	no error	0.5	2024-07-17 23:56:00+00	2024-07-17 23:59:00+00
ba6148b5-6138-493e-845f-9ee7aafde901	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.49999999999936	1	1	no error	0.5	2024-07-18 00:00:00+00	2024-07-18 00:04:00+00
c600662f-6f71-42c1-931f-71c043106472	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.59999999999935	1	1	no error	0.5	2024-07-18 00:05:00+00	2024-07-18 00:10:00+00
4b8f192a-480d-48d4-ae86-40587310c803	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.69999999999935	1	1	no error	0.5	2024-07-18 00:11:00+00	2024-07-18 00:17:00+00
7210aee4-94f1-4e21-8fa6-890131d34be3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.79999999999934	1	1	no error	0.5	2024-07-18 00:18:00+00	2024-07-18 00:25:00+00
8520dd48-c9a3-4482-88c5-77cdeb0f6c8e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.89999999999934	1	1	no error	0.5	2024-07-18 00:26:00+00	2024-07-18 00:34:00+00
df8f8d96-ac5e-420b-8095-5711601e33f0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	86.99999999999933	1	1	no error	0.5	2024-07-18 00:35:00+00	2024-07-18 00:44:00+00
08e19c9a-2dc0-4dbe-9713-68f01b34e0fc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.09999999999933	1	1	no error	0.5	2024-07-18 00:45:00+00	2024-07-18 00:45:00+00
68833f38-3113-4494-84de-f9be72992330	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.19999999999932	1	1	no error	0.5	2024-07-18 00:46:00+00	2024-07-18 00:47:00+00
30dfe5c8-02b4-40ef-b62f-8038c6253e6f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.29999999999932	1	1	no error	0.5	2024-07-18 00:48:00+00	2024-07-18 00:50:00+00
6f51977f-80eb-4b63-a4ca-b5fc93154a80	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.39999999999931	1	1	no error	0.5	2024-07-18 00:51:00+00	2024-07-18 00:54:00+00
21cde1ce-f8dc-44f5-b6db-7ab5e137634a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.4999999999993	1	1	no error	0.5	2024-07-18 00:55:00+00	2024-07-18 00:59:00+00
006e4233-8459-44e1-b676-222f0dc211a2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.5999999999993	1	1	no error	0.5	2024-07-18 01:00:00+00	2024-07-18 01:05:00+00
951eca44-f2b9-4eea-b19a-67d5671e36eb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.69999999999929	1	1	no error	0.5	2024-07-18 01:06:00+00	2024-07-18 01:12:00+00
3f4c8bc0-3cb7-4f50-835f-cb2db01e0952	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.79999999999929	1	1	no error	0.5	2024-07-18 01:13:00+00	2024-07-18 01:20:00+00
26d83abe-2e30-427d-ba88-e8e565097be6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.89999999999928	1	1	no error	0.5	2024-07-18 01:21:00+00	2024-07-18 01:29:00+00
8b502d0d-8dc2-45fe-820d-592537996c7f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	87.99999999999928	1	1	no error	0.5	2024-07-18 01:30:00+00	2024-07-18 01:39:00+00
3cf49c62-bb28-4251-b035-f7682344d8a1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.09999999999927	1	1	no error	0.5	2024-07-18 01:40:00+00	2024-07-18 01:40:00+00
29c7b882-7c96-4379-a507-fdfe20ba87ac	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.19999999999926	1	1	no error	0.5	2024-07-18 01:41:00+00	2024-07-18 01:42:00+00
a01ef725-0ed6-46a3-b2ad-a2a2ff0ba967	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.29999999999926	1	1	no error	0.5	2024-07-18 01:43:00+00	2024-07-18 01:45:00+00
0b14993a-8887-4144-bf5c-b50e20899373	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.39999999999925	1	1	no error	0.5	2024-07-18 01:46:00+00	2024-07-18 01:49:00+00
f0fb6eef-9afc-4f3e-b6a9-53a8698fe041	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.49999999999925	1	1	no error	0.5	2024-07-18 01:50:00+00	2024-07-18 01:54:00+00
69ea755b-5a4e-40e5-9615-99cd5f7f6ec4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.59999999999924	1	1	no error	0.5	2024-07-18 01:55:00+00	2024-07-18 02:00:00+00
54aad328-3dc0-475d-b59e-e253ef0b57aa	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.69999999999924	1	1	no error	0.5	2024-07-18 02:01:00+00	2024-07-18 02:07:00+00
e131b72d-f277-4f33-aab8-1a3474d08828	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.79999999999923	1	1	no error	0.5	2024-07-18 02:08:00+00	2024-07-18 02:15:00+00
15792048-1a03-4a04-8fd4-f1e77092b78b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.89999999999922	1	1	no error	0.5	2024-07-18 02:16:00+00	2024-07-18 02:24:00+00
d40499c6-78d9-40dd-8048-05e1c1a1d45f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	88.99999999999922	1	1	no error	0.5	2024-07-18 02:25:00+00	2024-07-18 02:34:00+00
b125b822-7212-4b42-914c-6638e6addb3f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.09999999999921	1	1	no error	0.5	2024-07-18 02:35:00+00	2024-07-18 02:35:00+00
f0f37415-3479-42b0-a500-df96da0d077d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.1999999999992	1	1	no error	0.5	2024-07-18 02:36:00+00	2024-07-18 02:37:00+00
15dccf14-4507-40c5-8fbb-e5d16e52a8fc	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.2999999999992	1	1	no error	0.5	2024-07-18 02:38:00+00	2024-07-18 02:40:00+00
1246e651-adc8-4392-a633-547fe56bedc9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.3999999999992	1	1	no error	0.5	2024-07-18 02:41:00+00	2024-07-18 02:44:00+00
8e1e67c1-0f9c-41bd-971a-abb2915a43ba	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.49999999999919	1	1	no error	0.5	2024-07-18 02:45:00+00	2024-07-18 02:49:00+00
b97b4d03-a817-46f6-ae6e-5ac27157be54	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.59999999999918	1	1	no error	0.5	2024-07-18 02:50:00+00	2024-07-18 02:55:00+00
ec4fb984-eaca-4d8c-b291-7ec76c26f4f2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.69999999999918	1	1	no error	0.5	2024-07-18 02:56:00+00	2024-07-18 03:02:00+00
bf74891d-c04f-4bdf-8c4d-ad7993ed8217	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.79999999999917	1	1	no error	0.5	2024-07-18 03:03:00+00	2024-07-18 03:10:00+00
b333c45b-68e3-4936-babf-c1969e70e5d1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.89999999999917	1	1	no error	0.5	2024-07-18 03:11:00+00	2024-07-18 03:19:00+00
d121e0ae-9cf2-4efd-89c4-669a6d7853d3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	89.99999999999916	1	1	no error	0.5	2024-07-18 03:20:00+00	2024-07-18 03:29:00+00
e4fdbbbd-e559-41ec-a5d1-57c7ef5a78df	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.09999999999916	1	1	no error	0.5	2024-07-18 03:30:00+00	2024-07-18 03:30:00+00
0736a7a0-92db-4768-91c0-67e04cda04cb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.19999999999915	1	1	no error	0.5	2024-07-18 03:31:00+00	2024-07-18 03:32:00+00
1ab8d804-513b-4ede-bdb9-f759d8535d77	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.29999999999914	1	1	no error	0.5	2024-07-18 03:33:00+00	2024-07-18 03:35:00+00
d5e22d8c-e6e5-43fc-aa9a-f746d03681b1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.39999999999914	1	1	no error	0.5	2024-07-18 03:36:00+00	2024-07-18 03:39:00+00
f32dd8ec-0126-4ab5-9f49-54f39d6322a8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.49999999999913	1	1	no error	0.5	2024-07-18 03:40:00+00	2024-07-18 03:44:00+00
8e7d5bb3-cc15-4127-8d3d-7ecb638c72bf	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.59999999999913	1	1	no error	0.5	2024-07-18 03:45:00+00	2024-07-18 03:50:00+00
7b167d9b-fa99-4885-a285-bc891aeaaae0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.69999999999912	1	1	no error	0.5	2024-07-18 03:51:00+00	2024-07-18 03:57:00+00
65fde4e5-8ded-4356-beb2-2a182f935c1c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.79999999999912	1	1	no error	0.5	2024-07-18 03:58:00+00	2024-07-18 04:05:00+00
badae9c3-10e0-4e24-9850-15a28869da3b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.89999999999911	1	1	no error	0.5	2024-07-18 04:06:00+00	2024-07-18 04:14:00+00
431a07fa-1d90-4f42-9109-3238b9e568b4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	90.9999999999991	1	1	no error	0.5	2024-07-18 04:15:00+00	2024-07-18 04:24:00+00
0ff752a2-47b4-4255-bc48-e914103f7af0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.0999999999991	1	1	no error	0.5	2024-07-18 04:25:00+00	2024-07-18 04:25:00+00
055941a7-0eb2-4291-9fc7-dd46f1303fc3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.1999999999991	1	1	no error	0.5	2024-07-18 04:26:00+00	2024-07-18 04:27:00+00
64d7e737-30c3-47ce-ac2a-d528e48f1cbb	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.29999999999909	1	1	no error	0.5	2024-07-18 04:28:00+00	2024-07-18 04:30:00+00
ba5a6480-11e8-400f-965d-9c0d4b8f3fb1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.39999999999908	1	1	no error	0.5	2024-07-18 04:31:00+00	2024-07-18 04:34:00+00
1879adf7-dade-402f-8203-c1c3dcf1a61a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.49999999999908	1	1	no error	0.5	2024-07-18 04:35:00+00	2024-07-18 04:39:00+00
0eff0e0d-a5e2-474f-a9de-ee3a2a769e44	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.59999999999907	1	1	no error	0.5	2024-07-18 04:40:00+00	2024-07-18 04:45:00+00
e2dd8e1d-dec0-421e-87ff-73d45c1f1397	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.69999999999906	1	1	no error	0.5	2024-07-18 04:46:00+00	2024-07-18 04:52:00+00
0cb3bec6-73c9-47ca-8c9d-1e91436aef73	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.79999999999906	1	1	no error	0.5	2024-07-18 04:53:00+00	2024-07-18 05:00:00+00
34e3f251-ab40-4610-9607-a2afdf4f0af9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.89999999999905	1	1	no error	0.5	2024-07-18 05:01:00+00	2024-07-18 05:09:00+00
f3779a50-4d72-4ba7-9d12-9aad619e4c3d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	91.99999999999905	1	1	no error	0.5	2024-07-18 05:10:00+00	2024-07-18 05:19:00+00
b846797b-3642-4e28-8841-447946227b75	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.09999999999904	1	1	no error	0.5	2024-07-18 05:20:00+00	2024-07-18 05:20:00+00
fdff8bc5-39f5-4fb0-8283-212ff3b45d77	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.19999999999904	1	1	no error	0.5	2024-07-18 05:21:00+00	2024-07-18 05:22:00+00
466776dc-bcd4-4054-aa07-4b6eafea95cd	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.29999999999903	1	1	no error	0.5	2024-07-18 05:23:00+00	2024-07-18 05:25:00+00
0f9e64cd-a0bd-453b-be26-31698c020fbe	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.39999999999903	1	1	no error	0.5	2024-07-18 05:26:00+00	2024-07-18 05:29:00+00
39b966e3-79dc-4c99-9844-1b5575509d05	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.49999999999902	1	1	no error	0.5	2024-07-18 05:30:00+00	2024-07-18 05:34:00+00
54617d95-3409-4d22-9a8c-6091bd282714	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.59999999999901	1	1	no error	0.5	2024-07-18 05:35:00+00	2024-07-18 05:40:00+00
0ae7d903-cbd2-4104-89a0-09dcf8647e49	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.69999999999901	1	1	no error	0.5	2024-07-18 05:41:00+00	2024-07-18 05:47:00+00
6c09b184-dc7f-4985-84f1-27c1e3aaa569	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.799999999999	1	1	no error	0.5	2024-07-18 05:48:00+00	2024-07-18 05:55:00+00
68ce8bf6-1075-4a16-96e3-9ecf2e33723f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.899999999999	1	1	no error	0.5	2024-07-18 05:56:00+00	2024-07-18 06:04:00+00
5d7fe45e-3f63-4c95-9735-17e2905a6995	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	92.99999999999899	1	1	no error	0.5	2024-07-18 06:05:00+00	2024-07-18 06:14:00+00
f03e8d63-c06c-4ff8-af83-9daa503ea369	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.09999999999899	1	1	no error	0.5	2024-07-18 06:15:00+00	2024-07-18 06:15:00+00
eebd5599-4143-4648-b0d3-d32d105cb76e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.19999999999898	1	1	no error	0.5	2024-07-18 06:16:00+00	2024-07-18 06:17:00+00
c0a5eeff-480a-4380-ab39-2806fc045b6e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.29999999999897	1	1	no error	0.5	2024-07-18 06:18:00+00	2024-07-18 06:20:00+00
66091048-4773-4b02-b9ab-3e751c671482	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.39999999999897	1	1	no error	0.5	2024-07-18 06:21:00+00	2024-07-18 06:24:00+00
7009f2df-4c6f-4cb1-a0b8-34cadb75de1c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.49999999999896	1	1	no error	0.5	2024-07-18 06:25:00+00	2024-07-18 06:29:00+00
f993e612-efbe-45b2-adfd-4ddf56bbd7a0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.59999999999896	1	1	no error	0.5	2024-07-18 06:30:00+00	2024-07-18 06:35:00+00
7357df4a-e708-4d25-bcc7-12482bc07832	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.69999999999895	1	1	no error	0.5	2024-07-18 06:36:00+00	2024-07-18 06:42:00+00
00aaf378-235b-47ac-b9ff-c14d3d6162b4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.79999999999895	1	1	no error	0.5	2024-07-18 06:43:00+00	2024-07-18 06:50:00+00
fcce5414-cea7-4ec9-b495-3026b9a3146b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.89999999999894	1	1	no error	0.5	2024-07-18 06:51:00+00	2024-07-18 06:59:00+00
6b41544f-d3fd-4ab7-9c92-e9fc37dd8b70	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	93.99999999999893	1	1	no error	0.5	2024-07-18 07:00:00+00	2024-07-18 07:09:00+00
53939516-2715-46cd-a1e9-d793363d55d0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.09999999999893	1	1	no error	0.5	2024-07-18 07:10:00+00	2024-07-18 07:10:00+00
e96e1306-fa57-4e71-b9ee-e3f9863f3644	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.19999999999892	1	1	no error	0.5	2024-07-18 07:11:00+00	2024-07-18 07:12:00+00
f268985d-6606-4249-bd99-0db479a7a2c1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.29999999999892	1	1	no error	0.5	2024-07-18 07:13:00+00	2024-07-18 07:15:00+00
e99df796-f36d-4bee-bbfa-028614d60b30	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.39999999999891	1	1	no error	0.5	2024-07-18 07:16:00+00	2024-07-18 07:19:00+00
239688a9-1891-4129-aa0c-bdadae9eccb4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.4999999999989	1	1	no error	0.5	2024-07-18 07:20:00+00	2024-07-18 07:24:00+00
365dfbb5-1f14-4d1b-832a-43de9611eda4	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.5999999999989	1	1	no error	0.5	2024-07-18 07:25:00+00	2024-07-18 07:30:00+00
49f80010-a495-42bf-9f7b-5fdc7f7af4a7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.6999999999989	1	1	no error	0.5	2024-07-18 07:31:00+00	2024-07-18 07:37:00+00
ef8e964c-070f-4240-9dd4-106ab7ca6982	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.79999999999889	1	1	no error	0.5	2024-07-18 07:38:00+00	2024-07-18 07:45:00+00
2a750bc7-86f3-48e7-967e-856088864e0d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.89999999999888	1	1	no error	0.5	2024-07-18 07:46:00+00	2024-07-18 07:54:00+00
f4fd73ff-354f-41a7-a9b3-792ce48c5dff	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	94.99999999999888	1	1	no error	0.5	2024-07-18 07:55:00+00	2024-07-18 08:04:00+00
ce140d0c-d629-4466-984b-6c93024defc2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.09999999999887	1	1	no error	0.5	2024-07-18 08:05:00+00	2024-07-18 08:05:00+00
0f4f1332-bf73-4ff5-b986-0068fdd74ae7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.19999999999887	1	1	no error	0.5	2024-07-18 08:06:00+00	2024-07-18 08:07:00+00
dec2246a-a162-4434-bcdd-40a37f823a70	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.29999999999886	1	1	no error	0.5	2024-07-18 08:08:00+00	2024-07-18 08:10:00+00
620b6850-bb85-4823-81ae-5f7938f43134	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.39999999999885	1	1	no error	0.5	2024-07-18 08:11:00+00	2024-07-18 08:14:00+00
33c6d042-fd94-4d69-aac6-20bbe65ca095	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.49999999999885	1	1	no error	0.5	2024-07-18 08:15:00+00	2024-07-18 08:19:00+00
25152b85-4d5f-45e5-a7c3-160a7bdbd2ff	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.59999999999884	1	1	no error	0.5	2024-07-18 08:20:00+00	2024-07-18 08:25:00+00
d204d751-e17f-44d5-9fe0-b6338faf5f04	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.69999999999884	1	1	no error	0.5	2024-07-18 08:26:00+00	2024-07-18 08:32:00+00
42b680b9-67c6-4cc2-8b95-519390b5bc4a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.79999999999883	1	1	no error	0.5	2024-07-18 08:33:00+00	2024-07-18 08:40:00+00
5088941f-0748-4060-99fa-ad7ed1fd598c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.89999999999883	1	1	no error	0.5	2024-07-18 08:41:00+00	2024-07-18 08:49:00+00
51a83532-723c-433c-bed5-c618fd46d950	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	95.99999999999882	1	1	no error	0.5	2024-07-18 08:50:00+00	2024-07-18 08:59:00+00
996d952c-c2c0-479f-81e9-9efea5ca80ef	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.09999999999881	1	1	no error	0.5	2024-07-18 09:00:00+00	2024-07-18 09:00:00+00
da04be1b-73d1-436c-8c30-26bd2a2afd87	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.19999999999881	1	1	no error	0.5	2024-07-18 09:01:00+00	2024-07-18 09:02:00+00
b62822c0-2899-4541-b064-7b435c154d9b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.2999999999988	1	1	no error	0.5	2024-07-18 09:03:00+00	2024-07-18 09:05:00+00
ffd49b69-93c7-4dfd-ab9f-6c4254e190a7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.3999999999988	1	1	no error	0.5	2024-07-18 09:06:00+00	2024-07-18 09:09:00+00
f6b31a5e-9ba5-4389-b8da-33594d2c1ab2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.49999999999879	1	1	no error	0.5	2024-07-18 09:10:00+00	2024-07-18 09:14:00+00
0c2b2f72-76e5-4799-b510-71059d58dff9	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.59999999999879	1	1	no error	0.5	2024-07-18 09:15:00+00	2024-07-18 09:20:00+00
0f58653d-312e-442f-8b90-98a8806b305b	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.69999999999878	1	1	no error	0.5	2024-07-18 09:21:00+00	2024-07-18 09:27:00+00
c9ca58d9-b931-4d25-bf0f-12af41f69003	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.79999999999878	1	1	no error	0.5	2024-07-18 09:28:00+00	2024-07-18 09:35:00+00
32c251ce-c19a-4857-8f07-66570361a6e7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.89999999999877	1	1	no error	0.5	2024-07-18 09:36:00+00	2024-07-18 09:44:00+00
2f2a8eec-d766-4891-ad37-2246c0d881f3	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	96.99999999999876	1	1	no error	0.5	2024-07-18 09:45:00+00	2024-07-18 09:54:00+00
04e302da-5e67-4bdb-8c82-d737b78f67ec	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.09999999999876	1	1	no error	0.5	2024-07-18 09:55:00+00	2024-07-18 09:55:00+00
2c498d49-73fe-459f-b2f9-c0714c9e26f6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.19999999999875	1	1	no error	0.5	2024-07-18 09:56:00+00	2024-07-18 09:57:00+00
5762adcb-4e2e-48e1-87d7-1e7751ad8317	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.29999999999875	1	1	no error	0.5	2024-07-18 09:58:00+00	2024-07-18 10:00:00+00
854eb50b-d7ee-4f72-a7dc-a14b64dcce30	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.39999999999874	1	1	no error	0.5	2024-07-18 10:01:00+00	2024-07-18 10:04:00+00
2a90a849-cf84-4ef6-9e3a-cafd414ee06d	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.49999999999874	1	1	no error	0.5	2024-07-18 10:05:00+00	2024-07-18 10:09:00+00
f4e5251a-dde0-48d2-95cd-1a365fcedde6	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.59999999999873	1	1	no error	0.5	2024-07-18 10:10:00+00	2024-07-18 10:15:00+00
16c98103-302c-4974-b4f5-dd0ae8fab3ef	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.69999999999872	1	1	no error	0.5	2024-07-18 10:16:00+00	2024-07-18 10:22:00+00
ad9ee575-b95a-4bf9-a29b-3a2524ded51f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.79999999999872	1	1	no error	0.5	2024-07-18 10:23:00+00	2024-07-18 10:30:00+00
2e21f5d8-21b1-469b-b9ee-e686ee6560db	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.89999999999871	1	1	no error	0.5	2024-07-18 10:31:00+00	2024-07-18 10:39:00+00
aa487342-ef87-48f9-bea4-1cc0632e9545	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	97.9999999999987	1	1	no error	0.5	2024-07-18 10:40:00+00	2024-07-18 10:49:00+00
2659c864-6d9b-40ec-96bd-07ff485d464a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.0999999999987	1	1	no error	0.5	2024-07-18 10:50:00+00	2024-07-18 10:50:00+00
908ee575-199d-4043-a96e-532795615f87	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.1999999999987	1	1	no error	0.5	2024-07-18 10:51:00+00	2024-07-18 10:52:00+00
4a5a0334-91c2-4cd6-ad7e-45c397dcbc52	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.29999999999869	1	1	no error	0.5	2024-07-18 10:53:00+00	2024-07-18 10:55:00+00
b90a0c9e-1a6d-428a-ab3e-ca2aa03916c7	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.39999999999868	1	1	no error	0.5	2024-07-18 10:56:00+00	2024-07-18 10:59:00+00
1ac73246-6cd6-43ab-8ba9-090256fc7fb8	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.49999999999868	1	1	no error	0.5	2024-07-18 11:00:00+00	2024-07-18 11:04:00+00
6e358694-6d47-483c-bdf8-136884d29ed0	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.59999999999867	1	1	no error	0.5	2024-07-18 11:05:00+00	2024-07-18 11:10:00+00
65644406-f612-4fb7-80f8-aef88b5d101a	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.69999999999867	1	1	no error	0.5	2024-07-18 11:11:00+00	2024-07-18 11:17:00+00
30174018-8a9d-495e-8715-79c9b5877335	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.79999999999866	1	1	no error	0.5	2024-07-18 11:18:00+00	2024-07-18 11:25:00+00
ffac7a68-9653-411c-bfad-c23ac950e696	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.89999999999866	1	1	no error	0.5	2024-07-18 11:26:00+00	2024-07-18 11:34:00+00
8cd959e4-9a5d-4a9a-a92c-6a10a0290678	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	98.99999999999865	1	1	no error	0.5	2024-07-18 11:35:00+00	2024-07-18 11:44:00+00
73a46fa8-f9dd-4eb7-a2b0-16491a47022f	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.09999999999864	1	1	no error	0.5	2024-07-18 11:45:00+00	2024-07-18 11:45:00+00
87c8c922-61dc-4097-a683-6731b4c5badf	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.19999999999864	1	1	no error	0.5	2024-07-18 11:46:00+00	2024-07-18 11:47:00+00
3e03738b-6acd-463c-9124-9dc2e6c34cca	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.29999999999863	1	1	no error	0.5	2024-07-18 11:48:00+00	2024-07-18 11:50:00+00
055f58fe-7d7c-4a84-874e-7923bf7ddd5e	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.39999999999863	1	1	no error	0.5	2024-07-18 11:51:00+00	2024-07-18 11:54:00+00
a0ef4623-8832-46b5-a09c-ce0a49feb833	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.49999999999862	1	1	no error	0.5	2024-07-18 11:55:00+00	2024-07-18 11:59:00+00
8c15225e-8559-475d-bdb7-e13177608386	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.59999999999862	1	1	no error	0.5	2024-07-18 12:00:00+00	2024-07-18 12:05:00+00
21b4cf4a-59dc-4440-a7fb-fe89250ccc5c	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.69999999999861	1	1	no error	0.5	2024-07-18 12:06:00+00	2024-07-18 12:12:00+00
a7ffa5b1-1a7d-4106-bf11-fa9399673543	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.7999999999986	1	1	no error	0.5	2024-07-18 12:13:00+00	2024-07-18 12:20:00+00
bcc8845d-302a-4119-98bd-e099a8a0fbf2	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.8999999999986	1	1	no error	0.5	2024-07-18 12:21:00+00	2024-07-18 12:29:00+00
0483d3a6-a79e-4459-8b3e-b7fbb778e8f1	001b653d-a477-4ccc-a6d6-109b4ef15e41	stall1	688cd6e0-2451-4ee9-afea-3ac5e1080ae9	sensor1	cfb6863c-f301-497a-bff5-e49b8adf8467	meter1	99.9999999999986	1	1	no error	0.5	2024-07-18 12:30:00+00	2024-07-18 12:39:00+00
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20240710145811_AddSettingsAndStalls	8.0.7
20240711022358_AddMeterSensor	8.0.7
20240711040315_AddWaterMeters	8.0.7
20240711060618_AddInvoices	8.0.7
20240714094540_AddMeterErrors	8.0.7
20240716142948_AddWarnings	8.0.7
\.


--
-- Name: CannotConnectWarnings PK_CannotConnectWarnings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CannotConnectWarnings"
    ADD CONSTRAINT "PK_CannotConnectWarnings" PRIMARY KEY ("Id");


--
-- Name: GasMeters PK_GasMeters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasMeters"
    ADD CONSTRAINT "PK_GasMeters" PRIMARY KEY ("Id");


--
-- Name: MeterErrors PK_MeterErrors; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MeterErrors"
    ADD CONSTRAINT "PK_MeterErrors" PRIMARY KEY ("Id");


--
-- Name: Meters PK_Meters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Meters"
    ADD CONSTRAINT "PK_Meters" PRIMARY KEY ("Id");


--
-- Name: NoIncomingMessageWarnings PK_NoIncomingMessageWarnings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoIncomingMessageWarnings"
    ADD CONSTRAINT "PK_NoIncomingMessageWarnings" PRIMARY KEY ("Id");


--
-- Name: Sensors PK_Sensors; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sensors"
    ADD CONSTRAINT "PK_Sensors" PRIMARY KEY ("Id");


--
-- Name: StallGasInvoices PK_StallGasInvoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StallGasInvoices"
    ADD CONSTRAINT "PK_StallGasInvoices" PRIMARY KEY ("Id");


--
-- Name: StallWaterInvoices PK_StallWaterInvoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StallWaterInvoices"
    ADD CONSTRAINT "PK_StallWaterInvoices" PRIMARY KEY ("Id");


--
-- Name: Stalls PK_Stalls; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stalls"
    ADD CONSTRAINT "PK_Stalls" PRIMARY KEY ("Id");


--
-- Name: WaterMeters PK_WaterMeters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WaterMeters"
    ADD CONSTRAINT "PK_WaterMeters" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_CannotConnectWarnings_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_CannotConnectWarnings_CreatedDate" ON public."CannotConnectWarnings" USING btree ("CreatedDate");


--
-- Name: IX_CannotConnectWarnings_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_CannotConnectWarnings_MeterId" ON public."CannotConnectWarnings" USING btree ("MeterId");


--
-- Name: IX_CannotConnectWarnings_SensorId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_CannotConnectWarnings_SensorId" ON public."CannotConnectWarnings" USING btree ("SensorId");


--
-- Name: IX_CannotConnectWarnings_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_CannotConnectWarnings_StallId" ON public."CannotConnectWarnings" USING btree ("StallId");


--
-- Name: IX_GasMeters_FromTimestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_GasMeters_FromTimestamp" ON public."GasMeters" USING btree ("FromTimestamp");


--
-- Name: IX_GasMeters_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_GasMeters_MeterId" ON public."GasMeters" USING btree ("MeterId");


--
-- Name: IX_GasMeters_SensorCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_GasMeters_SensorCode" ON public."GasMeters" USING btree ("SensorCode");


--
-- Name: IX_GasMeters_SensorId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_GasMeters_SensorId" ON public."GasMeters" USING btree ("SensorId");


--
-- Name: IX_GasMeters_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_GasMeters_StallId" ON public."GasMeters" USING btree ("StallId");


--
-- Name: IX_GasMeters_ToTimestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_GasMeters_ToTimestamp" ON public."GasMeters" USING btree ("ToTimestamp");


--
-- Name: IX_GasMeters_Value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_GasMeters_Value" ON public."GasMeters" USING btree ("Value");


--
-- Name: IX_MeterErrors_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_MeterErrors_CreatedDate" ON public."MeterErrors" USING btree ("CreatedDate");


--
-- Name: IX_MeterErrors_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_MeterErrors_MeterId" ON public."MeterErrors" USING btree ("MeterId");


--
-- Name: IX_MeterErrors_Reason; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_MeterErrors_Reason" ON public."MeterErrors" USING btree ("Reason");


--
-- Name: IX_MeterErrors_SensorId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_MeterErrors_SensorId" ON public."MeterErrors" USING btree ("SensorId");


--
-- Name: IX_MeterErrors_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_MeterErrors_StallId" ON public."MeterErrors" USING btree ("StallId");


--
-- Name: IX_Meters_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Meters_CreatedDate" ON public."Meters" USING btree ("CreatedDate");


--
-- Name: IX_Meters_MeterCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Meters_MeterCode" ON public."Meters" USING btree ("MeterCode");


--
-- Name: IX_Meters_MeterType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Meters_MeterType" ON public."Meters" USING btree ("MeterType");


--
-- Name: IX_NoIncomingMessageWarnings_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_NoIncomingMessageWarnings_CreatedDate" ON public."NoIncomingMessageWarnings" USING btree ("CreatedDate");


--
-- Name: IX_NoIncomingMessageWarnings_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_NoIncomingMessageWarnings_MeterId" ON public."NoIncomingMessageWarnings" USING btree ("MeterId");


--
-- Name: IX_NoIncomingMessageWarnings_SensorId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_NoIncomingMessageWarnings_SensorId" ON public."NoIncomingMessageWarnings" USING btree ("SensorId");


--
-- Name: IX_NoIncomingMessageWarnings_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_NoIncomingMessageWarnings_StallId" ON public."NoIncomingMessageWarnings" USING btree ("StallId");


--
-- Name: IX_Sensors_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Sensors_CreatedDate" ON public."Sensors" USING btree ("CreatedDate");


--
-- Name: IX_Sensors_IpAddress; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Sensors_IpAddress" ON public."Sensors" USING btree ("IpAddress");


--
-- Name: IX_Sensors_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Sensors_MeterId" ON public."Sensors" USING btree ("MeterId");


--
-- Name: IX_Sensors_SensorCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Sensors_SensorCode" ON public."Sensors" USING btree ("SensorCode");


--
-- Name: IX_Sensors_SensorName; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Sensors_SensorName" ON public."Sensors" USING btree ("SensorName");


--
-- Name: IX_Sensors_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Sensors_StallId" ON public."Sensors" USING btree ("StallId");


--
-- Name: IX_StallGasInvoices_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_CreatedDate" ON public."StallGasInvoices" USING btree ("CreatedDate");


--
-- Name: IX_StallGasInvoices_EndDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_EndDate" ON public."StallGasInvoices" USING btree ("EndDate");


--
-- Name: IX_StallGasInvoices_EndValue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_EndValue" ON public."StallGasInvoices" USING btree ("EndValue");


--
-- Name: IX_StallGasInvoices_InvoiceCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_StallGasInvoices_InvoiceCode" ON public."StallGasInvoices" USING btree ("InvoiceCode");


--
-- Name: IX_StallGasInvoices_IsPaid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_IsPaid" ON public."StallGasInvoices" USING btree ("IsPaid");


--
-- Name: IX_StallGasInvoices_IsPrinted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_IsPrinted" ON public."StallGasInvoices" USING btree ("IsPrinted");


--
-- Name: IX_StallGasInvoices_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_MeterId" ON public."StallGasInvoices" USING btree ("MeterId");


--
-- Name: IX_StallGasInvoices_Payment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_Payment" ON public."StallGasInvoices" USING btree ("Payment");


--
-- Name: IX_StallGasInvoices_Quantity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_Quantity" ON public."StallGasInvoices" USING btree ("Quantity");


--
-- Name: IX_StallGasInvoices_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_StallId" ON public."StallGasInvoices" USING btree ("StallId");


--
-- Name: IX_StallGasInvoices_StartDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_StartDate" ON public."StallGasInvoices" USING btree ("StartDate");


--
-- Name: IX_StallGasInvoices_StartValue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallGasInvoices_StartValue" ON public."StallGasInvoices" USING btree ("StartValue");


--
-- Name: IX_StallWaterInvoices_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_CreatedDate" ON public."StallWaterInvoices" USING btree ("CreatedDate");


--
-- Name: IX_StallWaterInvoices_EndDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_EndDate" ON public."StallWaterInvoices" USING btree ("EndDate");


--
-- Name: IX_StallWaterInvoices_EndValue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_EndValue" ON public."StallWaterInvoices" USING btree ("EndValue");


--
-- Name: IX_StallWaterInvoices_InvoiceCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_StallWaterInvoices_InvoiceCode" ON public."StallWaterInvoices" USING btree ("InvoiceCode");


--
-- Name: IX_StallWaterInvoices_IsPaid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_IsPaid" ON public."StallWaterInvoices" USING btree ("IsPaid");


--
-- Name: IX_StallWaterInvoices_IsPrinted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_IsPrinted" ON public."StallWaterInvoices" USING btree ("IsPrinted");


--
-- Name: IX_StallWaterInvoices_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_MeterId" ON public."StallWaterInvoices" USING btree ("MeterId");


--
-- Name: IX_StallWaterInvoices_Payment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_Payment" ON public."StallWaterInvoices" USING btree ("Payment");


--
-- Name: IX_StallWaterInvoices_Quantity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_Quantity" ON public."StallWaterInvoices" USING btree ("Quantity");


--
-- Name: IX_StallWaterInvoices_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_StallId" ON public."StallWaterInvoices" USING btree ("StallId");


--
-- Name: IX_StallWaterInvoices_StartDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_StartDate" ON public."StallWaterInvoices" USING btree ("StartDate");


--
-- Name: IX_StallWaterInvoices_StartValue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_StallWaterInvoices_StartValue" ON public."StallWaterInvoices" USING btree ("StartValue");


--
-- Name: IX_Stalls_CreatedDate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Stalls_CreatedDate" ON public."Stalls" USING btree ("CreatedDate");


--
-- Name: IX_Stalls_StallCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Stalls_StallCode" ON public."Stalls" USING btree ("StallCode");


--
-- Name: IX_Stalls_StallFloor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Stalls_StallFloor" ON public."Stalls" USING btree ("StallFloor");


--
-- Name: IX_Stalls_StallInfo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Stalls_StallInfo" ON public."Stalls" USING btree ("StallInfo");


--
-- Name: IX_Stalls_StallLot; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Stalls_StallLot" ON public."Stalls" USING btree ("StallLot");


--
-- Name: IX_Stalls_StallName; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Stalls_StallName" ON public."Stalls" USING btree ("StallName");


--
-- Name: IX_WaterMeters_FromTimestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WaterMeters_FromTimestamp" ON public."WaterMeters" USING btree ("FromTimestamp");


--
-- Name: IX_WaterMeters_MeterId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WaterMeters_MeterId" ON public."WaterMeters" USING btree ("MeterId");


--
-- Name: IX_WaterMeters_SensorCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WaterMeters_SensorCode" ON public."WaterMeters" USING btree ("SensorCode");


--
-- Name: IX_WaterMeters_SensorId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WaterMeters_SensorId" ON public."WaterMeters" USING btree ("SensorId");


--
-- Name: IX_WaterMeters_StallId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WaterMeters_StallId" ON public."WaterMeters" USING btree ("StallId");


--
-- Name: IX_WaterMeters_ToTimestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WaterMeters_ToTimestamp" ON public."WaterMeters" USING btree ("ToTimestamp");


--
-- Name: IX_WaterMeters_Value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WaterMeters_Value" ON public."WaterMeters" USING btree ("Value");


--
-- Name: CannotConnectWarnings FK_CannotConnectWarnings_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CannotConnectWarnings"
    ADD CONSTRAINT "FK_CannotConnectWarnings_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id") ON DELETE CASCADE;


--
-- Name: CannotConnectWarnings FK_CannotConnectWarnings_Sensors_SensorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CannotConnectWarnings"
    ADD CONSTRAINT "FK_CannotConnectWarnings_Sensors_SensorId" FOREIGN KEY ("SensorId") REFERENCES public."Sensors"("Id") ON DELETE CASCADE;


--
-- Name: CannotConnectWarnings FK_CannotConnectWarnings_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CannotConnectWarnings"
    ADD CONSTRAINT "FK_CannotConnectWarnings_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id");


--
-- Name: GasMeters FK_GasMeters_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasMeters"
    ADD CONSTRAINT "FK_GasMeters_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id") ON DELETE CASCADE;


--
-- Name: GasMeters FK_GasMeters_Sensors_SensorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasMeters"
    ADD CONSTRAINT "FK_GasMeters_Sensors_SensorId" FOREIGN KEY ("SensorId") REFERENCES public."Sensors"("Id") ON DELETE CASCADE;


--
-- Name: GasMeters FK_GasMeters_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasMeters"
    ADD CONSTRAINT "FK_GasMeters_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id");


--
-- Name: MeterErrors FK_MeterErrors_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MeterErrors"
    ADD CONSTRAINT "FK_MeterErrors_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id");


--
-- Name: MeterErrors FK_MeterErrors_Sensors_SensorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MeterErrors"
    ADD CONSTRAINT "FK_MeterErrors_Sensors_SensorId" FOREIGN KEY ("SensorId") REFERENCES public."Sensors"("Id");


--
-- Name: MeterErrors FK_MeterErrors_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MeterErrors"
    ADD CONSTRAINT "FK_MeterErrors_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id");


--
-- Name: NoIncomingMessageWarnings FK_NoIncomingMessageWarnings_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoIncomingMessageWarnings"
    ADD CONSTRAINT "FK_NoIncomingMessageWarnings_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id") ON DELETE CASCADE;


--
-- Name: NoIncomingMessageWarnings FK_NoIncomingMessageWarnings_Sensors_SensorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoIncomingMessageWarnings"
    ADD CONSTRAINT "FK_NoIncomingMessageWarnings_Sensors_SensorId" FOREIGN KEY ("SensorId") REFERENCES public."Sensors"("Id") ON DELETE CASCADE;


--
-- Name: NoIncomingMessageWarnings FK_NoIncomingMessageWarnings_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NoIncomingMessageWarnings"
    ADD CONSTRAINT "FK_NoIncomingMessageWarnings_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id");


--
-- Name: Sensors FK_Sensors_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sensors"
    ADD CONSTRAINT "FK_Sensors_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id");


--
-- Name: Sensors FK_Sensors_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sensors"
    ADD CONSTRAINT "FK_Sensors_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id");


--
-- Name: StallGasInvoices FK_StallGasInvoices_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StallGasInvoices"
    ADD CONSTRAINT "FK_StallGasInvoices_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id") ON DELETE CASCADE;


--
-- Name: StallGasInvoices FK_StallGasInvoices_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StallGasInvoices"
    ADD CONSTRAINT "FK_StallGasInvoices_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id") ON DELETE CASCADE;


--
-- Name: StallWaterInvoices FK_StallWaterInvoices_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StallWaterInvoices"
    ADD CONSTRAINT "FK_StallWaterInvoices_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id") ON DELETE CASCADE;


--
-- Name: StallWaterInvoices FK_StallWaterInvoices_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StallWaterInvoices"
    ADD CONSTRAINT "FK_StallWaterInvoices_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id") ON DELETE CASCADE;


--
-- Name: WaterMeters FK_WaterMeters_Meters_MeterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WaterMeters"
    ADD CONSTRAINT "FK_WaterMeters_Meters_MeterId" FOREIGN KEY ("MeterId") REFERENCES public."Meters"("Id") ON DELETE CASCADE;


--
-- Name: WaterMeters FK_WaterMeters_Sensors_SensorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WaterMeters"
    ADD CONSTRAINT "FK_WaterMeters_Sensors_SensorId" FOREIGN KEY ("SensorId") REFERENCES public."Sensors"("Id") ON DELETE CASCADE;


--
-- Name: WaterMeters FK_WaterMeters_Stalls_StallId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WaterMeters"
    ADD CONSTRAINT "FK_WaterMeters_Stalls_StallId" FOREIGN KEY ("StallId") REFERENCES public."Stalls"("Id");


--
-- PostgreSQL database dump complete
--

