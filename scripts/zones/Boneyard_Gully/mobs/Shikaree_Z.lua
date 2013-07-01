-----------------------------------
-- Area: 
--  
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
	mob:addStatusEffect(EFFECT_REGAIN,7,3,0);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
local mobid=mob:getID();
  if (mobid == 16809985)then
     SpawnMob(16809988);	 
  elseif(mobid == 16809990)then
     SpawnMob(16809993);
  elseif(mobid == 16809995)then
     SpawnMob(16809998);
  end
  
	
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
end;