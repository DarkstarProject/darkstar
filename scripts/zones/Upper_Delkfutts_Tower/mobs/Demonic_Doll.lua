-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Demonic Doll
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,788,3);
    checkGoVregime(player,mob,789,3);
end;