-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Lost Soul
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,103,2);
end;
