-----------------------------------
-- Area: Outer Horutoto
--  MOB: Nine of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,668,1);
end;