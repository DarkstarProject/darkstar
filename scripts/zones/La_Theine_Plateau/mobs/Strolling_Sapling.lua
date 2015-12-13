-----------------------------------
-- Area: La Theine Plateau
--  MOB: Strolling Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,5,1);
end;
