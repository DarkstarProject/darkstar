-----------------------------------
-- Area: Cape Teriggan
--  MOB: Goblin Mercenary
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,105,2);
end;
