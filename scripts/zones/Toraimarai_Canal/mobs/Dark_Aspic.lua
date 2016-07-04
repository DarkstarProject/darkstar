-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Dark Aspic
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,619,3);
    checkGoVregime(player,mob,620,1);
end;
