-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  Fei'Yin
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
	killer:setTitle(CASSIENOVA);
end;