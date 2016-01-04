-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Retiarius
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,135,3);
end;
