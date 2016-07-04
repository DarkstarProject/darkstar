-----------------------------------
-- Area: Den of Rancor
--  MOB: Demonic Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,801,1);
end;