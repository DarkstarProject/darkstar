-----------------------------------
-- Area: Batallia Downs
--  MOB: Sabertooth Tiger
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,74,1);
    checkRegime(ally,mob,75,1);
end;
