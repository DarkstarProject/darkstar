-----------------------------------
-- Area: Xarcabard
--  MOB: Frost Gigas
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,54,1);
    checkRegime(player,mob,55,2);
end;
