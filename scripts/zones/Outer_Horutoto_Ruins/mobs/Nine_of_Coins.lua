-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Coins
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,668,4);
end;