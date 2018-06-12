-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Hurricane Wyvern
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,762,1);
end;