-----------------------------------
-- Area: Outer Horutoto
--  MOB: Eight of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,667,1);
end;