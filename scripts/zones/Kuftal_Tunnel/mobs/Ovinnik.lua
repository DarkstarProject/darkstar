-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Ovinnik
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,741,1);
end;