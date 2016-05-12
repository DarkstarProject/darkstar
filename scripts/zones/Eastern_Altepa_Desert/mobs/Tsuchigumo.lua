-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Tsuchigumo
-- Involved in Quest: 20 in Pirate Years
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    if (player:getVar("twentyInPirateYearsCS") == 3) then
        player:setVar("TsuchigumoKilled",player:getVar("TsuchigumoKilled") + 1);
    end

end;