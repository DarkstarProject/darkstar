-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Blade Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,648,1);
end;