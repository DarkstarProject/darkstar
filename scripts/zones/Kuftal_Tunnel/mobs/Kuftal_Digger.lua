-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kuftal Digger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,739,1);
end;