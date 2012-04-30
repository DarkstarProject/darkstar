-----------------------------------
-- Area: Monastic Cavern
-- NPC:  Overlord Bakgodek
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:setTitle(OVERLORD_OVERTHROWER);
end;