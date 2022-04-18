CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;

CREATE TABLE "Movies" (
    "Id" serial NOT NULL,
    "Title" text NOT NULL,
    "Year" integer NOT NULL,
    "Summary" text NOT NULL,
    CONSTRAINT "PK_Movies" PRIMARY KEY ("Id")
);

CREATE TABLE "Actors" (
    "Id" serial NOT NULL,
    "FullName" text NOT NULL,
    "MovieId" integer NULL,
    CONSTRAINT "PK_Actors" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Actors_Movies_MovieId" FOREIGN KEY ("MovieId") REFERENCES "Movies" ("Id")
);

CREATE INDEX "IX_Actors_MovieId" ON "Actors" ("MovieId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20220411132753_InitialDatabase', '6.0.3');

COMMIT;

