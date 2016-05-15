-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Nekros Hound
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,677,2);
    checkGoVregime(player,mob,678,2);
end;