-----------------------------------
-- Area: Apollyon SE
--  NPC: Flying_Spear
-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Apollyon/TextIDs");
require("scripts/globals/limbus");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
     local mobID = mob:getID();
     if (mobID == 16933034) then -- time

     elseif (mobID == 16933037) then -- recover

     elseif (mobID == 16933040) then -- item

     end
end;
