-- Table: public.test1

-- DROP TABLE IF EXISTS public.test1;

CREATE TABLE IF NOT EXISTS public.test1
(
    name text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.test1
    OWNER to ljeuwmvyggdhxf;