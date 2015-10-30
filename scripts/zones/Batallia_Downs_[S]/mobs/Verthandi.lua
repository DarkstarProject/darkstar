-----------------------------------
-- Area: Batallia_Downs_[S]
-- NPC:  Verthandi
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
	killer:addTitle(VERTHANDI_ENSNARER);
end;