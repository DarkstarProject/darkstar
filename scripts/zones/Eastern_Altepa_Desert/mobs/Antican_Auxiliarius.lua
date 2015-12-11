-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Auxiliarius
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,110,1);
end;
