-----------------------------------
-- Area: Xarcabard
--  NM:  Duke Focalor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,55,1);
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((5400),(7200)));
end;
