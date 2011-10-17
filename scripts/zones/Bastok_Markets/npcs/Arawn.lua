-----------------------------------
-- Area: Bastok Markets
-- NPC: Arawn
-- Starts & Finishes Quest: Stamp Hunt
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);
	    
	if (StampHunt == 0) then
		player:startEvent(0x00e1);
	elseif (StampHunt == 1 and player:getVar("StampHunt_Event") == 0x7F) then
		player:startEvent(0x00e2);
    else
        player:startEvent(0x0072);
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

    if (csid == 0x00e1 and option == 0) then
        player:addQuest(BASTOK,STAMP_HUNT);
        player:addKeyItem(STAMP_SHEET);
        player:messageSpecial(KEYITEM_OBTAINED,STAMP_SHEET);
    elseif (csid == 0x00e2) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:completeQuest(BASTOK,STAMP_HUNT);
            player:addFame(BASTOK,BAS_FAME*50);
            player:setTitle(STAMPEDER);
            player:addItem(13081); --Leather Gorget
            player:messageSpecial(ITEM_OBTAINED, 13081);
            player:delKeyItem(STAMP_SHEET);
            player:setVar("StampHunt_Event",0);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, LEATHER_GORGET);
        end
    end
end;



