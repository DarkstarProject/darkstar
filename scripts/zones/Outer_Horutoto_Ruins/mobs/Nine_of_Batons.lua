-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,668,2);
end;