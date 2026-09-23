-- ============================================================================
--AGES OF THE WORLD
-- ============================================================================
CREATE TABLE "ages" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "start_year" INTEGER NOT NULL,
    "end_year" INTEGER,
    "description" TEXT,
    PRIMARY KEY("id")
);

-- ============================================================================
--GEOGRAPHY OF THE WORLD
-- ============================================================================
CREATE TABLE "continents" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "description" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "regions" (
    "id" INTEGER,
    "continent_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL UNIQUE,
    "climate" TEXT,
    "description" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("continent_id") REFERENCES "continents"("id")
);

CREATE TABLE "cities" (
    "id" INTEGER,
    "region_id" INTEGER NOT NULL,
    "start_age" INTEGER NOT NULL,
    "end_age" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
    "description" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("start_age") REFERENCES "ages"("id"),
    FOREIGN KEY("end_age") REFERENCES "ages"("id"),
    FOREIGN KEY("region_id") REFERENCES "region"("id")
);

-- ============================================================================
--CAMPAIGNS AND PLAYERS
-- ============================================================================
CREATE TABLE "campaigns" (
    "id" INTEGER,
    "title" TEXT NOT NULL UNIQUE,
    "age_id" INTEGER,
    "description" TEXT,
    "start_date" DATE DEFAULT CURRENT_DATE NOT NULL,
    "end_date" DATE,
    PRIMARY KEY("id"),
    FOREIGN KEY("age_id") REFERENCES "ages"("id")
);

CREATE TABLE "players" (
    "id" INTEGER,
    "username" TEXT NOT NULL UNIQUE,
    "first_name" TEXT,
    "last_name" TEXT,
    "joined_at" DATE DEFAULT CURRENT_DATE NOT NULL,
    "active" INTEGER NOT NULL DEFAULT 1 CHECK("active" IN (0, 1)),
    PRIMARY KEY("id")
);


-- ============================================================================
--FACTIONS AND ORGANIZATIONS OF THE WORLD
-- ============================================================================
CREATE TABLE "factions" (
    "id" INTEGER,
    "start_age" INTEGER NOT NULL,
    "end_age" INTEGER,
    "city_id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "description" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("start_age") REFERENCES "ages"("id"),
    FOREIGN KEY("end_age") REFERENCES "ages"("id"),
    FOREIGN KEY("city_id") REFERENCES "cities"("id")
);

-- ============================================================================
--MECHANICS FROM THE RPG SYSTEM
-- ============================================================================
CREATE TABLE "items" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
    "rarity" TEXT NOT NULL,
    "attunement" INTEGER NOT NULL DEFAULT 0 CHECK("attunement" IN (0, 1)),
    "description" TEXT,
     PRIMARY KEY("id")
);

CREATE TABLE "spells" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "level" INTEGER NOT NULL,
    "school" TEXT NOT NULL,
    "casting_time" TEXT NOT NULL,
    "range" TEXT NOT NULL,
    "concentration" INTEGER NOT NULL DEFAULT 0 CHECK("concentration" IN (0, 1)),
     PRIMARY KEY("id")
);

CREATE TABLE "classes" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "ability" TEXT NOT NULL CHECK("ability" IN ('STR', 'AGL', 'CON', 'WIS', 'CHA', 'INT')),
    "description" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "races" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "size" TEXT,
    "speed" INTEGER NOT NULL DEFAULT 30,
    "darkvision" INTEGER NOT NULL DEFAULT 0 CHECK("darkvision" IN (0, 1)),
    "description" TEXT,
    PRIMARY KEY("id")
);


-- ============================================================================
--CHARACTERS AND NPCS
-- ============================================================================

CREATE TABLE "chars" (
    "id" INTEGER,
    "player_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT,
    "race_id" INTEGER NOT NULL,
    "class" INTEGER NOT NULL,
    "second_class" INTEGER,
    "third_class" INTEGER,
    "start_age" INTEGER NOT NULL,
    "end_age" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("player_id") REFERENCES "players"("id"),
    FOREIGN KEY("race_id") REFERENCES "races"("id"),
    FOREIGN KEY("class") REFERENCES "class"("id"),
    FOREIGN KEY("second_class") REFERENCES "class"("id"),
    FOREIGN KEY("third_class") REFERENCES "class"("id"),
    FOREIGN KEY("start_age") REFERENCES "ages"("id"),
    FOREIGN KEY("end_age") REFERENCES "ages"("id")
);

CREATE TABLE "npcs" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT,
    "race_id" INTEGER NOT NULL,
    "class" INTEGER NOT NULL,
    "second_class" INTEGER,
    "third_class" INTEGER,
    "city_id" INTEGER,
    "start_age" INTEGER NOT NULL,
    "end_age" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("race_id") REFERENCES "races"("id"),
    FOREIGN KEY("class") REFERENCES "class"("id"),
    FOREIGN KEY("second_class") REFERENCES "class"("id"),
    FOREIGN KEY("third_class") REFERENCES "class"("id"),
    FOREIGN KEY("city_id") REFERENCES "cities"("id"),
    FOREIGN KEY("start_age") REFERENCES "ages"("id"),
    FOREIGN KEY("end_age") REFERENCES "ages"("id")
);

