-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Enkidu
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,743,1);
    checkGoVregime(player,mob,747,1);
end;