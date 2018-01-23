-----------------------------------
-- Area: La Theine Plateau
--  MOB: Nihniknoovi
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 600);
end;

function onMobDeath(mob, player, isKiller)
end;