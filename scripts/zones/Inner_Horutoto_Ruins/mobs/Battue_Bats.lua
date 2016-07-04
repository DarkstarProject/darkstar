-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Battue Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,647,1);
end;