-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Alchemist
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,764,3);
    checkGoVregime(player,mob,765,3);
end;