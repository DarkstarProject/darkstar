-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Wurdalak
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,617,1);
end;
