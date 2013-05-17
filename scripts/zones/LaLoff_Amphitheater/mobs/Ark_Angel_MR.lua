-----------------------------------
-- Area: LaLoff Amphitheater
-- NPC:  Ark Angel MR
--
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

-- TODO: Summons pet when party is engaged.  Randomly chosen between Tiger and Mandragora.
--       Current victory system doesn't readily support a random choice of pet while having
--       the pet as a victory condition.  Therefore, Mandragora just isn't used at this time.

   local mobid = mob:getID()

   for member = mobid-1, mobid+6 do
      if (GetMobAction(member) == 16) then 
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

-- TODO: Determine conditions for resummoning pet, if this is done.

   local mobid = mob:getID()

   -- Party hate.  Keep everybody in the fight.
   for member = mobid-1, mobid+6 do
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
