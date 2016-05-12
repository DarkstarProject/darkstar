-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Artificer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,609,2);
end;
