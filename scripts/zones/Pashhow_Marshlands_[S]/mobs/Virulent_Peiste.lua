-----------------------------------
-- Area: Pashhow Marshlands [S] (90)
--  MOB: Virulent Peiste
-- Note: PH for Sugaar
-----------------------------------
require("scripts/zones/Pashhow_Marshlands_[S]/MobIDs.lua");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,Sugaar_PH,15,28800); -- 15% spawn chance and 8 hour respawn are guesses as no information can be found online regarding it
end;