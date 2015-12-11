-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Canyon Rarab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,94,1);
end;
