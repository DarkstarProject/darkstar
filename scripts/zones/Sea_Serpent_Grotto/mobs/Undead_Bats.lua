-----------------------------------
-- Area: Seas Serpent Grotto
--  MOB: Undead Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,804,2);
end;