-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Greatclaw
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,811,2);
end;