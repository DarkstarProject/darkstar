-----------------------------------
-- Area: Dangruf Wadi (191)
--  Mob: Geyser Lizard
-----------------------------------

function onMobInitialize( mob )
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 600);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setLocalVar("pop", os.time() + (math.random(45, 75) * 60));
end;
