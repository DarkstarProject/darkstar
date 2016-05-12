-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Bilesucker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,607,1);
end;
