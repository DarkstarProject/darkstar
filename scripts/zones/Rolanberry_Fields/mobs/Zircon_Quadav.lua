-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Zircon Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,87,2);
end;
