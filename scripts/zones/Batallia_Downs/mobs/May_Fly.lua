-----------------------------------
-- Area: Batallia Downs
--  MOB: May Fly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,15,1);
    checkRegime(ally,mob,72,2);
end;
