-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Lesser Manticore
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,112,4);
    checkRegime(ally,mob,113,4);
end;
