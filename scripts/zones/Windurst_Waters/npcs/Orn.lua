-----------------------------------
-- Area: Windurst Waters
--  NPC: Orn
-- !pos -68 -9 30 238
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    bookwormStatus = player:getQuestStatus(WINDURST,EARLY_BIRD_CATCHES_THE_BOOKWORM);

    if (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 3) then
        player:startEvent(399);

    elseif (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 2) then
        player:startEvent(398);

    elseif (bookwormStatus == QUEST_ACCEPTED and player:getVar("EARLY_BIRD_TRACK_BOOK") == 1) then
        player:startEvent(396);

    elseif (bookwormStatus == QUEST_ACCEPTED and player:hasKeyItem(10) == true) then
        player:startEvent(395);

    else
        player:startEvent(652);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 395) then
        player:setVar("EARLY_BIRD_TRACK_BOOK",1);
    elseif (csid == 398) then
        player:setVar("EARLY_BIRD_TRACK_BOOK",3);
    end

end;