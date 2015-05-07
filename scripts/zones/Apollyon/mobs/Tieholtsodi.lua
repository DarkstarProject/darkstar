-----------------------------------
-- Area: Apollyon SE
-- NPC:  Tieholtsodi

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
	GetMobByID(16933007):updateClaim(target);
	GetMobByID(16933008):updateClaim(target);
	GetMobByID(16933009):updateClaim(target);
	GetMobByID(16933010):updateClaim(target);
	GetMobByID(16933011):updateClaim(target);
	GetMobByID(16933012):updateClaim(target);
	GetMobByID(16933013):updateClaim(target);
	GetMobByID(16933014):updateClaim(target);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   
end;