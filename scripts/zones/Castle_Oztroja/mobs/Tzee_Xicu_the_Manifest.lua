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
	killer:setTitle(DEITY_DEBUNKER);
end;