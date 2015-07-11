-----------------------------------
-- Area: Jugner_Forest_[S]
-- NPC:  Dark Ixion
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
	killer:addTitle(title.IXION_HORNBREAKER);
end;