-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Will-o-the-Wisp
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,650,2);
end;