-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Tomb Wolf
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,675,1);
end;