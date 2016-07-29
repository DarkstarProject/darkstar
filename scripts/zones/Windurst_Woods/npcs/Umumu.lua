-----------------------------------
--    Area: Windurst Woods
--    NPC:  Umumu
--  Involved In Quest: Making Headlines
--  @pos 32.575 -5.250 141.372 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Woods/TextIDs");

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
    
    local MakingHeadlines = player:getQuestStatus(WINDURST,MAKING_HEADLINES);
    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,3) == false) then
        player:startEvent(0x02db);
    elseif (MakingHeadlines == 1) then
        local prog = player:getVar("QuestMakingHeadlines_var");
        --     Variable to track if player has talked to 4 NPCs and a door
        --     1 = Kyume
        --    2 = Yujuju
        --    4 = Hiwom
        --    8 = Umumu
        --    16 = Mahogany Door
        if (testflag(tonumber(prog),16) == true) then
            player:startEvent(0x017f); -- Advised to go to Naiko        
        elseif (testflag(tonumber(prog),8) == false) then
            player:startEvent(0x017d); -- Get scoop and asked to validate
        else 
            player:startEvent(0x017e); -- Reminded to validate
        end
    elseif (MakingHeadlines == 2) then
    
        local rand = math.random(1,3);
        
        if (rand == 1) then
            player:startEvent(0x0181); -- Conversation after quest completed
        elseif (rand == 2) then
            player:startEvent(0x0182); -- Conversation after quest completed
        elseif (rand == 3) then
            player:startEvent(0x019e); -- Standard Conversation
        end
    else
        player:startEvent(0x019e); -- Standard Conversation
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
    if (csid == 0x017d) then
        prog = player:getVar("QuestMakingHeadlines_var");
        player:addKeyItem(WINDURST_WOODS_SCOOP);
        player:messageSpecial(KEYITEM_OBTAINED,WINDURST_WOODS_SCOOP);
        player:setVar("QuestMakingHeadlines_var",prog+8);
    elseif (csid == 0x02db) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",3,true);
    end
end;



