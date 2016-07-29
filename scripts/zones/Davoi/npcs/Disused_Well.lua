-----------------------------------
-- Area: Davoi
-- NPC:  Disused Well
-- Involved in Quest: A Knight's Test
-- @pos -221 2 -293 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:hasKeyItem(KNIGHTS_SOUL) == false and player:hasKeyItem(BOOK_OF_TASKS) and player:hasKeyItem(BOOK_OF_THE_WEST) and player:hasKeyItem(BOOK_OF_THE_EAST)) then
        player:addKeyItem(KNIGHTS_SOUL);
        player:messageSpecial(KEYITEM_OBTAINED, KNIGHTS_SOUL);
    else
        player:messageSpecial(A_WELL);
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