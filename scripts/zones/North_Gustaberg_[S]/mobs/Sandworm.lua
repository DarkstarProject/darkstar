-----------------------------------
-- Area: Crystal War Areas
-- NPC:  Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
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
	killer:addTitle(title.SANDWORM_WRANGLER);
end;