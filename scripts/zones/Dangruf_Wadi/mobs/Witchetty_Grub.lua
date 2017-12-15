-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Witchetty Grub
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,643,1);
end;