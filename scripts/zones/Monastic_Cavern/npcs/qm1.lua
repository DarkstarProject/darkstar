-----------------------------------
-- Area: Monastic Cavern
--  NPC: ???
-- Used In Quest: Whence Blows the Wind
-- !pos 168 -1 -22 150
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Monastic_Cavern/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.ORCISH_CREST) == false) then
        player:addKeyItem(dsp.ki.ORCISH_CREST);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.ORCISH_CREST);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;