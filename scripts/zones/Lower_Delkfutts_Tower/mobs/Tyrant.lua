-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NM:  Tyrant
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 14);
end;

function onMobDeath(mob, player, isKiller)
end;