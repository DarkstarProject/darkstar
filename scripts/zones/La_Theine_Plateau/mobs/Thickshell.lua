-----------------------------------
-- Area: La Theine Plateau
--  MOB: Thickshell
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,70,2);
end;
