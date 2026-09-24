-- ============================================================================
-- MY RPG WORLD - TYPICAL SQL QUERIES
-- ============================================================================


-- Complete character sheet
SELECT *
FROM "v_character_sheet"
WHERE "character_name" LIKE '%Rurik%';

-- All characters from a certain player
SELECT *
FROM "v_character_sheets"
WHERE "player" = 'voidwrr';


-- Complete npc sheet
SELECT *
FROM "v_npc_sheet"
WHERE "npc_name" LIKE '%Rurik%';

-- All characters from a certain city
SELECT *
FROM "v_character_sheets"
WHERE "player" = 'voidwrr';
