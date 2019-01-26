-----------------------------------
-- Area: Balga's Dais
--  MOB: Black Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1);
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.BLACK_DRAGON_SLAYER);
end;
