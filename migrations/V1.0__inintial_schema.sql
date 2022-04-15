-- Table: public.Actors
-- DROP TABLE IF EXISTS public."Actors";

CREATE TABLE IF NOT EXISTS public."Actors"
(
    "Id" integer NOT NULL DEFAULT nextval('"Actors_Id_seq"'::regclass),
    "FullName" text COLLATE pg_catalog."default" NOT NULL,
    "MovieId" integer,
    CONSTRAINT "PK_Actors" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Actors_Movies_MovieId" FOREIGN KEY ("MovieId")
        REFERENCES public."Movies" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Actors"
-- Index: IX_Actors_MovieId
-- DROP INDEX IF EXISTS public."IX_Actors_MovieId";

CREATE INDEX IF NOT EXISTS "IX_Actors_MovieId"
    ON public."Actors" USING btree
    ("MovieId" ASC NULLS LAST)
    TABLESPACE pg_default;
	
-- Table: public.Movies
-- DROP TABLE IF EXISTS public."Movies";

CREATE TABLE IF NOT EXISTS public."Movies"
(
    "Id" integer NOT NULL DEFAULT nextval('"Movies_Id_seq"'::regclass),
    "Title" text COLLATE pg_catalog."default" NOT NULL,
    "Year" integer NOT NULL,
    "Summary" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_Movies" PRIMARY KEY ("Id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Movies"
-- 