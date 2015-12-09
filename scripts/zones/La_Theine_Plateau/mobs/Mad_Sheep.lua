-----------------------------------
-- Area: La Theine Plateau
--  MOB: Mad Sheep
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,69,1);
    checkRegime(ally,mob,70,1);
end;
