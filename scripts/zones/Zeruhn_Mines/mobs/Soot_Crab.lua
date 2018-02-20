-----------------------------------
-- Area: Zeruhn Mines (172)
--   Mob: Soot Crab
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,628,2);
end;
