-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Tsuchigumo
-- Involved in Quest: 20 in Pirate Years
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getVar("twentyInPirateYearsCS") == 3 then
        player:addVar("TsuchigumoKilled", 1)
    end
end
