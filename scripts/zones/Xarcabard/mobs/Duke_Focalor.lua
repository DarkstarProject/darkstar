-----------------------------------
-- Area: Xarcabard
--  NM:  Duke Focalor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    checkRegime(killer,mob,55,1);
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((5400),(7200)));
end;
