-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Goblin Bounty Hunter
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,57,2);
end;
