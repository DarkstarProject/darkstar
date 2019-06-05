-----------------------------------
-- Area: Horlais Peak
--  NPC: Hot Springs
-- !pos 444 -37 -18 139
-----------------------------------
local ID = require("scripts/zones/Horlais_Peak/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.SECRET_OF_THE_DAMP_SCROLL) == QUEST_ACCEPTED and trade:hasItemQty(1210,1) and trade:getItemCount() == 1) then
        player:startEvent(2,1210);
    end
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_GENERAL_S_SECRET) == QUEST_ACCEPTED) and (player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY) == true) then
        player:addKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CURILLAS_BOTTLE_FULL);
        player:delKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 2) then
        player:tradeComplete();
        player:addItem(4949); -- Scroll of Jubaku: Ichi
        player:messageSpecial(ID.text.ITEM_OBTAINED, 4949);
        player:addFame(NORG,75);
        player:addTitle(dsp.title.CRACKER_OF_THE_SECRET_CODE);
        player:completeQuest(OUTLANDS,dsp.quest.id.outlands.SECRET_OF_THE_DAMP_SCROLL);
    end
end;