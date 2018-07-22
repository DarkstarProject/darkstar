-----------------------------------
-- Area: Bastok Mines
--  NPC: Roh Latteh
-- Involved in Quest: Mom, The Adventurer?
-- Finishes Quest: The Signpost Marks the Spot
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(BASTOK,MOM_THE_ADVENTURER) ~= QUEST_AVAILABLE and player:getVar("MomTheAdventurer_Event") == 1) then
        if (trade:hasItemQty(13454,1) and trade:getItemCount() == 1) then -- Trade Copper Ring
            player:startEvent(95);
        end
    end

end;

function onTrigger(player,npc)
    local HasPainting = player:hasKeyItem(dsp.ki.PAINTING_OF_A_WINDMILL);

    if (player:getQuestStatus(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT) == QUEST_ACCEPTED and HasPainting == true) then
        player:startEvent(96);
    else
        player:startEvent(29);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 95) then
        player:addKeyItem(dsp.ki.LETTER_FROM_ROH_LATTEH);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.LETTER_FROM_ROH_LATTEH);
        player:setVar("MomTheAdventurer_Event",2);
        player:tradeComplete();
    elseif (csid == 96) then
        local freeInventory = player:getFreeSlotsCount();

        if (freeInventory > 0) then
            player:completeQuest(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);
            player:delKeyItem(dsp.ki.PAINTING_OF_A_WINDMILL);
            player:addTitle(dsp.title.TREASURE_SCAVENGER);
            player:addFame(BASTOK,50);
            player:addItem(12601);
            player:messageSpecial(ITEM_OBTAINED,12601); -- Linen Robe
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12601);
        end
    end

end;