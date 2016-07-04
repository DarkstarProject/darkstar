-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Chaos Idol
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,779,2);
end;