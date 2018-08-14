-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Bigclaw
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,807,2);
end;