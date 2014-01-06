-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel's Mandragora
-----------------------------------

require("scripts/zones/LaLoff_Amphitheater/TextIDs");

-----------------------------------

-- TODO: Determine spell list and behavior.  Potentially includes Breakga and Bindga, unless they're TP moves.
-- TODO: Implement shared spawn and victory conditions with Ark Angel's Tiger.

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

   for member = mobid-3, mobid+4 do
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
   for member = mobid-3, mobid+4 do
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
