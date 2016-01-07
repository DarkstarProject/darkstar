-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Ponderer
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
    if (ally:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and ally:getVar("PromathiaStatus")==5) then
        ally:setVar("PromathiaStatus",6);
    end
end;