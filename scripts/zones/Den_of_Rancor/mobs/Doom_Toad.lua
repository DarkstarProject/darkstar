-----------------------------------
-- Area: Den of Rancor
--  MOB: Doom Toad
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,801,2);
end;