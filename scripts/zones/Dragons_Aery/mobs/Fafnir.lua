-----------------------------------
-- Area: Dragons Aery
-- NPC:  Fafnir
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
	killer:setTitle(FAFNIR_SLAYER);
end;