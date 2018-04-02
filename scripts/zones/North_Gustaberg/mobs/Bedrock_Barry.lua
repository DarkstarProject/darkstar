-----------------------------------
-- Area: North Gustaberg
--  NM:  Bedrock Barry
-----------------------------------
require("scripts/globals/fieldsofvalor");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(dsp.effects.STONESKIN, math.random(30,40), 0, 300);
end;

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,16,1);
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((3600),(4200)));
end;
