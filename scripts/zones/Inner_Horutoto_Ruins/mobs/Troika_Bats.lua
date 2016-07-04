-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Troika Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,651,1);
end;