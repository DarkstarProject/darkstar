-----------------------------------
-- Area: Tahrongi Canyon
-- NPC:  Yilbegan
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
	killer:addTitle(title.YILBEGAN_HIDEFLAYER);
end;