-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Bhuta
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,103,2);
end;
