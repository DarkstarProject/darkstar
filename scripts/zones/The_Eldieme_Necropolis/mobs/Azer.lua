-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Azer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,673,2);
end;