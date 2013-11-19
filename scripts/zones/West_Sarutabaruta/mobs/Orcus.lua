-----------------------------------
-- Area: West Sarutabaruta
-- NPC:  Krabkatoa
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
	killer:addTitle(ORCUS_TROPHY_HUNTER);
end;