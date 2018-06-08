-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Veteran Quadav
-- Note: PH for Ni'Zho Bladebender
-----------------------------------
require("scripts/zones/Pashhow_Marshlands/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,NI_ZHO_BLADEBENDER_PH,10,3600); -- 1 hour
end;
