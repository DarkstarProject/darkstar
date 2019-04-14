-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Signpost
-- Involved in Quest: The Signpost Marks the Spot
-- !pos -183 65 599 108
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Konschtat_Highlands/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local SignPost = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.THE_SIGNPOST_MARKS_THE_SPOT);
    local Painting = player:hasKeyItem(dsp.ki.PAINTING_OF_A_WINDMILL);

    if (SignPost == 1 and Painting == false) then
        player:messageSpecial(ID.text.SIGNPOST_DIALOG_2);
        player:addKeyItem(dsp.ki.PAINTING_OF_A_WINDMILL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PAINTING_OF_A_WINDMILL);
    else
        player:messageSpecial(ID.text.SIGNPOST_DIALOG_1);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
end;