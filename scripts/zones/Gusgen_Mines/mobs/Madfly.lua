-----------------------------------
-- Area: Gusgen Mines
--  MOB: Madfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,686,2);
end;