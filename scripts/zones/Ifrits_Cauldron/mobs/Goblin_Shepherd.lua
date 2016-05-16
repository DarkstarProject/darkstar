-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Goblin Shepherd
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,757,1);
end;