-----------------------------------
-- Area: Den of Rancor
--  MOB: Dire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,796,1);
    checkGoVregime(player,mob,797,1);
end;