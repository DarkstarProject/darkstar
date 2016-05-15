-----------------------------------
-- Area: Den of Rancor
--  MOB: Million Eyes
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,800,1);
end;