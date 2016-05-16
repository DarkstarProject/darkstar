-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Haunt
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,612,2);
end;
