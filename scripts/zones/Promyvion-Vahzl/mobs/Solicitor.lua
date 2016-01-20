-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Solicitor
-----------------------------------


require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and ally:getVar("PromathiaStatus") == 3) then
        ally:setVar("PromathiaStatus",4);
    end
end;