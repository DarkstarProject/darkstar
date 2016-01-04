-----------------------------------
-- Area: Qufim Island
--  MOB: Acrophies
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,45,1);
end;
