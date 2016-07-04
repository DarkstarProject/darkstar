-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Greater Gayla
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,101,2);
    checkRegime(player,mob,103,1);
end;
