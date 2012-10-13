-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Ash Dragon
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
	killer:addTitle(DRAGON_ASHER);
end;