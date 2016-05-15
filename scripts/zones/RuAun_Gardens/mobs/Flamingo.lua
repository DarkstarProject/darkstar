-----------------------------------
-- Area: RuAun Gardens
--  MOB: Flamingo
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,142,1);
end;
