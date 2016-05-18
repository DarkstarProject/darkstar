-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Butcher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,631,2);
    checkGoVregime(player,mob,633,3);
end;