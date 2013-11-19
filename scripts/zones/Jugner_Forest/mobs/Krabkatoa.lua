-----------------------------------
-- Area: Jugner Forest
-- VNM:  Krabkatoa
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
	killer:addTitle(KRABKATOA_STEAMER);
end;