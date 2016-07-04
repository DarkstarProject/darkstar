-----------------------------------
-- Area: Cape Teriggan
--  MOB: Goblin Shepherd
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,105,2);
end;
