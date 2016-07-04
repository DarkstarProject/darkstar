-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Amber Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,83,1);
end;
