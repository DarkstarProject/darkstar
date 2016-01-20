-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Yhoator Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,130,2);
end;
