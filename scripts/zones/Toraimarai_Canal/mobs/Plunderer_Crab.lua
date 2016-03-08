-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Plunderer Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,623,1);
end;
