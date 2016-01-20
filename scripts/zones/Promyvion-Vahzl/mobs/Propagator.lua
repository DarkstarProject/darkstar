-----------------------------------
-- Area: Promyvion vahzl
--  MOB: Propagator
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
    if (ally:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and ally:getVar("PromathiaStatus")==1) then
        ally:setVar("PromathiaStatus",2);
    end
end;