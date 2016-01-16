-----------------------------------
-- Area:
--  MOB: Long-Armed_Chariot
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
    ally:addTitle(MOON_CHARIOTEER);
end;