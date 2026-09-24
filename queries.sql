-- ============================================================================
-- MY RPG WORLD - TYPICAL SQL QUERIES
-- ============================================================================


-- Complete character sheet
SELECT *
FROM "v_character_sheet"
WHERE "character_name" LIKE '%Rurik%';

-- All characters from a certain player
SELECT *
FROM "v_character_sheet"
WHERE "player" = 'voidwrr';

-- The inventory from a certain character
SELECT "item_name", "item_type", "rarity", "requires_attunement"
FROM "v_inventory_list"
WHERE "entity_type" = 'PC' AND "owner_name" LIKE 'Tytus%';

-- The spellbook from a certain character
SELECT "spell_name", "spell_level", "school", "casting_time", "range", "concentration"
FROM "v_spell_list"
WHERE "entity_type" = 'PC' AND "caster_name" LIKE 'Gandalf%'
ORDER BY "spell_level" ASC, "spell_name" ASC;


-- Complete npc sheet
SELECT *
FROM "v_npc_sheet"
WHERE "npc_name" LIKE '%Rurik%';

-- All characters from a certain city
SELECT "npc_name", "race", "primary_class", "factions"
FROM "v_npc_sheet"
WHERE "lived_at" = 'Waterdeep' OR "hometown" = 'Waterdeep';


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



-- Spells from a certain level and school
SELECT "name", "casting_time", "range", "concentration"
FROM "spells"
WHERE "level" = 3 AND "school" = 'Evocation';

-- Items of a specific rarity that needs attunement
SELECT "name", "type", "description"
FROM "items"
WHERE "rarity" IN ('Rare', 'Very Rare', 'Legendary')
  AND "attunement" = 1;
