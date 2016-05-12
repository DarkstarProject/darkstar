-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Wespe
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,790,2);
end;