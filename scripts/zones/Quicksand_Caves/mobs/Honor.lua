-----------------------------------
-- Area: Quicksand Caves
--  MOB: Honor
-- Coming of Age (San dOria Mission 8-1)
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getCurrentMission(SANDORIA) == COMING_OF_AGE and ally:getVar("MissionStatus") == 2) then
        ally:setVar("MissionStatus",3);
    end

end;