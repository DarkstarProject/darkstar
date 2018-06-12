-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Spartoi Sorcerer
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,638,1);
end;