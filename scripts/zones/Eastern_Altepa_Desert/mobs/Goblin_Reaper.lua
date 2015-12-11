-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Reaper
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,113,3);
end;
