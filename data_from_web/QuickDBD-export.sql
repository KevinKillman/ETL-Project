-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Games" (
    "game_id" INT   NOT NULL,
    "week" INT   NOT NULL,
    "ptsw" INT   NOT NULL,
    "ptsl" INT   NOT NULL,
    "ydsw" INT   NOT NULL,
    "ydsl" INT   NOT NULL,
    "winner_id" INT   NOT NULL,
    "loser_id" INT   NOT NULL,
    "home_team_id" INT   NOT NULL,
    "away_team_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    "stadium_id" INT   NOT NULL,
    "station_id" INT   NOT NULL,
    "rain" FLOAT   ,
    "temp" FLOAT   ,
    "total_pts" INT,
    "total_yds" INT
    CONSTRAINT "pk_Game" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "Stadiums" (
    "stadium_id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "team_id" INT   NOT NULL,
    "geo_point" VARCHAR(255)   ,
    "roof_type" VARCHAR(255)   ,
    "station_id" INT   ,
    CONSTRAINT "pk_Stadiums" PRIMARY KEY (
        "stadium_id"
     )
);

CREATE TABLE "Stations" (
    "station_id" INT   NOT NULL,
    "ghcnd" VARCHAR(255)   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "country" VARCHAR(255)   NOT NULL,
    "st" VARCHAR(255)   NOT NULL,
    "lat" FLOAT   NOT NULL,
    "lon" FLOAT   NOT NULL,
    CONSTRAINT "pk_Stations" PRIMARY KEY (
        "station_id"
     )
);

CREATE TABLE "Teams" (
    "team_id" INT   NOT NULL,
    "team_name" VARCHAR(255)   NOT NULL,
    "team_conference" VARCHAR(255)   ,
    "team_division" VARCHAR(255)   ,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team_id"
     )
);

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_winner_id" FOREIGN KEY("winner_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_loser_id" FOREIGN KEY("loser_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "Stadiums" ("stadium_id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_station_id" FOREIGN KEY("station_id")
REFERENCES "Stations" ("station_id");

ALTER TABLE "Stadiums" ADD CONSTRAINT "fk_Stadiums_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Stadiums" ADD CONSTRAINT "fk_Stadiums_station_id" FOREIGN KEY("station_id")
REFERENCES "Stations" ("station_id");

