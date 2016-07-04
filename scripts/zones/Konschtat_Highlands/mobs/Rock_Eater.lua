-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Rock Eater
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,20,1);
end;
