-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Aura Gear
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,749,1);
    checkGoVregime(player,mob,752,1);
end;