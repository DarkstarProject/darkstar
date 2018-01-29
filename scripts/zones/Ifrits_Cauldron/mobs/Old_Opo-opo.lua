-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Old Opo-opo
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,756,1);
end;