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

function onMobDeath(mob, killer, ally)

    if (ally:getVar("twentyInPirateYearsCS") == 3) then
        ally:setVar("TsuchigumoKilled",ally:getVar("TsuchigumoKilled") + 1);
    end

end;