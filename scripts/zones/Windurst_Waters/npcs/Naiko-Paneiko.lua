-----------------------------------
-- Area: Windurst Waters
-- NPC:  Naiko-Paneiko
-- Involved In Quest: Making Headlines, Riding on the Clouds
-- @zone 238
-- @pos -246 -5 -308
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 2) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(SPIRITED_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SPIRITED_STONE);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    function testflag(set,flag)
        return (set % (2*flag) >= flag)
    end
    
    MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
    
    if (MakingHeadlines == 0) then
        player:startEvent(0x0299); -- Quest Start
    elseif (MakingHeadlines == 1) then
        prog = player:getVar("QuestMakingHeadlines_var"); 
        --     Variable to track if player has talked to 4 NPCs and a door
        --     1 = Kyume
        --    2 = Yujuju
        --    4 = Hiwom
        --    8 = Umumu
        --    16 = Mahogany Door
        if (testflag(tonumber(prog),1) == false or testflag(tonumber(prog),2) == false or testflag(tonumber(prog),4) == false or testflag(tonumber(prog),8) == false) then
            rand = math.random(1,2);
            if (rand == 1) then
                player:startEvent(0x029a); -- Quest Reminder 1
            else
                player:startEvent(0x029f); -- Quest Reminder 2
            end            
        elseif (testflag(tonumber(prog),8) == true and testflag(tonumber(prog),16) == false) then
            player:startEvent(0x02a1); -- Advises to validate story
        elseif (prog == 31) then
            rand = math.random(1,2);
            if (rand == 1) then
                player:startEvent(0x02a2); -- Quest finish 1
            elseif (scoop == 4 and door == 1) then
                player:startEvent(0x029e);    -- Quest finish 2
            end
        end
    else
        player:startEvent(0x0297); -- Standard conversation
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
    
    if (csid == 0x0299) then
        player:addQuest(WINDURST,MAKING_HEADLINES);
    elseif (csid == 0x029e or csid == 0x02a2) then
        player:addTitle(EDITORS_HATCHET_MAN);
        player:addGil(GIL_RATE*560);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*560);    
        player:delKeyItem(WINDURST_WOODS_SCOOP);
        player:delKeyItem(WINDURST_WALLS_SCOOP);
        player:delKeyItem(WINDURST_WATERS_SCOOP);
        player:delKeyItem(PORT_WINDURST_SCOOP);
        player:setVar("QuestMakingHeadlines_var",0);
        player:addFame(WINDURST,30);
        player:completeQuest(WINDURST,MAKING_HEADLINES);
    end
    
end;