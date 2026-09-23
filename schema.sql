--Ages of the world
CREATE TABLE "ages" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "start_year" INTEGER NOT NULL, --Must have a start date (INTEGER BECAUSE IT'S A FANTASY DATE)
    "end_year" INTEGER, --Null in case it's a current age
    "description" TEXT,
    PRIMARY KEY("id")
);

--Nations of the world

--The players on my campaigns
CREATE TABLE "players" (
    "id" INTEGER,
    "username" TEXT UNIQUE NOT NULL,
    "first_name" TEXT,
    "last_name" TEXT,
    "joined_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id")
);

--The characters of my players
CREATE TABLE "chars" (
    "id" INTEGER,
    "player_id" INTEGER,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("player_id") REFERENCES "players"("id") ON DELETE SET NULL
);

--The non-playable characters of my campaigns
CREATE TABLE "npcs" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id")
);
