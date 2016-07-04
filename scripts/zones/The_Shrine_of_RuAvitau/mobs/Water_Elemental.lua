-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Water Elemental
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,750,1);
end;