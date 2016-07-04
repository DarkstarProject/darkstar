-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Skinnymajinx
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,654,2);
end;