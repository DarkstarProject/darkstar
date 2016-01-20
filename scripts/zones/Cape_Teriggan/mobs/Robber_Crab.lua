-----------------------------------
-- Area: Cape Teriggan
--  MOB: Robber Crab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,105,1);
    checkRegime(ally,mob,106,1);
end;
