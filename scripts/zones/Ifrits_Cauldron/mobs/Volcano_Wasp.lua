-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Volcano Wasp
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,755,1);
end;