-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel GK
-----------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");
require("scripts/globals/status");

-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

-- TODO: Call Wyvern onMobEngage

   local mobid = mob:getID()

   for member = mobid-6, mobid+1 do
      if (GetMobAction(member) == 16) then
         GetMobByID(member):updateEnmity(target);
      end
   end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

-- TODO: Allegedly resummons wyvern 30 seconds after death.  Verify and implement if true.
-- TODO: Allegedly uses Meikyo Shisui every 90 seconds.  Verify and implement if true.
-- TODO: AA GK actively seeks to skillchain to Light off of his own WSs under MS, or other AA's WSs.

end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
