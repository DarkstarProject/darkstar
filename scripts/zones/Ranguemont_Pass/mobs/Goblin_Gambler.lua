-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Goblin Gambler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,604,2);
    checkGoVregime(player,mob,605,2);
end;
