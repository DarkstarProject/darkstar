-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Grotto Pugil
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,808,2);
end;