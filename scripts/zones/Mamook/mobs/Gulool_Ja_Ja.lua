-----------------------------------
-- Area: Mamook
-- NPC:  Gulool Ja Ja
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
	killer:addTitle(SHINING_SCALE_RIFLER);
end;