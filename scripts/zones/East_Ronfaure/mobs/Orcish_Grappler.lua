-----------------------------------
-- Area: East Ronfaure
--  MOB: Orcish Grappler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,67,1);
end;
