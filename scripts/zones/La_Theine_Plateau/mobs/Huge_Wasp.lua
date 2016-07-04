-----------------------------------
-- Area: La Theine Plateau
--  MOB: Huge Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,5,2);
end;
