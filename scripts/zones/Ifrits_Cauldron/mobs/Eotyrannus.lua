-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Eotyrannus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,758,1);
end;