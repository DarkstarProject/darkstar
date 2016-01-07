-----------------------------------
-- Area: North Gustaberg
--  MOB: Amethyst Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,19,1);
    checkRegime(ally,mob,59,1);
end;
