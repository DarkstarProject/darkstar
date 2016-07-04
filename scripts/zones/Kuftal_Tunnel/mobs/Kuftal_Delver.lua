-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kuftal Delver
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,742,1);
end;