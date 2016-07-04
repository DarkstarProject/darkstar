-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Stag Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,38,1);
    checkRegime(player,mob,39,2);
end;
