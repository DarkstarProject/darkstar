-----------------------------------
-- Area: Oldton Movalpolos
--  MOB: Goblin Wolfman
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
end;
