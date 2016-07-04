-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Hovering Oculus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,607,2);
end;
