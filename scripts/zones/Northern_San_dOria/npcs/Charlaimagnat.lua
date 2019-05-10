-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Charlaimagnat
-- Standard Info NPC
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Northern_San_dOria/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    local realday = tonumber(tostring(os.date("%Y")) .. os.date("%m") .. os.date("%d"));
    local TheMissingPiece = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.THE_MISSING_PIECE);

    if (TheMissingPiece == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TABLET_OF_ANCIENT_MAGIC) and player:hasKeyItem(dsp.ki.LETTER_FROM_ALFESAR)) then
        player:startEvent(703); -- Continuing the Quest
    elseif (TheMissingPiece == QUEST_ACCEPTED and realday < player:getVar("TheMissingPiece_date")) then
        player:startEvent(704); -- didn't wait a day yet
    elseif (TheMissingPiece == QUEST_ACCEPTED and realday >= player:getVar("TheMissingPiece_date")) then
        player:startEvent(705); -- Quest Completed
    else
        player:startEvent(702); -- standard dialogue
    end;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 703) then
        player:setVar("TheMissingPiece_date", tostring(os.date("%Y")) .. os.date("%m") .. os.date("%d") + 1);
        player:addTitle(dsp.title.ACQUIRER_OF_ANCIENT_ARCANUM);
        player:delKeyItem(dsp.ki.TABLET_OF_ANCIENT_MAGIC);
        player:delKeyItem(dsp.ki.LETTER_FROM_ALFESAR);
    elseif (csid == 705) then
        if (player:getFreeSlotsCount() == 0) then -- does the player have space
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,4729);
        else -- give player teleport-altep
            player:addItem(4729);
            player:messageSpecial(ID.text.ITEM_OBTAINED,4729);
            player:addFame(RABAO,30);
            player:completeQuest(OUTLANDS,dsp.quest.id.outlands.THE_MISSING_PIECE);
        end;

    end;
end;
