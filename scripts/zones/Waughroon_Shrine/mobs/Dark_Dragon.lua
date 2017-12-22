-----------------------------------
-- Area: Waughroon Shrine
--  MOB: Dark Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_DRAW_IN, 1);
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(DARK_DRAGON_SLAYER);
end;
