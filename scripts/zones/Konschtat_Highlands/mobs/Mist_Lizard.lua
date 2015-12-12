-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Mist Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,20,2);
    checkRegime(ally,mob,82,2);
end;
