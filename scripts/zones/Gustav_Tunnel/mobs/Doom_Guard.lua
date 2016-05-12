-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Doom Guard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,765,2);
    checkGoVregime(player,mob,767,1);
    checkGoVregime(player,mob,768,1);
end;