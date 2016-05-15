-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Hover Tank
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,794,2);
end;