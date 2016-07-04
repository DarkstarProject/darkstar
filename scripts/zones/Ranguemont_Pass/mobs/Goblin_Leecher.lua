-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Leecher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,605,1);
end;
