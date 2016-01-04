-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Essedarius
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,134,2);
end;
