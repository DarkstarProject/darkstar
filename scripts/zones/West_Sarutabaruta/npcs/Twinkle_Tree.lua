-----------------------------------
--    Area: West Sarutabaruta
--    NPC:  Twinkle Tree
--    Involved in Quest: To Catch a Falling Star
--  Note: EventID for Twinkle Tree is unknown. Quest funtions but the full event is not played.
--  @pos 156.003 -40.753 333.742 115
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/zones/West_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
starstatus = player:getQuestStatus(WINDURST,TO_CATCH_A_FALLIHG_STAR);
    if (starstatus == 1 and VanadielHour() <= 3) then
        if (trade:getGil() == 0 and trade:hasItemQty(868,1) == true and trade:getItemCount() == 1 and player:getVar("QuestCatchAFallingStar_prog") == 0) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(7336);
                player:messageSpecial(7338);
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,546);
            else
                player:tradeComplete(trade);
                player:messageSpecial(7336);
                player:messageSpecial(7338);
                player:addItem(546,1);
                player:messageSpecial(ITEM_OBTAINED,546); 
                player:setVar("QuestCatchAFallingStar_prog",1);
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (VanadielHour() <= 3 and player:getVar("QuestCatchAFallingStar_prog") == 0) then
        player:messageSpecial(7336);
        player:messageSpecial(7338);
    else
        player:messageSpecial(7339);
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



