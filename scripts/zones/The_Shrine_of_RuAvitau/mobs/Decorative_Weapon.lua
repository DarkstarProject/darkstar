-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Decorative Weapon
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,749,1);
    checkGoVregime(player,mob,753,1);
end;