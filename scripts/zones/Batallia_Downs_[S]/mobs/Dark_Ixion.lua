-----------------------------------
-- Area: Batallia_Downs_[S]
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
	killer:addTitle(TITLE_IXION_HORNBREAKER);
end;