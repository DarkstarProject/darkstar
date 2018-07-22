-----------------------------------
-- Area: Lower Jeuno
--  NPC: Harnek
-- Starts and Finishes Quest: The Tenshodo Showdown (finish)
-- !pos 44 0 -19 245
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

    if (player:hasKeyItem(dsp.ki.LETTER_FROM_THE_TENSHODO)) then
        player:startEvent(10021,0,dsp.ki.LETTER_FROM_THE_TENSHODO); -- During Quest "The Tenshodo Showdown"
    elseif (player:hasKeyItem(dsp.ki.SIGNED_ENVELOPE)) then
        player:startEvent(10022); -- Finish Quest "The Tenshodo Showdown"
    else
        player:startEvent(217); -- Standard dialog
    end

end;

-- 12  13  9  10  20  217  159  10021  10022
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 10021) then
        player:setVar("theTenshodoShowdownCS",2);
        player:delKeyItem(dsp.ki.LETTER_FROM_THE_TENSHODO);
        player:addKeyItem(dsp.ki.TENSHODO_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.TENSHODO_ENVELOPE);
    elseif (csid == 10022) then
        if (player:getFreeSlotsCount() == 0 or player:hasItem(16764)) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16764); -- Marauder's Knife
        else
            player:delKeyItem(dsp.ki.SIGNED_ENVELOPE);
            player:addItem(16764);
            player:messageSpecial(ITEM_OBTAINED, 16764); -- Marauder's Knife
            player:setVar("theTenshodoShowdownCS",0);
            player:addFame(WINDURST,30);
            player:completeQuest(WINDURST,THE_TENSHODO_SHOWDOWN);
        end
    end

end;