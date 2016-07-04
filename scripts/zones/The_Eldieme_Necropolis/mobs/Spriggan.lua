-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Spriggan
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,672,1);
    checkGoVregime(player,mob,673,1);
end;