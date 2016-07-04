-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Crane Fly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,36,1);
    checkRegime(player,mob,37,2);
end;
