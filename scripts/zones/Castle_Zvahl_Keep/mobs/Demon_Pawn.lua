-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Demon_Pawn
-- Note: PH for Baronet Romwe
-----------------------------------
require("scripts/zones/Castle_Zvahl_Keep/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,BARONET_ROMWE_PH,10,math.random(3600,28800)); -- 1 to 8 hours
end;
