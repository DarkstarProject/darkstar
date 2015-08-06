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
    if (player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS) == QUEST_ACCEPTED) then
        if (trade:getGil() >= player:getVar("MAGRIFFON_GIL_REQUEST")) then
            player:startEvent(0x0092);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local gulliblesTravelsStatus = player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS);

    if (gulliblesTravelsStatus == QUEST_ACCEPTED) then
        local magriffonGilRequest = player:getVar("MAGRIFFON_GIL_REQUEST");
        player:startEvent(0x0091, 0, magriffonGilRequest);
    elseif (gulliblesTravelsStatus == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 6) then
        local gil = math.random(10, 30) * 1000;
        player:setVar("MAGRIFFON_GIL_REQUEST", gil);
        player:startEvent(0x0090, 0, gil);
    elseif (gulliblesTravelsStatus == QUEST_COMPLETED) then
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
    if (csid == 0x0090 and option == 1)  then                 -- Gullible's Travels: First CS
        player:addQuest(OUTLANDS, GULLIBLES_TRAVELS);
    elseif (csid == 0x0092) then                              -- Gullible's Travels: Final CS
        player:confirmTrade();
        player:delGil(player:getVar("MAGRIFFON_GIL_REQUEST"));
        player:setVar("MAGRIFFON_GIL_REQUEST", 0);
        player:addFame(KAZHAM, WIN_FAME*30);
        player:setTitle(285);                                -- Global Variable not working for this quest
        player:completeQuest(OUTLANDS, GULLIBLES_TRAVELS);
    end
end;
