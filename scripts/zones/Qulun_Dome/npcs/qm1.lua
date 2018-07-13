-----------------------------------
-- Area: Qulun Dome
--  NPC: qm1 (???)
-- Used In Quest: Whence Blows the Wind
-- !pos 261 39 79 148
-----------------------------------
package.loaded["scripts/zones/Qulun_Dome/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Qulun_Dome/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.QUADAV_CREST) == false) then
        player:addKeyItem(dsp.ki.QUADAV_CREST);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.QUADAV_CREST);
    else
        player:messageSpecial(YOU_FIND_NOTHING);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;