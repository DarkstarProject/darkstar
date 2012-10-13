-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Tzee Xicu the Manifest
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
	killer:addTitle(DEITY_DEBUNKER);
end;