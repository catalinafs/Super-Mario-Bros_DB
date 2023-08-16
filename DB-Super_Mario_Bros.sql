CREATE TYPE world_mode AS ENUM('collect the objects in the different levels', 'beat all levels to win');

CREATE TABLE world(
    id SERIAL,
    "name" CHARACTER VARYING(30) NOT NULL UNIQUE,
    "type" CHARACTER VARYING(30) NOT NULL UNIQUE,
    mode world_mode NOT NULL,
    CONSTRAINT world_pkey PRIMARY KEY (id)
);

INSERT INTO world("name", "type", mode) VALUES
  ('World #1', 'Green Land', 'collect the objects in the different levels'),
  ('World #2', 'Deserted Hill', 'beat all levels to win'),
  ('World #3', 'Sea Coast', 'beat all levels to win'),
  ('World #4', 'Big Island', 'collect the objects in the different levels'),
  ('World #5', 'Heaven', 'collect the objects in the different levels'),
  ('World #6', 'Frozen Land', 'collect the objects in the different levels'),
  ('World #7', 'Land of Pipes', 'beat all levels to win'),
  ('World #8', 'Dark Land', 'beat all levels to win');

CREATE TABLE level(
    id SERIAL,
    "name" CHARACTER VARYING(30) NOT NULL,
    world_id INTEGER NOT NULL,
    CONSTRAINT level_pkey PRIMARY KEY (id),
    FOREIGN KEY (world_id) REFERENCES world(id)
);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 1),
  ('Level 2', 1),
  ('Level 3', 1),
  ('Level 4', 1),
  ('Level 5', 1),
  ('Level 6', 1),
  ('Level 7', 1),
  ('Level 8', 1);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 2),
  ('Level 2', 2),
  ('Level 3', 2),
  ('Level 4', 2),
  ('Level 5', 2),
  ('Level 6', 2),
  ('Level 7', 2),
  ('Level 8', 2),
  ('Level 9', 2);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 3),
  ('Level 2', 3),
  ('Level 3', 3),
  ('Level 4', 3),
  ('Level 5', 3),
  ('Level 6', 3),
  ('Level 7', 3),
  ('Level 8', 3),
  ('Level 9', 3),
  ('Level 10', 3),
  ('Level 11', 3),
  ('Level 12', 3);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 4),
  ('Level 2', 4),
  ('Level 3', 4),
  ('Level 4', 4),
  ('Level 5', 4),
  ('Level 6', 4),
  ('Level 7', 4),
  ('Level 8', 4),
  ('Level 9', 4);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 5),
  ('Level 2', 5),
  ('Level 3', 5),
  ('Level 4', 5),
  ('Level 5', 5),
  ('Level 6', 5),
  ('Level 7', 5),
  ('Level 8', 5),
  ('Level 9', 5),
  ('Level 10', 5),
  ('Level 11', 5),
  ('Level 12', 5),
  ('Level 13', 5);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 6),
  ('Level 2', 6),
  ('Level 3', 6),
  ('Level 4', 6),
  ('Level 5', 6),
  ('Level 6', 6),
  ('Level 7', 6),
  ('Level 8', 6),
  ('Level 9', 6),
  ('Level 10', 6),
  ('Level 11', 6),
  ('Level 12', 6),
  ('Level 13', 6),
  ('Level 14', 6);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 7),
  ('Level 2', 7),
  ('Level 3', 7),
  ('Level 4', 7),
  ('Level 5', 7),
  ('Level 6', 7),
  ('Level 7', 7),
  ('Level 8', 7),
  ('Level 9', 7),
  ('Level 10', 7),
  ('Level 11', 7),
  ('Level 12', 7),
  ('Level 13', 7),
  ('Level 14', 7);

INSERT INTO level("name", world_id) VALUES
  ('Level 1', 8),
  ('Level 2', 8),
  ('Level 3', 8),
  ('Level 4', 8),
  ('Level 5', 8),
  ('Level 6', 8),
  ('Level 7', 8),
  ('Level 8', 8),
  ('Level 9', 8),
  ('Level 10', 8),
  ('Level 11', 8);

CREATE TABLE action(
    id SERIAL,
    "action" CHARACTER VARYING(20) NOT NULl UNIQUE,
    CONSTRAINT action_pkey PRIMARY KEY (id)
);

INSERT INTO "action"("action") VALUES
  ('run'),
  ('jump'),
  ('move left'),
  ('move right'),
  ('long jumps'),
  ('punch'),
  ('catch'),
  ('roll'),
  ('bend'),
  ('stomp');

CREATE TABLE sound(
    id SERIAL,
    "filename" CHARACTER VARYING(35) NOT NULL UNIQUE,
    CONSTRAINT sound_pkey PRIMARY KEY (id)
);

INSERT INTO sound("filename") VALUES
  ('its-a-me.wav'),
  ('yippee.wav'),
  ('ha-ha.wav'),
  ('oh-yeah.wav'),
  ('yay.wav'),
  ('woo-hoo.wav'),
  ('mm-hmm.wav'),
  ('yahoo.wav'),
  ('drop-and-catch.wav'),
  ('fall.wav');

CREATE TABLE hability(
    id SERIAL,
    "name"  CHARACTER VARYING(30) NOT NULL UNIQUE,
    advantage  CHARACTER VARYING(100) NOT NULL,
    disadvantage  CHARACTER VARYING(100) NOT NULL,
    CONSTRAINT hability_pkey PRIMARY KEY (id)
);

INSERT INTO hability("name", advantage, disadvantage) VALUES
  ('Metal Mushroom', 'You are immune to lava', 'It only lasts 15 seconds'),
  ('Bee Mushroom', 'You can fly', 'If you touch water, you lose the ability'),
  ('Boo Mushroom', 'You can float and go through walls', 'You can not enter the pipes'),
  ('Propeller Mushroom', 'You can fly and smash enemies from above', 'With this you can not jump, only fly'),
  ('Double Cherry', 'If you fall, it is okay to have a copy', 'It is hard to control both of them at the same time'),
  ('Carrot', 'You can run faster and jump higher, you can also dig tunnels', 'The jumps are not as high as those of Frog Mario'),
  ('Superball Flower', 'The balls crush the enemies to later be able to crush them', 'Koopas are invulnerable to this'),
  ('Super Leaf', 'You can fly and hit enemies with your tail', 'The flight is limited time'),
  ('Super Star', 'You are invulnerable to enemies', 'Lava is the only thing that makes you lose'),
  ('Fire Flower', 'You can burn enemies with fireballs', 'Some enemies are vulnerable to this');

CREATE TABLE character(
    id SERIAL,
    "name" CHARACTER VARYING(40) NOT NULL UNIQUE,
    level_id INTEGER NOT NULL,
    color CHARACTER VARYING(30) NOT NULL,
    homeland CHARACTER VARYING(40) NOT NULL,
    birthday DATE NOT NULL,
    height_cm INTEGER,
    weight_kg NUMERIC(4,1),
    sound_id INTEGER NOT NULL,
    action_id INTEGER NOT NULL,
    hability_id INTEGER NOT NULL,
    CONSTRAINT character_pkey PRIMARY KEY (id),
    FOREIGN KEY (level_id) REFERENCES level(id),
    FOREIGN KEY (sound_id) REFERENCES sound(id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (hability_id) REFERENCES hability(id)
);

INSERT INTO "character"("name", level_id, color, homeland, birthday, height_cm, weight_kg, sound_id, action_id, hability_id) VALUES
  ('Mario', 1, 'Red', 'Mushroom Kingdom', '1981-07-09', 155, 64.5, 4, 10, 1),
  ('Luigi', 1, 'Green', 'Mushroom Kingdom', '1983-07-14', 175, 48.8, 9, 5, 5),
  ('Peach', 4, 'Pink', 'Mushroom Kingdom', '1985-10-18', 173, 52.2, 2, 8, 7),
  ('Toad', 8, 'Blue', 'Mushroom Kingdom', '1950-01-10', 66, 35.6, 3, 6, 9),
  ('Browser', 7, 'Yellow', 'Koopa Kingdom', '1990-10-29', 258, 300, 7, 9, 4),
  ('Daisy', 5, 'Orange', 'Sarasaland', '1989-07-31', NULL, NULL, 1, 1, 8),
  ('Yoshi', 3, 'Green', 'Dinosaur Land', '1990-04-13', 162, 59.1, 7, 2, 9);