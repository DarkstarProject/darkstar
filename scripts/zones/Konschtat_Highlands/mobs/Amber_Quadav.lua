-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Amber Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,83,1);
end;
