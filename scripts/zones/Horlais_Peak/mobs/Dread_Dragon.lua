-----------------------------------
-- Area: Horlais Peak
--  MOB: Dread Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)
    ally:addTitle(DREAD_DRAGON_SLAYER);
end;