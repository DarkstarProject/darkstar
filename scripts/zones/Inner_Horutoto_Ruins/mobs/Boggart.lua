-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Boggart
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,650,1);
end;