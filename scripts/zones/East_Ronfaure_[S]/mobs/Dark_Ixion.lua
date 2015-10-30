-----------------------------------
-- Area: East Ronfaure [S]
-- NPC:  Dark Ixion
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(IXION_HORNBREAKER);
end;