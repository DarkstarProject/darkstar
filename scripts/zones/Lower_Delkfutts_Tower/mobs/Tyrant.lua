-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NM:  Tyrant
-----------------------------------
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 14);
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;