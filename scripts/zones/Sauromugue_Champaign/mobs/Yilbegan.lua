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
	killer:addTitle(TITLE_YILBEGAN_HIDEFLAYER);
end;