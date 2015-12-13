-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Lanista
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,138,2);
end;
