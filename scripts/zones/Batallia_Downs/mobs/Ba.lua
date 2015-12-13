-----------------------------------
-- Area: Batallia Downs
--  MOB: Ba
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,15,2);
    checkRegime(ally,mob,73,2);
end;
