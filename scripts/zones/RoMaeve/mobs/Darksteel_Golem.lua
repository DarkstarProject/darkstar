-----------------------------------
-- Area: RoMaeve
--  MOB: Darksteel Golem
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,122,2);
    checkRegime(ally,mob,123,2);
end;
