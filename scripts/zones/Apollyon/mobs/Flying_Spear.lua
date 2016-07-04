-----------------------------------
-- Area: Apollyon SE
-- NPC:  Flying_Spear

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Apollyon/TextIDs");

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
 local mobID = mob:GetID();    
 if (mobID ==16933034) then -- time
 
 elseif (mobID ==16933037) then -- recover
 
 elseif (mobID ==16933040) then -- item
 
 end
 
end;