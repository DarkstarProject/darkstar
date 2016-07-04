-----------------------------------
-- Area: Outer Horutoto
--  MOB: Four of Coins
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,663,4);
end;