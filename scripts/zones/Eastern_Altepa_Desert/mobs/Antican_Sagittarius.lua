-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Sagittarius
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,112,2);
end;
