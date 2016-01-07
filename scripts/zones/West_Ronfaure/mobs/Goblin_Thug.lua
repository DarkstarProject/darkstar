-----------------------------------
-- Area: West Ronfaure
--  MOB: Goblin Thug
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,56,2);
end;
