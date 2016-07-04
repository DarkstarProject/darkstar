-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Young Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,83,1);
end;
