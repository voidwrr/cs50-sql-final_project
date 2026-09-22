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
CREATE TABLE "playable_characters" (
    "id" INTEGER,
    "player_id" INTEGER,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("player_id") REFERENCES "players"("id") ON DELETE SET NULL
);

--The non-playable characters of my campaigns
CREATE TABLE "non_playable_characters" (
    "id"
)
