-----------------------------------
-- Area: East Sarutabaruta
--  MOB: River Crab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,92,1);
end;
