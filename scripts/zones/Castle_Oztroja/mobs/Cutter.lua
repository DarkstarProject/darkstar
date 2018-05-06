-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Cutter
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.CHARMABLE, 1);
end;

function onMobDeath(mob, player, isKiller)
end;
