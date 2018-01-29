-----------------------------------
-- Area: Arrapago Reef
--  NPC: ???
-- Starts: Corsair Af1 ,AF2 ,AF3
-- !pos 457.128 -8.249 60.795 54
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Arrapago_Reef/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local mJob = player:getMainJob();
    local mLvl = player:getMainLvl();

    local equipedForAll = player:getQuestStatus(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS);
    local NoStringsAttached = player:getQuestStatus(AHT_URHGAN,NO_STRINGS_ATTACHED);
    local NoStringsAttachedProgress = player:getVar("NoStringsAttachedProgress");


    if (equipedForAll == QUEST_AVAILABLE and mJob == JOBS.COR and mLvl >= AF1_QUEST_LEVEL) then
        player:startEvent(228);
    elseif (equipedForAll == QUEST_ACCEPTED and player:getVar("EquipedforAllOccasions") ==3) then
        player:startEvent(231);
        player:delKeyItem(WHEEL_LOCK_TRIGGER);
    elseif (equipedForAll == QUEST_COMPLETED and player:getQuestStatus(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS) == QUEST_AVAILABLE and mJob == JOBS.COR and mLvl >= AF2_QUEST_LEVEL) then
        player:startEvent(232);
    elseif (player:getVar("NavigatingtheUnfriendlySeas") ==4) then
        player:startEvent(233);
    elseif (NoStringsAttachedProgress == 3) then
        player:startEvent(214); -- "You see an old, dented automaton..."
    else
        player:messageSpecial(8327); -- "There is nothing else of interest here."
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 228) then
        player:addQuest(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS);
        player:setVar("EquipedforAllOccasions",1);
    elseif (csid== 231) then
        player:setVar("EquipedforAllOccasions",4);
    elseif (csid == 232) then
        player:addQuest(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS);
        player:setVar("NavigatingtheUnfriendlySeas",1);
    elseif (csid == 233) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15601);
        else
            player:addItem(15601) -- Receive item Corsairs culottes
            player:messageSpecial(ITEM_OBTAINED,15601);
            player:completeQuest(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS);
            player:setVar("NavigatingtheUnfriendlySeas",0);
            player:setVar("HydrogauageTimer",0);
        end
    elseif (csid == 214) then
        player:addKeyItem(798);
        player:messageSpecial(KEYITEM_OBTAINED,ANTIQUE_AUTOMATON);
        player:setVar("NoStringsAttachedProgress",4);
    end
end;
