-----------------------------------
-- Area: 
-- NPC:  Bloodtear_Baldurf
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
	killer:setTitle(THE_HORNSPLITTER);
end;