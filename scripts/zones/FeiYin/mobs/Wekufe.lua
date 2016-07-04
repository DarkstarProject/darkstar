-----------------------------------
-- Area: Fei'Yin
--  MOB: Wekufe
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,717,2);
end;