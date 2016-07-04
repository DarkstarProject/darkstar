-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Hill Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,37,1);
    checkRegime(player,mob,38,2);
end;
