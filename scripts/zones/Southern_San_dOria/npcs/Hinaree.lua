-----------------------------------
-- Area: Southern San d'Oria
--   NPC: Hinaree
-- Type: Standard NPC
-- @zone 230
-- !pos -301.535 -10.199 97.698
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
 local currentday = tonumber(os.date("%j"));
        if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status")==6 ) then
        player:startEvent(23);
        elseif (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path")== 0 ) then
        player:startEvent(22);
        elseif (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus")==3 and player:getVar("Promathia_kill_day") ~= currentday and player:getVar("COP_louverance_story")== 0 ) then
        player:startEvent(757);
        else
    player:startEvent(580);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 23) then
     player:setVar("EMERALD_WATERS_Status",7);  --end 3-3A: San d'Oria Route: "Emerald Waters"
    elseif (csid == 22) then
     player:setVar("COP_Ulmia_s_Path",1);
     elseif (csid == 757) then
      player:setVar("COP_louverance_story",1);
    end
end;

