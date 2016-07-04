-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Aura Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,749,1);
    checkGoVregime(player,mob,753,1);
end;