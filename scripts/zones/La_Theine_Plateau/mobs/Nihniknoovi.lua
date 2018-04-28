-----------------------------------
-- Area: La Theine Plateau
--  MOB: Nihniknoovi
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 600);
end;

function onMobDeath(mob, player, isKiller)
end;