-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Ooze
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,603,2);
end;
