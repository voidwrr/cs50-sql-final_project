-- ============================================================================
-- MY RPG WORLD - TYPICAL SQL QUERIES
-- ============================================================================



-- Complete character sheet
SELECT *
FROM "v_character_sheets"
WHERE "character_name" LIKE '%Rurik%';


-- All characters from a certain player
SELECT *
FROM "v_character_sheets"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE "username" = 'voidwrr'
);
