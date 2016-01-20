-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Snipper
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,8,1);
    checkRegime(ally,mob,9,2);
end;
