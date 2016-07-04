-----------------------------------
-- Area: Temenos N T    
-- NPC:  Telchines_Monk

-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");

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
 if (IsMobDead(16928788)==true and IsMobDead(16928789)==true  and IsMobDead(16928792)==true   and IsMobDead(16928793)==true ) then
       GetNPCByID(16928768+26):setPos(19,80,430);
    GetNPCByID(16928768+26):setStatus(STATUS_NORMAL);
    GetNPCByID(16928768+160):setPos(16,80,430);
    GetNPCByID(16928768+160):setStatus(STATUS_NORMAL);
    GetNPCByID(16928768+211):setPos(22,80,430);
    GetNPCByID(16928768+211):setStatus(STATUS_NORMAL);
 end
end;