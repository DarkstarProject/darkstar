-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Aura Sculpture
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,749,1);
    checkGoVregime(player,mob,754,1);
end;