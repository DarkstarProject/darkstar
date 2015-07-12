-----------------------------------
-- Area: West Sarutabaruta
-- NPC:  Krabkatoa
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
	killer:addTitle(TITLE_ORCUS_TROPHY_HUNTER);
end;