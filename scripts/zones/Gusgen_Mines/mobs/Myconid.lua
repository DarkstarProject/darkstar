-----------------------------------
-- Area: Gusgen Mines
--  MOB: Myconid
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,683,2);
end;