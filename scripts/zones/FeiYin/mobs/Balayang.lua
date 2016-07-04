-----------------------------------
-- Area: Fei'Yin
--  MOB: Balayang
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,717,1);
    checkGoVregime(player,mob,718,1);
end;