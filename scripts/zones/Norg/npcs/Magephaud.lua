-----------------------------------
-- Area: Norg
--  NPC: Magephaud
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
    EveryonesGrudge = player:getQuestStatus(OUTLANDS,EVERYONES_GRUDGE);
    if (EveryonesGrudge == QUEST_ACCEPTED) then
        if (trade:hasItemQty(748,3) and trade:getItemCount() == 3) then
            player:startEvent(118,748);
        end
    end
end;

function onTrigger(player,npc)

    nFame = player:getFameLevel(NORG);
    if (player:getQuestStatus(OUTLANDS,EVERYONES_GRUDGE) == QUEST_AVAILABLE and player:getVar("EVERYONES_GRUDGE_KILLS") >= 1 and nFame >= 2) then
        player:startEvent(116,748);  -- Quest start - you have tonberry kills?! I got yo back ^.-
    elseif (player:getVar("EveryonesGrudgeStarted")  == 1) then
        player:startEvent(117,748);
    elseif (player:getQuestStatus(OUTLANDS,EVERYONES_GRUDGE) == QUEST_COMPLETED) then
        player:startEvent(119);  -- After completion cs
    else
        player:startEvent(115);
    end
    -- printf("CSID: %u",nFame);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 116) then
        player:addQuest(OUTLANDS,EVERYONES_GRUDGE);
        player:setVar("EveryonesGrudgeStarted",1);
    elseif (csid == 118) then
        player:completeQuest(OUTLANDS,EVERYONES_GRUDGE);
        player:tradeComplete();
        player:addFame(NORG,80);
        player:addKeyItem(291);    -- Permanent Tonberry key
        player:messageSpecial(KEYITEM_OBTAINED,291);
        player:setVar("EveryonesGrudgeStarted",0);
        player:addTitle(HONORARY_DOCTORATE_MAJORING_IN_TONBERRIES);
    end
end;



