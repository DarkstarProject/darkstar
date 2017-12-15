-----------------------------------
-- Area: Apollyon SE
--  NPC: Flying_Spear
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
     local mobID = mob:getID();
     if (mobID == 16933034) then -- time

     elseif (mobID == 16933037) then -- recover

     elseif (mobID == 16933040) then -- item

     end
end;
