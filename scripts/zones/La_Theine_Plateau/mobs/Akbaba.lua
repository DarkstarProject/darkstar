-----------------------------------
-- Area: La Theine Plateau
--  MOB: Akbaba
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,69,2);
end;
