-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Coins
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,667,4);
end;