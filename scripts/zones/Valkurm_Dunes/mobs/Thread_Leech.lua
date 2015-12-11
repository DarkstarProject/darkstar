-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Thread Leech
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,57,1);
end;
