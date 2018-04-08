-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Notes: Involved in Missions: THREE_PATHS
-----------------------------------
require("scripts/zones/Lower_Delkfutts_Tower/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (
        player:getCurrentMission(COP) == THREE_PATHS and
        player:getVar("COP_Tenzen_s_Path") == 6 and
        player:hasKeyItem(DELKFUTT_RECOGNITION_DEVICE) and
        not GetMobByID(DISASTER_IDOL):isSpawned()
    ) then
        SpawnMob(DISASTER_IDOL):updateClaim(player);
    elseif (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 7 and player:hasKeyItem(DELKFUTT_RECOGNITION_DEVICE)) then
        player:startEvent(25);
    end

    return 1;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
     if (csid == 25) then
         player:setVar("COP_Tenzen_s_Path",8);
     end
end;