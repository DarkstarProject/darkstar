-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Wadi Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,641,2);
end;