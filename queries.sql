-- ============================================================================
-- CHARACTERS AND PLAYERS QUERIES
-- ============================================================================

-- Complete character sheet
SELECT *
FROM "v_character_sheet"
WHERE "character_name" LIKE '%Rurik%';

-- All characters from a certain player
SELECT *
FROM "v_character_sheet"
WHERE "player" = 'voidwrr';

-- Players and their characters of a certain campaing
SELECT
    "players"."username" "player_username",
    "campaigns"."title" "campaign_title",
    TRIM(
        "chars"."first_name" ||
        COALESCE(' ' || "chars"."middle_name", '') ||
        COALESCE(' ' || "chars"."last_name", '')
    ) "character_name",
    "races"."name" "race",
    "classes"."name" "primary_class"
FROM "char_campaigns"
JOIN "campaigns" ON "char_campaigns"."campaign_id" = "campaigns"."id"
JOIN "chars" ON "char_campaigns"."char_id" = "chars"."id"
JOIN "players" ON "chars"."player_id" = "players"."id"
JOIN "races" ON "chars"."race_id" = "races"."id"
JOIN "classes" ON "chars"."class" = "classes"."id"
WHERE "campaigns"."id" = 1;

-- The inventory from a certain character
SELECT "item_name", "item_type", "rarity", "requires_attunement"
FROM "v_inventory_list"
WHERE "entity_type" = 'PC' AND "owner_name" LIKE 'Tytus%';

-- The spellbook from a certain character
SELECT "spell_name", "spell_level", "school", "casting_time", "range", "concentration"
FROM "v_spell_list"
WHERE "entity_type" = 'PC' AND "caster_name" LIKE 'Gandalf%'
ORDER BY "spell_level" ASC, "spell_name" ASC;


-- ============================================================================
-- NPCS QUERIES
-- ============================================================================

-- Complete npc sheet
SELECT *
FROM "v_npc_sheet"
WHERE "npc_name" LIKE '%Rurik%';

-- All characters from a certain city
SELECT "npc_name", "race", "primary_class", "factions"
FROM "v_npc_sheet"
WHERE "lived_at" = 'Waterdeep' OR "hometown" = 'Waterdeep';

-- All npcs from a certain faction and their ranks
SELECT
    TRIM("npcs"."first_name" || COALESCE(' ' || "npcs"."middle_name", '') || COALESCE(' ' || "npcs"."last_name", '')) "npc_name",
    "npc_factions"."rank" "faction_rank",
    "factions"."name" "faction_name"
FROM "npcs"
JOIN "npc_factions" ON "npcs"."id" = "npc_factions"."npc_id"
JOIN "factions" ON "npc_factions"."faction_id" = "factions"."id"
WHERE "factions"."name" = 'Thieves Guild';

-- The inventory from a certain npc
SELECT "item_name", "item_type", "rarity", "requires_attunement"
FROM "v_inventory_list"
WHERE "entity_type" = 'NPC' AND "owner_name" LIKE 'Alduin%';

-- The spellbook from a certain npc
SELECT "spell_name", "spell_level", "school", "casting_time", "range", "concentration"
FROM "v_spell_list"
WHERE "entity_type" = 'NPC' AND "caster_name" LIKE 'Daffy Duck'
ORDER BY "spell_level" ASC, "spell_name" ASC;


-- ============================================================================
-- LORE QUERIES
-- ============================================================================

-- All cities and the climate from a certain region
SELECT
    "cities"."name" "city_name",
    "cities"."type" "city_type",
    "regions"."name" "region_name",
    "regions"."climate" "climate",
    "continents"."name" "continent"
FROM "cities"
JOIN "regions" ON "cities"."region_id" = "regions"."id"
JOIN "continents" ON "regions"."continent_id" = "continents"."id"
WHERE "continents"."name" = 'Eldoria';

-- All factions from a certain range of time in history
SELECT
    "factions"."name" "faction_name",
    ages_start."name" "founded_in",
    COALESCE(ages_end."name", 'Presente') "dissolved_in"
FROM "factions"
JOIN "ages" ages_start ON "factions"."start_age" = ages_start."id"
LEFT JOIN "ages" ages_end ON "factions"."end_age" = ages_end."id"
WHERE ages_start."start_year" <= 1000
  AND (ages_end."end_year" IS NULL OR a_end."end_year" >= 1000);


-- ============================================================================
-- MECHANICAL QUERIES
-- ============================================================================

-- Spells from a certain level and school
SELECT "name", "casting_time", "range", "concentration"
FROM "spells"
WHERE "level" = 3 AND "school" = 'Evocation';

-- Items of a specific rarity that needs attunement
SELECT "name", "type", "description"
FROM "items"
WHERE "rarity" IN ('Rare', 'Very Rare', 'Legendary')
  AND "attunement" = 1;
