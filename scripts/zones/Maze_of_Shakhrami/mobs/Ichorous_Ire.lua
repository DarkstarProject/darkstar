-----------------------------------
-- Area: Maze of Shakhrami
-- NPC:  Ichorous_Ire
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
	killer:addTitle(JELLYBANE);
end;