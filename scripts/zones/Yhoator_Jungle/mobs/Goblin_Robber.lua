-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Goblin Robber
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,129,2);
end;
