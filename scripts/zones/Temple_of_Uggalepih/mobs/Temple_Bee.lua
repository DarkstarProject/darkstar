-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Temple Bee
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,790,2);
    checkGoVregime(player,mob,793,2);
end;