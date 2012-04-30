-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  Cactrot Rapido
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
	killer:setTitle(CACTROT_DESACELERADOR);
end;