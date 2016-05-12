-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Hurricane Wyvern
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,762,1);
end;