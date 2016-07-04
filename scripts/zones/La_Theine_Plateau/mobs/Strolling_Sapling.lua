-----------------------------------
-- Area: La Theine Plateau
--  MOB: Strolling Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,5,1);
end;
