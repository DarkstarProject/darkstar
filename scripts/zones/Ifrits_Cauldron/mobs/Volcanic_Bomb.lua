-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Volcanic Bomb
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,760,2);
    checkGoVregime(player,mob,761,2);
    checkGoVregime(player,mob,762,2);
end;