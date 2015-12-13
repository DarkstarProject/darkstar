-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Huge Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,81,2);
    checkRegime(ally,mob,82,1);
end;
