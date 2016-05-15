-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Nightmare Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,760,1);
end;