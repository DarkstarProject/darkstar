-----------------------------------
-- Area: Den of Rancor
--  MOB: Succusbus Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,799,1);
end;