-----------------------------------
-- Area: Fei'Yin
--  MOB: Underworld Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,713,1);
    checkGoVregime(player,mob,714,1);
    checkGoVregime(player,mob,715,1);
end;