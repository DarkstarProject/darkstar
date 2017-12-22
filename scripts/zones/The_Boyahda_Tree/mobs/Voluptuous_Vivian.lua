-----------------------------------
-- Area: The Boyahda Tree
--  NM:  Voluptuous Vivian (NM)
-----------------------------------
require("scripts/globals/titles");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    mob:setMobMod(MOBMOD_DRAW_IN, 2);
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(THE_VIVISECTOR);
end;

function onMobDespawn(mob)
end;
