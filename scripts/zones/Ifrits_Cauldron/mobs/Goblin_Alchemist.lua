-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Goblin Alchemist
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,757,1);
end;