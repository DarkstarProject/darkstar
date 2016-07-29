-----------------------------------
-- Area: Upper Jeuno
-- NPC: Turlough
-- Mission NPC
-- @pos 
-----------------------------------

package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(WOTG) == THE_QUEEN_OF_THE_DANCE and player:getVar("QueenOfTheDance") == 1) then
        player:startEvent(0x27BC);
    else
        player:startEvent(0x27AE); --default dialogue
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x27BC) then
        player:setVar("QueenOfTheDance",2);
        player:addKeyItem(MAYAKOV_SHOW_TICKET);
        player:messageSpecial(KEYITEM_OBTAINED,MAYAKOV_SHOW_TICKET);
    end
end;

