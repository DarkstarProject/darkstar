-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Aura Pot
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,749,1);
    checkGoVregime(player,mob,751,1);
end;