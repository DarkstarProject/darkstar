-----------------------------------
-- Area: Zeruhn Mines (172)
--   Mob: Ding_Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,626,1);
end;
