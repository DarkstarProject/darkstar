-----------------------------------
-- Area: Jugner_Forest_[S]
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
	killer:addTitle(KRABKATOA_STEAMER);
end;