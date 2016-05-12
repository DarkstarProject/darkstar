-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Drowned Bones
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,624,2);
end;
