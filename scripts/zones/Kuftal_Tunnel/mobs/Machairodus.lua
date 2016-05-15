-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Machairodus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,742,2);
end;