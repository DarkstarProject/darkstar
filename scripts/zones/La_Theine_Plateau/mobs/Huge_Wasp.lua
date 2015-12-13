-----------------------------------
-- Area: La Theine Plateau
--  MOB: Huge Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,5,2);
end;
