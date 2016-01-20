-----------------------------------
-- Area: Cape Teriggan
--  MOB: Sand Cockatrice
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,107,2);
    checkRegime(ally,mob,108,1);
end;
