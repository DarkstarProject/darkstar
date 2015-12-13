-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Rock Eater
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,20,1);
end;
