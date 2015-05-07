-----------------------------------
-- Area: Apollyon SE
-- NPC:  Ghost_Clot

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
	GetMobByID(16932993):updateClaim(target);
	GetMobByID(16932994):updateClaim(target);
	GetMobByID(16932995):updateClaim(target);
	GetMobByID(16932996):updateClaim(target);
	GetMobByID(16932997):updateClaim(target);
	GetMobByID(16932998):updateClaim(target);
	GetMobByID(16932999):updateClaim(target);
	GetMobByID(16933000):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   
end;