-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Covin Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,653,1);
end;