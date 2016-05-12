-----------------------------------
-- Area: Xarcabard
--  MOB: Timeworn Warrior
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,51,1);
    checkRegime(player,mob,52,1);
    checkRegime(player,mob,53,2);
    checkRegime(player,mob,54,3);
end;
