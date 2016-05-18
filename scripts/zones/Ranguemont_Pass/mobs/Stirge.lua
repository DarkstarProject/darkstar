-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Stirge
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,606,1);
end;
