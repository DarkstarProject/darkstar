-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Parvipon
-- Starts and Finishes Quest: The Merchant's Bidding (R)
-- @zone 230
-- @pos -169 -1 13
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(SANDORIA,THE_MERCHANT_S_BIDDING) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(856,3) and trade:getItemCount() == 3) then 
            player:startEvent(0x59);
        end
    end

-- "Flyers for Regine" conditional script
count = trade:getItemCount();
MagicFlyer = trade:hasItemQty(532,1);

    if (MagicFlyer == true and count == 1) then
        FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
        if (FlyerForRegine == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

TheMerchantsBidding = player:getQuestStatus(SANDORIA,THE_MERCHANT_S_BIDDING);

    if (TheMerchantsBidding == QUEST_AVAILABLE) then
        player:startEvent(0x5A);
    else
        player:startEvent(0x58);
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
    
    if (csid == 0x5A and option == 1) then
        player:addQuest(SANDORIA,THE_MERCHANT_S_BIDDING);
    elseif (csid == 0x59) then
        player:tradeComplete();
        player:addGil(GIL_RATE*120);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*120);
        if (player:getQuestStatus(SANDORIA,THE_MERCHANT_S_BIDDING) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_MERCHANT_S_BIDDING);
        else
            player:addFame(SANDORIA,5);
        end
    end
    
end;