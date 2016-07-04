-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Panna Cotta
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,614,2);
    checkGoVregime(player,mob,615,2);
end;
