-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Stone Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,639,1);
end;
