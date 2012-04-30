-----------------------------------
-- Area: Attohwa Chasm
-- NPC:  Tiamat
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
	killer:setTitle(TIAMAT_TROUNCER);
end;