-----------------------------------
-- Area: West Ronfaure
--  MOB: Carrion Worm
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,1,1);
end;
