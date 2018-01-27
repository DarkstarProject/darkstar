-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Cutter
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_CHARMABLE, 1);
end;

function onMobDeath(mob, player, isKiller)
end;
