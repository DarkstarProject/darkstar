-----------------------------------
-- Area: Yhoator Jungle
--  MOB: White Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,129,1);
end;
