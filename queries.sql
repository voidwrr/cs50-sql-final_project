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
SELECT *
FROM "v_npc_sheet"
WHERE "city" = 'Waterdeep';


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
