-----------------------------------
-- Area: Pso'xja
--  MOB: Nunyunuwi
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
    if (ally:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and ally:getVar("PromathiaStatus")==3) then
        ally:setVar("PromathiaStatus",4);
    end
end;