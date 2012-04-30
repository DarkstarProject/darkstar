-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  King Behemoth
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
	killer:setTitle(BEHEMOTH_DETHRONER);
end;