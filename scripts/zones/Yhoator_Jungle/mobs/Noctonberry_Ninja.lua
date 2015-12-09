-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Noctonberry Ninja
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,133,1);
end;
