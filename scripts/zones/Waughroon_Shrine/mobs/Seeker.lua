-----------------------------------
-- Area: Waughroon Shrine
--  MOB: Searcher
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_HP_STANDBACK, 50);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;
