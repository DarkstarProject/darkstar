-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  Behemoth
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
	killer:addTitle(BEHEMOTHS_BANE);
end;