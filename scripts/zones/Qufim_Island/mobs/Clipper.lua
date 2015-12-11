-----------------------------------
-- Area: Qufim Island
--  MOB: Clipper
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,41,1);
    checkRegime(ally,mob,42,1);
    checkRegime(ally,mob,43,2);
end;
