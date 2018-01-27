-----------------------------------
-- Area: Zeruhn Mines (172)
--   Mob: River_Crab
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,627,1);
end;
