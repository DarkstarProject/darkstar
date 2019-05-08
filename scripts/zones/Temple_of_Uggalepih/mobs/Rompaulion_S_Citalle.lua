-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Rompaulion S Citalle
-- Involved with San d'Oria quest "Knight Stalker"
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- check for Cleuvarion death
    if player:getVar("KnightStalker_Progress") == 4 and GetMobByID(mob:getID() - 1):isDead() then
        player:setVar("KnightStalker_Kill", 1)
    end
end
