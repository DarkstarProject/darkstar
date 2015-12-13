-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Decurio
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,112,1);
end;
