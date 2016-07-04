-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Ancient Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,777,1);
    checkGoVregime(player,mob,778,1);
    checkGoVregime(player,mob,779,1);
    checkGoVregime(player,mob,780,1);
    checkGoVregime(player,mob,781,1);
end;