-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Boggart
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,63,2);
end;
