-----------------------------------
-- Area: Monastic Cavern
--  NPC: ???
-- Used In Quest: Whence Blows the Wind
-- !pos 168 -1 -22 150
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Monastic_Cavern/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.ORCISH_CREST) == false) then
        player:addKeyItem(dsp.ki.ORCISH_CREST);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.ORCISH_CREST);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;