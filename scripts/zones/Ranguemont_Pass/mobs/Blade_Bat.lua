-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Blade Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,602,2);
end;
