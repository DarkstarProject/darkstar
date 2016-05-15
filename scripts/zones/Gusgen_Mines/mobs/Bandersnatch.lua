-----------------------------------
-- Area: Gusgen Mines
--  MOB: Bandersnatch
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,681,2);
end;