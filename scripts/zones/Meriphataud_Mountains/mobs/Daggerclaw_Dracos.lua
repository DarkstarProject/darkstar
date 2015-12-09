-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Daggerclaw Dracos
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,39,1);
end;
