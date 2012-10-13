-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Hydra
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
	killer:addTitle(HYDRA_HEADHUNTER);
end;