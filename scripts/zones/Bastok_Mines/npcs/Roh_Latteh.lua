-----------------------------------
-- Area: Bastok Markets
-- NPC: Roh Latteh
-- Involved in Quest: Mom, The Adventurer?
-- Finishes Quest: The Signpost Marks the Spot
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    MomTheAdventurer = player:getQuestStatus(BASTOK,MOM_THE_ADVENTURER);
    questStatus = player:getVar("MomTheAdventurer_Event");

    if (MomTheAdventurer >=1 and questStatus == 1) then
        count = trade:getItemCount();
        gil = trade:getGil();
        CopperRing = trade:hasItemQty(COPPER_RING,1);

        if (CopperRing and count == 1 and gil == 0) then
            player:startEvent(0x005f);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    SignPost = player:getQuestStatus(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);
	Painting = player:hasKeyItem(PAINTING_OF_A_WINDMILL);
	
    if (SignPost == 1 and Painting == true) then
        player:startEvent(0x0060);
    else
        player:startEvent(0x001d);
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

    if (csid == 0x005f) then
        player:addKeyItem(LETTER_FROM_ROH_LATTEH);
        player:messageSpecial(KEYITEM_OBTAINED, LETTER_FROM_ROH_LATTEH);
        player:setVar("MomTheAdventurer_Event",2);
      	player:tradeComplete();
    elseif (csid == 0x0060) then
        freeInventory = player:getFreeSlotsCount();

        if (freeInventory > 0) then
            player:completeQuest(BASTOK,THE_SIGNPOST_MARKS_THE_SPOT);
            player:delKeyItem(PAINTING_OF_A_WINDMILL);
            player:setTitle(TREASURE_SCAVENGER);
            player:addFame(BASTOK,BAS_FAME*50);
            player:addItem(LINEN_ROBE);
            player:messageSpecial(ITEM_OBTAINED,LINEN_ROBE);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, LINEN_ROBE);
        end
    end
end;



