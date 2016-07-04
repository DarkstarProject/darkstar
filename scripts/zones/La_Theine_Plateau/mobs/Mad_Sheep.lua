-----------------------------------
-- Area: La Theine Plateau
--  MOB: Mad Sheep
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,69,1);
    checkRegime(player,mob,70,1);
end;
