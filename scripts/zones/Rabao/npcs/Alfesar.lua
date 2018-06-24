-----------------------------------
-- Area: Rabao
--  NPC: Alfesar
-- Standard Info NPC
--Starts The Missing Piece
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local TheMissingPiece = player:getQuestStatus(OUTLANDS,THE_MISSING_PIECE);
    local Fame = player:getFameLevel(RABAO);

    if (TheMissingPiece == QUEST_AVAILABLE and Fame >= 4) then -- start quest
        player:startEvent(6);
    elseif (TheMissingPiece == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.ANCIENT_TABLET_FRAGMENT))) then -- talk to again with quest activated
        player:startEvent(7);
    elseif (TheMissingPiece == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.ANCIENT_TABLET_FRAGMENT)) then -- successfully retrieve key item
        player:startEvent(8);
    elseif (TheMissingPiece == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TABLET_OF_ANCIENT_MAGIC)) then -- They got their Key items. tell them to goto sandy
        player:startEvent(9);
    else
        player:startEvent(52); -- standard dialogue
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 6) then
        player:addQuest(OUTLANDS,THE_MISSING_PIECE);
    elseif (csid == 8) then -- give the player the key items he needs to complete the quest
        player:addKeyItem(dsp.ki.TABLET_OF_ANCIENT_MAGIC);
        player:addKeyItem(dsp.ki.LETTER_FROM_ALFESAR);
        player:delKeyItem(dsp.ki.ANCIENT_TABLET_FRAGMENT);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.TABLET_OF_ANCIENT_MAGIC);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LETTER_FROM_ALFESAR);
    end;
end;

