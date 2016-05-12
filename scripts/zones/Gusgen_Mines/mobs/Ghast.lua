-----------------------------------
-- Area: Gusgen Mines
--  MOB: Ghast
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,679,1);
    checkGoVregime(player,mob,680,2);
    checkGoVregime(player,mob,684,1);
end;