-----------------------------------
-- Area: La Theine Plateau
--  MOB: Thickshell
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,70,2);
end;
