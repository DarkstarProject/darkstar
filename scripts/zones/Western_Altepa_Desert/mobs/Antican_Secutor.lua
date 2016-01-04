-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Secutor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,138,1);
end;
