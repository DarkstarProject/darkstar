-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Huge_Spider
-- Note: PH for Falcatus Aranei
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,729,1)
end

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.FALCATUS_ARANEI_PH,5,math.random(7200,14400)); -- 2 to 4 hours
end
