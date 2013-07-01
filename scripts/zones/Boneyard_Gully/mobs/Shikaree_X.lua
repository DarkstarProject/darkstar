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
  if (mobid == 16809987)then
     mob:spawnmob(16809989);	 
  elseif(mobid == 16809992)then
     mob:spawnmob(16809994);
  elseif(mobid == 16809997)then
     mob:spawnmob(16809999);
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