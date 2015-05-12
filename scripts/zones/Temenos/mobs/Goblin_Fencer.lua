-----------------------------------
-- Area: Temenos N T	
-- NPC: Goblin_Fencer

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
GetMobByID(16928831):updateClaim(target);
GetMobByID(16928833):updateClaim(target);
GetMobByID(16928835):updateClaim(target);

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
 if(IsMobDead(16928831)==true and IsMobDead(16928832)==true and IsMobDead(16928833)==true and IsMobDead(16928834)==true and IsMobDead(16928835)==true )then
   	GetNPCByID(16928768+39):setPos(-599,85,438);
	GetNPCByID(16928768+39):setStatus(STATUS_NORMAL);

	GetNPCByID(16928768+456):setStatus(STATUS_NORMAL);
 end
end;