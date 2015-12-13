-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Yhoator Mandragora
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,130,1);
end;
