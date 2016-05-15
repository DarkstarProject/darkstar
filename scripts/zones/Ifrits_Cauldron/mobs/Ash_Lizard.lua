-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Ash Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,761,1);
end;