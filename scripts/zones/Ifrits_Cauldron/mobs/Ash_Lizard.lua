-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Ash Lizard
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,761,1);
end;