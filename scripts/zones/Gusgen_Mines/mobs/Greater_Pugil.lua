-----------------------------------
-- Area: Gusgen Mines
--  MOB: Greater Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,682,1);
end;