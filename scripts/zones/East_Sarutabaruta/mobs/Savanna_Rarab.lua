-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Savanna Rarab
-- Note: PH for Sharp Eared Ropipi
-----------------------------------
require("scripts/zones/East_Sarutabaruta/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,91,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,SHARP_EARED_ROPIPI_PH,20,300); -- 5 minutes
end;
