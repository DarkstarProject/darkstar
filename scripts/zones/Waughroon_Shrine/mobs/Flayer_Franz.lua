-----------------------------------
-- Area: Waughroon Shrine
-- MOB: Flayer Franz
-- BCNM Fight: The Worm's Turn
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1);
end;

function onMobDeath(mob, player, isKiller)
end;
