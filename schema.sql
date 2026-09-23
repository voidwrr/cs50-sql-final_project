-- ============================================================================
-- 1.  AGES OF THE WORLD
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
-- 2.  GEOGRAPHY OF THE WORLD
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
    FOREIGN KEY("region_id") REFERENCES "regions"("id")
);


-- ============================================================================
-- 3.  CAMPAIGNS AND PLAYERS
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
-- 4.  MECHANICS FROM THE RPG SYSTEM
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
    "level" INTEGER NOT NULL CHECK("level" BETWEEN 0 AND 9),
    "school" TEXT NOT NULL CHECK("school" IN ('Abjuration', 'Conjuration', 'Divination', 'Enchantment', 'Evocation', 'Illusion', 'Necromancy', 'Transmutation')),
    "casting_time" TEXT NOT NULL CHECK("casting_time" IN ('1 action', '1 bonus action', '1 reaction', '1min', '10min', '1h', '8h', '24h')),
    "range" TEXT NOT NULL "range" TEXT NOT NULL CHECK("range" IN ('Self', 'Touch', 'Sight', 'Unlimited', '10ft', '30ft', '60ft', '90ft', '120ft', '150ft', '300ft', '500ft', '1mi')),
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
-- 5.  FACTIONS AND ORGANIZATIONS OF THE WORLD
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
-- 6.  CHARACTERS AND NPCS
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
    FOREIGN KEY("class") REFERENCES "classes"("id"),
    FOREIGN KEY("second_class") REFERENCES "classes"("id"),
    FOREIGN KEY("third_class") REFERENCES "classes"("id"),
    FOREIGN KEY("start_age") REFERENCES "ages"("id"),
    FOREIGN KEY("end_age") REFERENCES "ages"("id")
);

CREATE TABLE "npcs" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT,
    "race_id" INTEGER NOT NULL,
    "class" INTEGER,
    "second_class" INTEGER,
    "third_class" INTEGER,
    "city_id" INTEGER,
    "start_age" INTEGER NOT NULL,
    "end_age" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("race_id") REFERENCES "races"("id"),
    FOREIGN KEY("class") REFERENCES "classes"("id"),
    FOREIGN KEY("second_class") REFERENCES "classes"("id"),
    FOREIGN KEY("third_class") REFERENCES "classes"("id"),
    FOREIGN KEY("city_id") REFERENCES "cities"("id"),
    FOREIGN KEY("start_age") REFERENCES "ages"("id"),
    FOREIGN KEY("end_age") REFERENCES "ages"("id")
);


-- ============================================================================
-- 7.  JUNCTION TABLES
-- ============================================================================

CREATE TABLE "char_campaigns" (
    "char_id" INTEGER NOT NULL,
    "campaign_id" INTEGER NOT NULL,
    PRIMARY KEY("char_id", "campaign_id"),
    FOREIGN KEY("char_id") REFERENCES "chars"("id") ON DELETE CASCADE,
    FOREIGN KEY("campaign_id") REFERENCES "campaigns"("id") ON DELETE CASCADE
);

CREATE TABLE "npc_factions" (
    "npc_id" INTEGER NOT NULL,
    "faction_id" INTEGER NOT NULL,
    "rank" TEXT,
    PRIMARY KEY("npc_id", "faction_id"),
    FOREIGN KEY("npc_id") REFERENCES "npcs"("id") ON DELETE CASCADE,
    FOREIGN KEY("faction_id") REFERENCES "factions"("id") ON DELETE CASCADE
);

CREATE TABLE "char_factions" (
    "char_id" INTEGER NOT NULL,
    "faction_id" INTEGER NOT NULL,
    "rank" TEXT,
    PRIMARY KEY("char_id", "faction_id"),
    FOREIGN KEY("char_id") REFERENCES "chars"("id") ON DELETE CASCADE,
    FOREIGN KEY("faction_id") REFERENCES "factions"("id") ON DELETE CASCADE
);

CREATE TABLE "npc_items" (
    "npc_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    PRIMARY KEY("npc_id", "item_id"),
    FOREIGN KEY("npc_id") REFERENCES "npcs"("id") ON DELETE CASCADE,
    FOREIGN KEY("item_id") REFERENCES "items"("id") ON DELETE CASCADE
);

CREATE TABLE "char_items" (
    "char_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    PRIMARY KEY("char_id", "item_id"),
    FOREIGN KEY("char_id") REFERENCES "chars"("id") ON DELETE CASCADE,
    FOREIGN KEY("item_id") REFERENCES "items"("id") ON DELETE CASCADE
);

CREATE TABLE "npc_spells" (
    "npc_id" INTEGER NOT NULL,
    "spell_id" INTEGER NOT NULL,
    PRIMARY KEY("npc_id", "spell_id"),
    FOREIGN KEY("npc_id") REFERENCES "npcs"("id") ON DELETE CASCADE,
    FOREIGN KEY("spell_id") REFERENCES "spells"("id") ON DELETE CASCADE
);

CREATE TABLE "char_spells" (
    "char_id" INTEGER NOT NULL,
    "spell_id" INTEGER NOT NULL,
    PRIMARY KEY("char_id", "spell_id"),
    FOREIGN KEY("char_id") REFERENCES "chars"("id") ON DELETE CASCADE,
    FOREIGN KEY("spell_id") REFERENCES "spells"("id") ON DELETE CASCADE
);


-- ============================================================================
-- 8.  OPTIMIZATION
-- ============================================================================

-- Optimizing search by names
CREATE INDEX "idx_chars_name" ON "chars"("first_name", "last_name");
CREATE INDEX "idx_npcs_name" ON "npcs"("first_name", "last_name");

-- Optimizing search of chars by players
CREATE INDEX "idx_player_char" ON "chars"("player_id");

-- Optimizing search by geography
CREATE INDEX "idx_cities_region" ON "cities"("region_id");
CREATE INDEX "idx_regions_continent" ON "regions"("continent_id");

-- Optimizing search by ages (temporal timeline searches)
CREATE INDEX "idx_campaigns_age" ON "campaigns"("age_id");
CREATE INDEX "idx_cities_start_age" ON "cities"("start_age");
CREATE INDEX "idx_factions_start_age" ON "factions"("start_age");
CREATE INDEX "idx_chars_start_age" ON "chars"("start_age");
CREATE INDEX "idx_npcs_start_age" ON "npcs"("start_age");

-- Optimizing junction tables search
CREATE INDEX "idx_char_spells_spell" ON "char_spells"("spell_id");
CREATE INDEX "idx_char_items_item" ON "char_items"("item_id");
CREATE INDEX "idx_npc_items_item" ON "npc_items"("item_id");
CREATE INDEX "idx_npc_spells_spell" ON "npc_spells"("spell_id");
CREATE INDEX "idx_campaign_chars_campaign" ON "char_campaigns"("campaign_id");


-- ============================================================================
-- 9.  CHARACTER'S SHEET
-- ============================================================================

CREATE VIEW "v_character_sheets" AS
SELECT
    chars."id" AS "char_id",
    TRIM(
        chars."first_name" || ' ' ||
        COALESCE(chars."middle_name" || ' ', '') ||
        COALESCE(chars."last_name", '')
    ) AS "character_name",
    players."username" AS "player",
    races."name" AS "race",
    class1."name" AS "primary_class",
    class2."name" AS "secondary_class",
    class3."name" AS "third_class",
    ages."name" AS "era",
    COALESCE(GROUP_CONCAT(factions."name", ', '), 'None') AS "factions"
FROM "chars" chars
JOIN "players" players ON chars."player_id" = players."id"
JOIN "races" races ON chars."race_id" = races."id"
JOIN "classes" class1 ON chars."class" = class1."id"
LEFT JOIN "classes" class2 ON chars."second_class" = class2."id"
LEFT JOIN "classes" class3 ON chars."third_class" = class3."id"
JOIN "ages" ages ON chars."start_age" = ages."id"
LEFT JOIN "char_factions" char_factions ON chars."id" = char_factions."char_id"
LEFT JOIN "factions" factions ON char_factions."faction_id" = factions."id"
GROUP BY chars."id";


-- ============================================================================
-- 10.  SPELL LIST
-- ============================================================================

CREATE VIEW "v_spell_list" AS
SELECT
    'PC' AS "entity_type",
    TRIM(
        chars."first_name" || ' ' ||
        COALESCE(chars."middle_name" || ' ', '') ||
        COALESCE(chars."last_name", '')
    ) AS "caster_name",
    spells."name" AS "spell_name",
    spells."level" AS "spell_level",
    spells."school",
    spells."casting_time",
    spells."range",
    spells."concentration"
FROM "char_spells" char_spells
JOIN "chars" chars ON char_spells."char_id" = chars."id"
JOIN "spells" spells ON char_spells."spell_id" = spells."id"

UNION ALL

SELECT
    'NPC' AS "entity_type",
    TRIM(
        npcs."first_name" || ' ' ||
        COALESCE(npcs."middle_name" || ' ', '') ||
        COALESCE(npcs."last_name", '')
    ) AS "caster_name",
    spells."name" AS "spell_name",
    spells."level" AS "spell_level",
    spells."school",
    spells."casting_time",
    spells."range",
    spells."concentration"
FROM "npc_spells" npc_spells
JOIN "npcs" npcs ON npc_spells."npc_id" = npcs."id"
JOIN "spells" spells ON npc_spells."spell_id" = spells."id";


-- ============================================================================
-- 11.  INVENTORY LIST
-- ============================================================================

CREATE VIEW "v_inventory_list" AS
SELECT
    'PC' AS "entity_type",
    TRIM(
        chars."first_name" || ' ' ||
        COALESCE(chars."middle_name" || ' ', '') ||
        COALESCE(chars."last_name", '')
    ) AS "owner_name",
    items."name" AS "item_name",
    items."type" AS "item_type",
    items."rarity",
    items."attunement" AS "requires_attunement"
FROM "char_items" char_items
JOIN "chars" chars ON char_items."char_id" = chars."id"
JOIN "items" items ON char_items."item_id" = items."id"

UNION ALL

SELECT
    'NPC' AS "entity_type",
    TRIM(
        npcs."first_name" || ' ' ||
        COALESCE(npcs."middle_name" || ' ', '') ||
        COALESCE(npcs."last_name", '')
    ) AS "owner_name",
    items."name" AS "item_name",
    items."type" AS "item_type",
    items."rarity",
    items."attunement" AS "requires_attunement"
FROM "npc_items" npc_items
JOIN "npcs" npcs ON npc_items."npc_id" = npcs."id"
JOIN "items" items ON npc_items."item_id" = items."id";


-- ============================================================================
-- 12.  NPC'S LIST
-- ============================================================================

CREATE VIEW "v_npcs_list" AS
SELECT
    npcs."id" AS "npc_id",
    TRIM(
        npcs."first_name" || ' ' ||
        COALESCE(npcs."middle_name" || ' ', '') ||
        COALESCE(npcs."last_name", '')
    ) AS "npc_name",
    races."name" AS "race",
    COALESCE(classes."name", 'Unclassed') AS "primary_class",
    COALESCE(cities."name", 'Unknown Location') AS "city",
    ages."name" AS "origin_age"
FROM "npcs" npcs
JOIN "races" races ON npcs."race_id" = races."id"
LEFT JOIN "classes" classes ON npcs."class" = classes."id"
LEFT JOIN "cities" cities ON npcs."city_id" = cities."id"
JOIN "ages" ages ON npcs."start_age" = ages."id";
