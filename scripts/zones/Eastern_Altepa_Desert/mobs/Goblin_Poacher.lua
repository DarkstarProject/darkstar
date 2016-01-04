-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Poacher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,113,1);
end;
