-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  Adamantoise
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
	killer:setTitle(TORTOISE_TORTURER);
end;