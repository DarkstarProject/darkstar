-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Bakru
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,26,1);
end;
