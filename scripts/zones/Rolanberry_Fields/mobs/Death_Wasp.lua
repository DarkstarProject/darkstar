-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Death Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,25,1);
    checkRegime(ally,mob,85,1);
end;
