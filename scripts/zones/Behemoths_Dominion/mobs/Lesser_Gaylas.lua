-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Lesser Gaylas
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,101,1);
    checkRegime(player,mob,102,1);
end;
