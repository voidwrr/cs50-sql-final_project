-- ============================================================================
-- MY RPG WORLD - TYPICAL SQL QUERIES
-- ============================================================================



-- Complete character sheet
SELECT *
FROM "v_character_sheets"
WHERE "character_name" LIKE '%Eldrin%';
