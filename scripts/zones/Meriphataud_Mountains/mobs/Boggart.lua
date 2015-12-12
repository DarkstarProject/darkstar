-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Boggart
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,63,2);
end;
