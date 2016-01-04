-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Speculator
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,112,3);
end;
