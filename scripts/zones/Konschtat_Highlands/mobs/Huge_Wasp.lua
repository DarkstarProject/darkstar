-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Huge Wasp
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,81,2);
    checkRegime(player,mob,82,1);
end;
