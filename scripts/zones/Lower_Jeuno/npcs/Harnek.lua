-----------------------------------
-- Area: Lower Jeuno
--  NPC: Harnek
-- Starts and Finishes Quest: The Tenshodo Showdown (finish)
-- @zone 245
-- !pos 44 0 -19
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(LETTER_FROM_THE_TENSHODO)) then
        player:startEvent(10021,0,LETTER_FROM_THE_TENSHODO); -- During Quest "The Tenshodo Showdown"
    elseif (player:hasKeyItem(SIGNED_ENVELOPE)) then
        player:startEvent(10022); -- Finish Quest "The Tenshodo Showdown"
    else
        player:startEvent(217); -- Standard dialog
    end

end;

-- 0x000c  0x000d  0x0009  0x000a  0x0014  217  0x009f  10021  10022

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 10021) then
        player:setVar("theTenshodoShowdownCS",2);
        player:delKeyItem(LETTER_FROM_THE_TENSHODO);
        player:addKeyItem(TENSHODO_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_ENVELOPE);
    elseif (csid == 10022) then
        if (player:getFreeSlotsCount() == 0 or player:hasItem(16764)) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16764); -- Marauder's Knife
        else
            player:delKeyItem(SIGNED_ENVELOPE);
            player:addItem(16764);
            player:messageSpecial(ITEM_OBTAINED, 16764); -- Marauder's Knife
            player:setVar("theTenshodoShowdownCS",0);
            player:addFame(WINDURST,30);
            player:completeQuest(WINDURST,THE_TENSHODO_SHOWDOWN);
        end
    end

end;