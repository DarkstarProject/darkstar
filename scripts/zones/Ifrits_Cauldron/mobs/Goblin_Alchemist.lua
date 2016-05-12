-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Goblin Alchemist
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,757,1);
end;