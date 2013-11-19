-----------------------------------
-- Area: Beaucedine Glacier
-- NPC:  Yilbegan
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
	killer:addTitle(YILBEGAN_HIDEFLAYER);
end;