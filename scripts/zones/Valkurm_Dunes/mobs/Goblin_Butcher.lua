-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Goblin Butcher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,57,2);
end;
