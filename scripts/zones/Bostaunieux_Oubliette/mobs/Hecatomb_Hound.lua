-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Hecatomb Hound
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,612,1);
end;
