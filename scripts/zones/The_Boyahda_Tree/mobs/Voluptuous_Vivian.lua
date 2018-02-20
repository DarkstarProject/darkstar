-----------------------------------
-- Area: The Boyahda Tree
--  NM:  Voluptuous Vivian (NM)
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
require("scripts/globals/titles");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_DRAW_IN, 2);
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(THE_VIVISECTOR);
end;
