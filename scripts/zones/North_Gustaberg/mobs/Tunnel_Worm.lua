-----------------------------------
-- Area: North Gustaberg
--  MOB: Tunnel Worm
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,16,1);
end;
