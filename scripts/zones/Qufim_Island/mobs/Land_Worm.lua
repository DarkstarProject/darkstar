-----------------------------------
-- Area: Qufim Island
--  MOB: Land Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,41,2);
end;
