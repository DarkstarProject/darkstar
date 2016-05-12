-----------------------------------
-- Area: Fei'Yin
--  MOB: Sentient Carafe
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,718,2);
end;