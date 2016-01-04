-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Strolling Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,81,1);
end;
