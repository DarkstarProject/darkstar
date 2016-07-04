-----------------------------------
-- Area: Outer Horutoto
--  MOB: Thorn Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,670,1);
end;