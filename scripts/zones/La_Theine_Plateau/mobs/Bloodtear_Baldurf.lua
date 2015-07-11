-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Bloodtear_Baldurf
-----------------------------------

require("scripts/globals/fieldsofvalor");
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
	killer:addTitle(title.THE_HORNSPLITTER);
end;