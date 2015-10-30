-----------------------------------
-- Area: Misareaux Coast
-- Mob:  Boggelmann
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

function onMobDeath(mob, killer)
  if (killer:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and killer:getVar("COP_Boggelmann_KILL") == 0) then
     killer:setVar("COP_Boggelmann_KILL",1);
  end
end;
