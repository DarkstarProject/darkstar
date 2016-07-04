-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Hoodoo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,608,1);
end;
