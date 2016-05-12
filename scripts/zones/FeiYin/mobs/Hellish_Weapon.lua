-----------------------------------
-- Area: Fei'Yin
--  MOB: Hellish Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,716,2);
end;