-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Mugger
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,604,1);
end;
