-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Volcanic Gas
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,755,2);
    checkGoVregime(player,mob,756,2);
    checkGoVregime(player,mob,757,2);
    checkGoVregime(player,mob,758,2);
    checkGoVregime(player,mob,759,1);
end;