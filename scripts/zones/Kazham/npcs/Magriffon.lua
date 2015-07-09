-----------------------------------
-- Area: Kazham
-- NPC: Magriffon
-- Involved in Quest: Gullible's Travels, Even More Gullible's Travels,
-- Location: (I-7)
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Kazham/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if(player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS) == QUEST_ACCEPTED) then
        tradedGil = trade:getGil();        
        if(tradedGil >= player:getVar("MAGRIFFON_GIL_REQUEST")) then
            player:startEvent(0x0092);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local gulliblesTravelsStatus = player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS);
    local magriffonGilRequest = gulliblesTravelsStatus == QUEST_ACCEPTED and    --Checks if Gullible's Travels is started and gets previously requested gil #
        player:getVar("MAGRIFFON_GIL_REQUEST");  
        
    if(gulliblesTravelsStatus == QUEST_AVAILABLE             -- Gullible's Travels: Fame check and quest available check
        and player:getFameLevel(KAZHAM) >= 6) then
        local gil = math.random(10, 30) * 1000;              -- # 10,000 - 30,000 in ticks of 1k
        player:setVar("MAGRIFFON_GIL_REQUEST", gil); 
        player:startEvent(0x0090, 0, gil);
    elseif(gulliblesTravelsStatus == QUEST_ACCEPTED) then    -- Gullible's Travels: 'In progress' check
        player:startEvent(0x0091, 0, magriffonGilRequest);
    elseif(gulliblesTravelsStatus == QUEST_COMPLETED) then   -- Gullible's Travels: 'Complete' check
        player:startEvent(0x0093);
    else
        player:startEvent(0x008F);
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
    if(csid == 0x0090 and option == 1)  then                 -- Gullible's Travels: First CS
        player:addQuest(OUTLANDS, GULLIBLES_TRAVELS);
    elseif(csid == 0x0092) then                              -- Gullible's Travels: Final CS
        player:tradeComplete();
        player:addGil(tradedGil - player:getVar("MAGRIFFON_GIL_REQUEST"));  -- Returns extra gil paid
        tradedGil = 0;
        player:setVar("MAGRIFFON_GIL_REQUEST", 0);
        player:addFame(KAZHAM, WIN_FAME*30);
        player:setTitle(285);                                -- Global Variable not working for this quest
        player:completeQuest(OUTLANDS, GULLIBLES_TRAVELS);
    end
end;
