-----------------------------------
-- Area: 
-- NPC:  Pandemonium_Warden
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
	killer:setTitle(PANDEMONIUM_QUELLER);
end;