-----------------------------------
-- Area: Batallia_Downs_[S]
--  MOB: Dark Ixion
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

function onMobDeath(mob, killer, ally)
    ally:addTitle(IXION_HORNBREAKER);
end;