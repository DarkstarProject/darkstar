-----------------------------------
-- Area: Windurst Walls
--   NPC: Yoran-Oran
--  Type: Standard NPC
-- @zone: 239
--  @pos -109.987 -14 203.338
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local MandragoraMad = player:getQuestStatus(WINDURST,MANDRAGORA_MAD);
    if (MandragoraMad ~= QUEST_AVAILABLE) then
        if (trade:getItemCount() == 1) then
            -- Cornette
            if (trade:hasItemQty(17344,1)) then
                player:tradeComplete();
                player:addFame(WINDURST,10);
                player:addGil(GIL_RATE*200);
                player:startEvent(0x00fb,GIL_RATE*200);
                player:completeQuest(WINDURST,MANDRAGORA_MAD);
            -- Sulfur
            elseif (trade:hasItemQty(934,1)) then
                player:tradeComplete();
                player:addFame(WINDURST,25);
                player:addGil(GIL_RATE*250);
                player:startEvent(0x00fc,GIL_RATE*250);
                player:completeQuest(WINDURST,MANDRAGORA_MAD);
            -- ThreeLeafBud
            elseif (trade:hasItemQty(1154,1)) then
                player:tradeComplete();
                player:addFame(WINDURST,50);
                player:addGil(GIL_RATE*1200);
                player:startEvent(0x00fd,GIL_RATE*1200);
                player:completeQuest(WINDURST,MANDRAGORA_MAD);
            -- FourLeafBud
            elseif (trade:hasItemQty(4369,1)) then
                player:tradeComplete();
                player:addFame(WINDURST,10);
                player:addGil(GIL_RATE*120);
                player:startEvent(0x00fe,GIL_RATE*120);
                player:completeQuest(WINDURST,MANDRAGORA_MAD);
            -- Letter
            elseif (trade:hasItemQty(1150,1)) then
                player:tradeComplete();
                player:addFame(WINDURST,100);
                player:addGil(GIL_RATE*5500);
                player:startEvent(0x00ff,GIL_RATE*5500);
                player:completeQuest(WINDURST,MANDRAGORA_MAD);
            else
                player:startEvent(0x00fa);
            end
        else
            player:startEvent(0x00fa);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local MandragoraMad = player:getQuestStatus(WINDURST,MANDRAGORA_MAD);
    local blastFromPast = player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST);
    local EMORIES_OF_A_MAIDEN = player:getVar("MEMORIES_OF_A_MAIDEN_Status");
    local LouverancePath = player:getVar("COP_Louverance_s_Path");
    local MissionStatus = player:getVar("MissionStatus");    
    
    --optional windy 9-1
    if (player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD and MissionStatus == 4) then       
        player:startEvent(0x01B7);
    elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and EMORIES_OF_A_MAIDEN == 3) then
        player:startEvent(0x01D5);
    elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and EMORIES_OF_A_MAIDEN == 6) then
        player:startEvent(0x01D6,0,587,0,586);
    elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:hasKeyItem(MIMEO_FEATHER)==true) then       
        player:startEvent(0x01D7);
    elseif (player:getCurrentMission(COP) == THE_ROAD_FORKS and EMORIES_OF_A_MAIDEN == 11 ) then
        player:startEvent(0x01D8); 
    elseif (player:getCurrentMission(COP) == THREE_PATHS and LouverancePath == 3 ) then    
        player:startEvent(0x01E1);
    elseif (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path") == 4 ) then    
        player:startEvent(0x01D9);
    elseif (blastFromPast == QUEST_ACCEPTED) then
        local blastPastProg = player:getVar("BlastFromThePast_Prog");
        if (blastPastProg == 1) then
            player:startEvent(0x00dd);
            player:setVar("BlastFromThePast_Prog",2);
        elseif (blastPastProg == 2) then    
            player:startEvent(0x00de);
        end
    elseif (blastFromPast == QUEST_COMPLETED and player:needToZone() == true) then
        player:startEvent(0x00df);    
        
    elseif (MandragoraMad == QUEST_AVAILABLE) then
        player:startEvent(0x00f9);
    elseif (MandragoraMad == QUEST_ACCEPTED) then
        player:startEvent(0x0100);

    else
        player:startEvent(0x00f5);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
    if (csid == 0x00f9) then
        player:addQuest(WINDURST,MANDRAGORA_MAD);
    elseif (csid == 0x01D5) then
      player:setVar("MEMORIES_OF_A_MAIDEN_Status",4);
    elseif (csid == 0x01D6) then
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",7);
        player:delKeyItem(CRACKED_MIMEO_MIRROR);
    elseif (csid == 0x01D7) then
        player:delKeyItem(MIMEO_FEATHER);
         player:delKeyItem(SECOND_MIMEO_FEATHER);
        player:delKeyItem(THIRD_MIMEO_FEATHER);
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",9);
    elseif (csid == 0x01D8) then    
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",12);    --end 3-3B: Windurst Route: "Memories of a Maiden"
    elseif (csid == 0x01E1) then
        player:setVar("COP_Louverance_s_Path",4);
    elseif (csid == 0x01D9) then    
        player:setVar("COP_Ulmia_s_Path",5);
    elseif (csid == 0x01B7) then
        player:setVar("MissionStatus",5)
    end
end;