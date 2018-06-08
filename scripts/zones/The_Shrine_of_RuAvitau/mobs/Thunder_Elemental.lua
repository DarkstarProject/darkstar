-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Thunder Elemental
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,750,1);
end;