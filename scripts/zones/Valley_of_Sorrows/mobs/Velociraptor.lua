-----------------------------------
-- Area: Valley of Sorrows
--  MOB: Velociraptor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,139,1);
    checkRegime(ally,mob,140,1);
end;
