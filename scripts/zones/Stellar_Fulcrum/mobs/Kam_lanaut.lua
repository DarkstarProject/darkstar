-----------------------------------
-- Area: Stellar Fulcrum
-- NPC:  Kam'lanaut
-- Zilart Mission 8 BCNM Fight
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

function onMobDeath(mob,killer)
	killer:addTitle(DESTROYER_OF_ANTIQUITY);
end;