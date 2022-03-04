-- Part Three: Soccer League

DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    rank INTEGER NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER NOT NULL REFERENCES teams ON DELETE SET NULL,
    away_team_id INTEGER NOT NULL REFERENCES teams ON DELETE SET NULL CHECK (away_team_id <> home_team_id),
    season_id INTEGER NOT NULL REFERENCES season ON DELETE SET NULL,
    referee_id INTEGER NOT NULL REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players ON DELETE SET NULL,
    match_id INTEGER NOT NULL REFERENCES matches ON DELETE SET NULL
);

