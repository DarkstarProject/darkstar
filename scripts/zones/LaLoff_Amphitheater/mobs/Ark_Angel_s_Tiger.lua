-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel's Tiger
--
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");

-- TODO: Implement shared spawning and victory system with Ark Angel's Mandragora.

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

   for member = mobid-2, mobid+5 do
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
   for member = mobid-2, mobid+5 do
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
