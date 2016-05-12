-----------------------------------
-- Area: Outer Horutoto
--  MOB: Seven of Coins
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,666,4);
end;