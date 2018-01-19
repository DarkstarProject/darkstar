-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Rumble Crawler
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/settings");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,791,2);
end;

function onMobDespawn(mob)
    -- Rumble Crawler that spawns in place of Habetrot
    if(mob:getID() == HABETROT + 1) then
        GetNPCByID(HABETROT_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    end
end;