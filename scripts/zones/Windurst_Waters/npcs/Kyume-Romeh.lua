-----------------------------------
--    Area: Windurst Waters
--    NPC:  Kyume-Romeh
--  Involved In Quest: Making Headlines, Hat in Hand
--  @pos -58 -4 23 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    function testflag(set,flag)
        return (set % (2*flag) >= flag)
    end
    
    local hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
    local MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
    local WildcatWindurst = player:getVar("WildcatWindurst");
    
    if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status")==4) then
        player:startEvent(0x0369);
    elseif (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,14) == false) then
        player:startEvent(0x03ab);
    elseif ((hatstatus == 1  or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),16) == false) then
        player:startEvent(0x003c); -- Show Off Hat
    elseif (MakingHeadlines == 1) then
        local prog = player:getVar("QuestMakingHeadlines_var");
        --     Variable to track if player has talked to 4 NPCs and a door
        --     1 = Kyume
        --    2 = Yujuju
        --    4 = Hiwom
        --    8 = Umumu
        --    16 = Mahogany Door
        if (testflag(tonumber(prog),1) == false) then
            player:startEvent(0x029c); -- Quest progress
        else
            player:startEvent(0x029d); -- Quest not furthered
        end
    else
        local rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x025c); -- Standard Conversation
        else
            player:startEvent(0x0189); -- Standard Conversation
        end
    end
end; 
        
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x029c) then
        prog = player:getVar("QuestMakingHeadlines_var");
        player:addKeyItem(WINDURST_WATERS_SCOOP);
        player:messageSpecial(KEYITEM_OBTAINED,WINDURST_WATERS_SCOOP);    
        player:setVar("QuestMakingHeadlines_var",prog+1); 
    elseif (csid == 0x003c) then  -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+16);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
    elseif (csid == 0x0369) then
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",5);
    elseif (csid == 0x03ab) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",14,true);
    end
end;



