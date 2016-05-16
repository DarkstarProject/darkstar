-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Chaser
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,608,2);
end;
