-----------------------------------
-- Area: Xarcabard
--  MOB: Evil Eye
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,53,1);
    checkRegime(player,mob,54,2);
    checkRegime(player,mob,55,3);
end;
