-----------------------------------
-- Area: Sauromugue Champaign
-- NM:   Yilbegan
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
	killer:addTitle(YILBEGAN_HIDEFLAYER);
end;