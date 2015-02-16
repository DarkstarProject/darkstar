-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Medusa
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
   mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
   
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function OnMobEngaged(mob, target)
    
end;
function onMobFight(mob,target)
    
end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
   
end;