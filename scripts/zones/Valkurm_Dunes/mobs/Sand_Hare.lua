-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Sand Hare
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,7,2);
end;
