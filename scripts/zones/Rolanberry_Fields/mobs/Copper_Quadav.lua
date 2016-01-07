-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Copper Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,87,2);
end;
