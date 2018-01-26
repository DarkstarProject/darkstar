-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Ogre Bat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,638,2);
end;