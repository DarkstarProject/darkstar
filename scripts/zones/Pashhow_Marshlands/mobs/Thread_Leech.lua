-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Thread Leech
-- Note: PH for Bloodpool Vorax
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,22,1);
    checkRegime(player,mob,23,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.BLOODPOOL_VORAX_PH,5,600); -- 10 minutes
end;
