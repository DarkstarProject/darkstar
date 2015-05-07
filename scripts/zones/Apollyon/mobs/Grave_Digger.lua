-----------------------------------
-- Area: Apollyon SE
-- NPC:  Grave_Digger

-----------------------------------
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------

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
	GetMobByID(16933021):updateClaim(target);
	GetMobByID(16933022):updateClaim(target);
	GetMobByID(16933023):updateClaim(target);
	GetMobByID(16933024):updateClaim(target);
	GetMobByID(16933025):updateClaim(target);
	GetMobByID(16933026):updateClaim(target);
	GetMobByID(16933027):updateClaim(target);
	GetMobByID(16933028):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   
end;