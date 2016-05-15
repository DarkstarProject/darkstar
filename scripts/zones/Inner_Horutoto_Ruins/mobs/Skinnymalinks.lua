-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Skinnymalinks
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,653,2);
end;