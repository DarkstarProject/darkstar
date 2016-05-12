-----------------------------------
-- Area: La Theine Plateau
--  MOB: Grass Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,6,1);
    checkRegime(player,mob,71,2);
end;
