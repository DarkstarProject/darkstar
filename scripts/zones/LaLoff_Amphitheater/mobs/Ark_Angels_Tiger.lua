-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel's Tiger
-----------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/LaLoff_Amphitheater/TextIDs");
require("scripts/globals/status");
-----------------------------------

-- TODO: Implement shared spawning and victory system with Ark Angel's Mandragora.

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
   local mobid = mob:getID()

   for member = mobid-2, mobid+5 do
      if (GetMobAction(member) == 16) then
         GetMobByID(member):updateEnmity(target);
      end
    end
end;

function onMobFight(mob,target)

end;

function onMobDeath(mob, player, isKiller)
end;
