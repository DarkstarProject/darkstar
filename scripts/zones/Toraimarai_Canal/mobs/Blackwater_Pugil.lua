-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Blackwater Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,624,1);
end;
