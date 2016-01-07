-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Greater Gayla
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,101,2);
    checkRegime(ally,mob,103,1);
end;
