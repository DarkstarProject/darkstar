-----------------------------------
-- Area: Riverne - Site B01 (BCNM)
-- NPC:  Bahamut
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
	killer:addTitle(TITLE_WYRM_ASTONISHER);
end;