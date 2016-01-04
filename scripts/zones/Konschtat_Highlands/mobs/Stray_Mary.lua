-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Stray_Mary
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
    ally:addTitle(MARYS_GUIDE);
end;