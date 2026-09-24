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

--The inventory from a certain character
SELECT "item_name", "item_type", "rarity", "requires_attunement"
FROM "v_inventory_list"
WHERE "entity_type" = 'PC' AND "owner_name" LIKE 'João%';


-- Complete npc sheet
SELECT *
FROM "v_npc_sheet"
WHERE "npc_name" LIKE '%Rurik%';

-- All characters from a certain city
SELECT *
FROM "v_npc_sheet"
WHERE "city" = 'Waterdeep';
