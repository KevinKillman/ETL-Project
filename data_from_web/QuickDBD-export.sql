-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Game" (
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
    "Rain" FLOAT   NOT NULL,
    "Temp" FLOAT   NOT NULL,
    CONSTRAINT "pk_Game" PRIMARY KEY (
        "game_id"
     )
);

CREATE TABLE "Stadiums" (
    "stadium_id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "team_id" INT   NOT NULL,
    "geo_point" VARCHAR(255)   NOT NULL,
    "roof_type" VARCHAR(255)   NOT NULL,
    "station_id" INT   NOT NULL,
    CONSTRAINT "pk_Stadiums" PRIMARY KEY (
        "stadium_id"
     )
);

CREATE TABLE "Stations" (
    "station_id" INT   NOT NULL,
    "ghcnd" VARCHAR(255)   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "country" VARCHAR(255)   NOT NULL,
    "state" VARCHAR(255)   NOT NULL,
    "latitude" FLOAT   NOT NULL,
    "longitude" FLOAT   NOT NULL,
    CONSTRAINT "pk_Stations" PRIMARY KEY (
        "station_id"
     )
);

CREATE TABLE "Teams" (
    "team_id" INT   NOT NULL,
    "team_name" VARCHAR(255)   NOT NULL,
    "team_conference" VARCHAR(255)   NOT NULL,
    "team_division" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team_id"
     )
);

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_winner_id" FOREIGN KEY("winner_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_loser_id" FOREIGN KEY("loser_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_stadium_id" FOREIGN KEY("stadium_id")
REFERENCES "Stadiums" ("stadium_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_station_id" FOREIGN KEY("station_id")
REFERENCES "Stations" ("station_id");

ALTER TABLE "Stadiums" ADD CONSTRAINT "fk_Stadiums_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Stadiums" ADD CONSTRAINT "fk_Stadiums_station_id" FOREIGN KEY("station_id")
REFERENCES "Stations" ("station_id");

