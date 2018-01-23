-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Royal Leech
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,804,1);
end;