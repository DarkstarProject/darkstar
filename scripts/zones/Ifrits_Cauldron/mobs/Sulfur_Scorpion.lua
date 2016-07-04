-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Sulfur Scorpion
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,759,2);
end;