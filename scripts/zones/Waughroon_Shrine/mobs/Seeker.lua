-----------------------------------
-- Area: Waughroon Shrine
--  MOB: Searcher
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.HP_STANDBACK, 50);
end;

function onMobDeath(mob, player, isKiller)
end;
