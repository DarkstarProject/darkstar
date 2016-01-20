-----------------------------------
-- Area: Qufim Island
--  MOB: Seeker Bats
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,42,2);
end;
