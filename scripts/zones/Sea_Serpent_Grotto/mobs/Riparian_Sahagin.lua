-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Riparian Sahagin
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,806,1);
    checkGoVregime(player,mob,807,1);
    checkGoVregime(player,mob,808,1);
end;