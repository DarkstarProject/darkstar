-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Goblin Tamer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,740,2);
end;