-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Hill Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,7,1);
    checkRegime(ally,mob,8,2);
end;
