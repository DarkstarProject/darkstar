-----------------------------------
-- Area: Temenos N T	
-- NPC:  Praetorian_Guard

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

function onMobDeath(mob,killer)
 if (IsMobDead(16928809)==true and IsMobDead(16928810)==true  and IsMobDead(16928811)==true and IsMobDead(16928812)==true ) then
   	GetNPCByID(16928768+28):setPos(-311,80,419);
	GetNPCByID(16928768+28):setStatus(STATUS_NORMAL);
    GetNPCByID(16928768+162):setPos(-311,80,417);
	GetNPCByID(16928768+162):setStatus(STATUS_NORMAL);
	GetNPCByID(16928768+213):setPos(-311,80,421);
	GetNPCByID(16928768+213):setStatus(STATUS_NORMAL);
	GetNPCByID(16928770+454):setStatus(STATUS_NORMAL);
 end
end;
