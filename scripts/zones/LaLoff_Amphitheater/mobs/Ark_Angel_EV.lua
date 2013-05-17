-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel EV
--
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;


-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
   local mobid = mob:getID()

   for member = mobid-4, mobid+3 do
      if (GetMobAction(member) == 16) then 
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)
   local mobid = mob:getID()

   -- Party hate.  Keep everybody in the fight.
   for member = mobid-4, mobid+3 do
      if (GetMobAction(member) == 16) then
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;
