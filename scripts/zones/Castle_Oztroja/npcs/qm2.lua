-----------------------------------
-- Area: Castle Oztroja
-- NPC:  qm2 (???)
-- Used In Quest: Whence Blows the Wind 
-- @pos -100 -63 58 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(JEUNO,WHENCE_BLOWS_THE_WIND) == QUEST_ACCEPTED and player:hasKeyItem(YAGUDO_CREST) == false) then
        player:addKeyItem(YAGUDO_CREST);
        player:messageSpecial(KEYITEM_OBTAINED, YAGUDO_CREST);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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