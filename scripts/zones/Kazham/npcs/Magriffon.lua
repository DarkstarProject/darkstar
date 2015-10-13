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
require("scripts/globals/keyitems");
require("scripts/zones/Kazham/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS) == QUEST_ACCEPTED) then
        if (trade:getGil() >= player:getVar("MAGRIFFON_GIL_REQUEST")) then
            player:startEvent(0x0092);
        end
    elseif (player:getQuestStatus(OUTLANDS, EVEN_MORE_GULLIBLES_TRAVELS) == QUEST_ACCEPTED and player:getVar("EVEN_MORE_GULLIBLES_PROGRESS") == 0) then
        if (trade:getGil() >= 35000) then
            player:startEvent(0x0096, 0, 256);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local gulliblesTravelsStatus = player:getQuestStatus(OUTLANDS, GULLIBLES_TRAVELS);
    local evenmoreTravelsStatus = player:getQuestStatus(OUTLANDS, EVEN_MORE_GULLIBLES_TRAVELS);

    if (gulliblesTravelsStatus == QUEST_ACCEPTED) then
        local magriffonGilRequest = player:getVar("MAGRIFFON_GIL_REQUEST");
        player:startEvent(0x0091, 0, magriffonGilRequest);
    elseif (gulliblesTravelsStatus == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 6) then
        local gil = math.random(10, 30) * 1000;
        player:setVar("MAGRIFFON_GIL_REQUEST", gil);
        player:startEvent(0x0090, 0, gil);
    elseif (evenmoreTravelsStatus == QUEST_ACCEPTED and player:getVar("EVEN_MORE_GULLIBLES_PROGRESS") == 0) then
        player:startEvent(0x0095, 0, 256, 0, 0, 0, 35000);
    elseif (evenmoreTravelsStatus == QUEST_ACCEPTED and player:getVar("EVEN_MORE_GULLIBLES_PROGRESS") == 1) then
        player:startEvent(0x0097);
    elseif (evenmoreTravelsStatus == QUEST_ACCEPTED and player:getVar("EVEN_MORE_GULLIBLES_PROGRESS") == 2) then
        player:startEvent(0x0098, 0, 1144, 256);
    elseif (gulliblesTravelsStatus == QUEST_COMPLETED) then
        if (evenmoreTravelsStatus == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 7 and player:needToZone() == false) then
        player:startEvent(0x0094, 0, 256, 0, 0, 35000);
        else
            player:startEvent(0x0093);
        end

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
    if (csid == 0x0090 and option == 1)  then                     -- Gullible's Travels: First CS
        player:addQuest(OUTLANDS, GULLIBLES_TRAVELS);
    elseif (csid == 0x0092) then                                  -- Gullible's Travels: Final CS
        player:confirmTrade();
        player:delGil(player:getVar("MAGRIFFON_GIL_REQUEST"));
        player:setVar("MAGRIFFON_GIL_REQUEST", 0);
        player:addFame(KAZHAM, WIN_FAME*30);
        player:setTitle(285);                                     -- Global Variable not working for this quest
        player:completeQuest(OUTLANDS, GULLIBLES_TRAVELS);
        player:needToZone(true);
    elseif (csid == 0x0094 and option == 1) then                  -- Even More Guillible's Travels First CS
        player:addQuest(OUTLANDS, EVEN_MORE_GULLIBLES_TRAVELS);
    elseif (csid == 0x0096) then                                  -- Even More Guillible's Travels Second CS
        player:confirmTrade();
        player:delGil(35000);
        player:setVar("EVEN_MORE_GULLIBLES_PROGRESS", 1);
        player:setTitle(286);
        player:addKeyItem(256);
        player:messageSpecial(KEYITEM_OBTAINED,TREASURE_MAP);
    elseif (csid == 0x0098) then
        player:setVar("EVEN_MORE_GULLIBLES_PROGRESS", 0);
        player:addFame(KAZHAM, WIN_FAME*30);
        player:completeQuest(OUTLANDS, EVEN_MORE_GULLIBLES_TRAVELS);
    end
end;
