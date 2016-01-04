-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Goblin Welldigger
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,137,1);
end;
