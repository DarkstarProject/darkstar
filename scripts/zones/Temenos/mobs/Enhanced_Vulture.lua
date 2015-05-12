-----------------------------------
-- Area: Temenos W T	
-- NPC: Enhanced_Vulture

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
	    GetMobByID(16928959):updateClaim(target);
		GetMobByID(16928960):updateClaim(target);
	    GetMobByID(16928961):updateClaim(target);
		GetMobByID(16928962):updateClaim(target);
		GetMobByID(16928963):updateClaim(target);
		GetMobByID(16928964):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

    local mobX = mob:getXPos();
	local mobY = mob:getYPos();
	local mobZ = mob:getZPos();
   if(IsMobDead(16928959)==true and IsMobDead(16928960)==true  and IsMobDead(16928961)==true
   and IsMobDead(16928962)==true  and IsMobDead(16928963)==true and IsMobDead(16928964)==true)then
   	GetNPCByID(16928768+17):setPos(mobX,mobY,mobZ);
	GetNPCByID(16928768+17):setStatus(STATUS_NORMAL);
	GetNPCByID(16928770+470):setStatus(STATUS_NORMAL);
  end
end;
