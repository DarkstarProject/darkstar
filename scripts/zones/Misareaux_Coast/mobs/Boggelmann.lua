-----------------------------------
-- Area: Misareaux Coast
--  Mob: Boggelmann
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
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    if (ally:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and ally:getVar("COP_Boggelmann_KILL") == 0) then
        ally:setVar("COP_Boggelmann_KILL",1);
    end
end;
