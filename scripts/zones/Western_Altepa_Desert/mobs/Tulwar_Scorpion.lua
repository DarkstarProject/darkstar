-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Tulwar Scorpion
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,137,2);
end;
