-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Yagudo Acolyte
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,29,1);
    checkRegime(ally,mob,61,1);
end;
