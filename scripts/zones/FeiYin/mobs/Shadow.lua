-----------------------------------
-- Area: Fei'Yin
--  MOB: Shadow
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,712,1);
end;