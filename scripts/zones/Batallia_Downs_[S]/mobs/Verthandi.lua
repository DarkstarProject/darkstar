-----------------------------------
-- Area: Batallia_Downs_[S]
--  MOB: Verthandi
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
    ally:addTitle(VERTHANDI_ENSNARER);
end;