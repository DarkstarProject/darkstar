-----------------------------------
-- Area: Fei'Yin
--  MOB: Vampire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,711,1);
end;