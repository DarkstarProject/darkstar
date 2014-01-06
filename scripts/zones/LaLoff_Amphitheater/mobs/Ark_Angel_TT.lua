-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel TT
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

   for member = mobid-5, mobid+2 do
      if (GetMobAction(member) == 16) then 
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

-- TODO: Does not move under normal conditions.  Teleports around the center of the arena.
--       Chases while Blood Weapon is active.  Requires teleports to be implemented.

   local mobid = mob:getID()

   -- Party hate.  Keep everybody in the fight.
   for member = mobid-5, mobid+2 do
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
