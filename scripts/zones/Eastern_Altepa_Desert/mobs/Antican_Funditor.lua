-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Funditor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,111,1);
end;
