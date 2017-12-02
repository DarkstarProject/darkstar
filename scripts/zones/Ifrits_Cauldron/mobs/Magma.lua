-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Magma
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(17617214):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
