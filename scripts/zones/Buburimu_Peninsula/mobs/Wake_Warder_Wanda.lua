-----------------------------------
-- Area: Buburimi Peninsula
--  MOB: Wake Warder Wanda
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 50); -- just one spell to spam
    mob:addMod(MOD_SILENCERES,20);
    mob:addMod(MOD_BINDRES,20);
end;

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    mob:setMod(MOD_REGAIN, 25);
end;

function onMobDisengage(mob)
    mob:setMod(MOD_REGAIN,0);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200)); -- repop 60-70min
end;
