-----------------------------------
-- Area: Qulun Dome
-- NPC:  qm1 (???)
-- Used In Quest: Whence Blows the Wind 
-- @pos 261 39 79 148
-----------------------------------
package.loaded["scripts/zones/Qulun_Dome/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(QUADAV_CREST) == false) then
        player:addKeyItem(QUADAV_CREST);
        player:messageSpecial(KEYITEM_OBTAINED, QUADAV_CREST);
    else
        player:messageSpecial(YOU_FIND_NOTHING);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;