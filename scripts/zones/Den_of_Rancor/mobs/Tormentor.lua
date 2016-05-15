-----------------------------------
-- Area: Den of Rancor
--  MOB: Tormentor
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,802,1);
    checkGoVregime(player,mob,803,1);
end;