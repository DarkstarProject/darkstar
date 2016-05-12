-----------------------------------
-- Area: La Theine Plateau
--  MOB: Poison Bat
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,71,1);
end;
