-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Young Opo-opo
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,131,1);
    checkRegime(ally,mob,132,2);
end;
