-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Natty Gibbon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,646,2);
end;