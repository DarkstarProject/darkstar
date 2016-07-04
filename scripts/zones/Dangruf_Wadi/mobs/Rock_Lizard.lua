-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Rock Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,639,2);
end;
