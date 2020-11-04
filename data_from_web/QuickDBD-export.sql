CREATE TABLE "Games" (
    "game_id" INT   NOT NULL,
    "week" INT   NOT NULL,
    "ptsw" INT   NOT NULL,
    "ptsl" INT   NOT NULL,
    "ydsw" INT   NOT NULL,
    "ydsl" INT   NOT NULL,
    "winner" VARCHAR(255)   NOT NULL,
    "loser" VARCHAR(255)   NOT NULL,
    "home_team" VARCHAR(255)   NOT NULL,
    "away_team" VARCHAR(255)   NOT NULL,
    "date" DATE   NOT NULL,
    "stadium" VARCHAR(255)   NOT NULL,
    "ghcnd" VARCHAR(255)   NOT NULL,
    "rain" FLOAT   NOT NULL,
    "temp" FLOAT   NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "Stadiums" (
    "name" VARCHAR(255)   NOT NULL,
    "team" VARCHAR(255)   NOT NULL,
    "geo_point" VARCHAR(255)   NOT NULL,
    "roof_type" VARCHAR(255)   NOT NULL,
    "station" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Stadiums" PRIMARY KEY (
        "name"
     )
);

CREATE TABLE "Stations" (
    "ghcnd" VARCHAR(255)   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "country" VARCHAR(255)   NOT NULL,
    "st" VARCHAR(255)   NOT NULL,
    "lat" INT   NOT NULL,
    "lon" INT   NOT NULL,
    CONSTRAINT "pk_Stations" PRIMARY KEY (
        "ghcnd"
     )
);

CREATE TABLE "Teams" (
    "team_name" VARCHAR(255)   NOT NULL,
    "team_conference" VARCHAR(255)   NOT NULL,
    "team_division" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team_name"
     )
);

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_home_team" FOREIGN KEY("home_team")
REFERENCES "Teams" ("team_name");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_stadium" FOREIGN KEY("stadium")
REFERENCES "Stadiums" ("name");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_ghcnd" FOREIGN KEY("ghcnd")
REFERENCES "Stations" ("ghcnd");

ALTER TABLE "Stadiums" ADD CONSTRAINT "fk_Stadiums_station" FOREIGN KEY("station")
REFERENCES "Stations" ("ghcnd");
