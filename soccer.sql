DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db

CREATE TABLE referees(
    ref_id SERIAL PRIMARY KEY UNIQUE,
    ref_name TEXT NOT NULL
);

CREATE TABLE seasons(
    season_id SERIAL PRIMARY KEY UNIQUE,
    start_day DATE,
    end_day DATE
);

CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY UNIQUE,
    team_name TEXT NOT NULL
);

CREATE TABLE players(
    player_id SERIAL PRIMARY KEY UNIQUE,
    full_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE matches(
    match_id SERIAL PRIMARY KEY UNIQUE,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    season_id INTEGER REFERENCES seasons,
    ref_id INTEGER REFERENCES referees
);

CREATE TABLE goals(
    goal_id SERIAL PRIMARY KEY UNIQUE,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    num_of_goals INTEGER NOT NULL
);

INSERT INTO referees (ref_name)
VALUES ('Martin Doychev');

INSERT INTO seasons(start_day, end_day) 
VALUES ('01/01/2023', '06/01/2023');

INSERT INTO teams (team_name) 
VALUES ('The Kotkas'),('The Jaguars'), ('The Tigers');

INSERT INTO players (full_name, team_id) 
VALUES ('Milo Stratton', '1'),('Sonya Gonzales', '1'),('Ty Fulgogi','2'),('Victor Krum','2'),('Phill Salazar','3'),('Jenny Simon','3');

INSERT INTO matches(team1_id, team2_id, season_id, ref_id) 
VALUES ('1','2','1','1'),('1','3','1','1'),('2','3','1','1');

INSERT INTO goals(player_id,match_id, num_of_goals) 
VALUES ('1','1','4'),('2','1','3'),('3','1','2'),('4','1','8'),('1','2','1'),('1','2','2'),('3','2','4'),('3','2','2'),('2','3','1'),('2','3','2'),('3','3','4'),('3','3','2');


SELECT p.full_name, SUM(g.num_of_goals) AS ranking, t.team_name FROM players p 
JOIN teams t ON p.team_id = t.team_id 
JOIN goals g ON p.player_id = g.player_id 
GROUP BY p.player_id 
ORDER BY SUM(g.num_of_goals) DESC;

--I'm missing somehting here. I wanted to specify my reference to refer to 
-- the actual information I was looking for rather then the id but whenever
-- I tried to do this I kept hitting an error. For example I wanted to 
-- reference teams(team_name) instead of team_id but it kept raising an error so
-- I switched it back to team_id ¯\_(ツ)_/¯