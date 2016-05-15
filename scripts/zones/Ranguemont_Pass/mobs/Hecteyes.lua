-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Hecteyes
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,606,2);
end;
