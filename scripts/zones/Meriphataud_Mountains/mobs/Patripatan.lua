-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Patripatan
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,63,1);
end;
