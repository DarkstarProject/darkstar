-----------------------------------
--    Area: Windurst Walls
--    NPC:  Hiwon-Biwon
--  Involved In Quest: Making Headlines, Curses, Foiled...Again!?
--    Working 100%
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Walls/TextIDs");

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
    local CFA2 = player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_2);
    
    -- Curses,Foiled ... Again!?
    if (CFA2 == QUEST_ACCEPTED and player:hasItem(552) == false) then
        player:startEvent(0x00B6); -- get Hiwon's hair
    elseif (CFA2 == QUEST_COMPLETED and MakingHeadlines ~= QUEST_ACCEPTED) then
        player:startEvent(0x00B9); -- New Dialog after CFA2
    
    -- Making Headlines
    elseif (MakingHeadlines == 1) then
        prog = player:getVar("QuestMakingHeadlines_var");
        --     Variable to track if player has talked to 4 NPCs and a door
        --     1 = Kyume
        --    2 = Yujuju
        --    4 = Hiwom
        --    8 = Umumu
        --    16 = Mahogany Door
        if (testflag(tonumber(prog),4) == false) then
            if (player:getQuestStatus(WINDURST,CURSES_FOILED_AGAIN_1) == 1) then
                if (math.random(1,2) == 1) then
                    player:startEvent(0x011b); -- Give scoop while sick
                else
                    player:startEvent(0x011c); -- Give scoop while sick
                end    
            else
                player:startEvent(0x0119); -- Give scoop
            end
        else
            player:startEvent(0x011a); -- "Getting back to the maater at hand-wand..."
        end
    else
        local rand = math.random(1,5);
        if (rand == 1) then
            print (rand);
            player:startEvent(0x0131); -- Standard Conversation
        elseif (rand == 2) then
            print (rand);
            player:startEvent(0x0132); -- Standard Conversation
        elseif (rand == 3) then
            print (rand);
            player:startEvent(0x00a8); -- Standard Conversation
        elseif (rand == 4) then
            print (rand);
            player:startEvent(0x00aa); -- Standard Conversation
        elseif (rand == 5) then
            print (rand);
            player:startEvent(0x00a9); -- Standard Conversation
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
    
    -- Making Headlines
    if (csid == 0x0119 or csid == 0x011b or csid == 0x011c) then
        prog = player:getVar("QuestMakingHeadlines_var");
        player:addKeyItem(WINDURST_WALLS_SCOOP);
        player:messageSpecial(KEYITEM_OBTAINED,WINDURST_WALLS_SCOOP);
        player:setVar("QuestMakingHeadlines_var",prog+4);
    
    -- Curses,Foiled...Again!?
    elseif (csid == 0x00B6) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,552); -- Hiwon's hair
        else
            player:addItem(552);
            player:messageSpecial(ITEM_OBTAINED,552); -- Hiwon's hair
        end
    end
end;



