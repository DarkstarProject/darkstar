-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Cockatrice
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,772,1);
    checkGoVregime(player,mob,773,2);
end;