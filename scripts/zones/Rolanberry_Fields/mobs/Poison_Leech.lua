-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Poison Leech
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,85,2);
end;
