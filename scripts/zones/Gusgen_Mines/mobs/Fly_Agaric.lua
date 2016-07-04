-----------------------------------
-- Area: Gusgen Mines
--  MOB: Fly Agaric
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,680,1);
end;