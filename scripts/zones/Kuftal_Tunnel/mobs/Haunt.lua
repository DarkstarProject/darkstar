-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Haunt
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,736,2);
end;