-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Bloodsucker (NM)
-- !pos -21.776 16.983 -231.477 167
-----------------------------------
local ID = require("scripts/zones/Bostaunieux_Oubliette/IDs.lua");
require("scripts/globals/groundsofvalor");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,613,1);
end;

function onMobDespawn(mob)
    if (mob:getID() == ID.mob.BLOODSUCKER) then
        UpdateNMSpawnPoint(mob);
        mob:setRespawnTime(3600);
    end
end;
