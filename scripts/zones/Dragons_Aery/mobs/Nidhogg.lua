-----------------------------------
-- Area: Dragons Aery
-- NPC:  Nidhogg
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
	killer:setTitle(NIDHOGG_SLAYER);
end;