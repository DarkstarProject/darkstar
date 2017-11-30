-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Salamander
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180);
end;

function onMobDeath(mob, player, isKiller)
end;
