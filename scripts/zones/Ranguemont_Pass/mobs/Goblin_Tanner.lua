-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Tanner
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,609,1);
end;
