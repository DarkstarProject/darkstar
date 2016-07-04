-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Bat Eye
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,48,1);
    checkRegime(player,mob,49,2);
    checkRegime(player,mob,50,3);
end;
