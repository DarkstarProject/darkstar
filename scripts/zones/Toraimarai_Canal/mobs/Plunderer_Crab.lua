-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Plunderer Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,623,1);
end;
