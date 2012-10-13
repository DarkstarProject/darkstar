-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  Aspidochelone
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
	killer:addTitle(ASPIDOCHELONE_SINKER);
end;