-----------------------------------
-- Area: RuAun Gardens
--  MOB: Eraser (Monster)
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,143,2);
    checkRegime(player,mob,144,1);
end;
