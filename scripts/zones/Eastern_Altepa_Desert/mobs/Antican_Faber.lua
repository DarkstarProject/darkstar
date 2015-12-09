-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Faber
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,110,2);
    checkRegime(ally,mob,111,2);
end;
