-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Spartoi Warrior
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,637,1);
end;