-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Living Statue
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,47,2);
    checkRegime(player,mob,48,2);
    checkRegime(player,mob,49,3);
end;
