-----------------------------------
-- Area: Fei'Yin
--  MOB: Killing Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,716,1);
end;