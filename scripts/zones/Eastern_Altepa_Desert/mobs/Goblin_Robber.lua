-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Robber
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,113,2);
end;
