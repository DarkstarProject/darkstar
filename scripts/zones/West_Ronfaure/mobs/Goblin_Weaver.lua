-----------------------------------
-- Area: West Ronfaure
--  MOB: Goblin Weaver
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,56,2);
end;
