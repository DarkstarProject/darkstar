-----------------------------------
-- Area: Yhoator Jungle
--  MOB: Noctonberry Ninja
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,133,1);
end;
