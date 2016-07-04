-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Lich
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,619,2);
end;
