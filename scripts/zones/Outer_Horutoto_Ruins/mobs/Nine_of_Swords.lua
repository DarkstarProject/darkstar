-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,668,3);
end;