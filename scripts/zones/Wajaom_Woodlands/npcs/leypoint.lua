-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Leypoint
-- Teleport point, Quest -- NAVIGATING THE UNFRIENDLY SEAS RELATED --
-- @pos -200.027 -8.500 80.058 51
-----------------------------------

require("scripts/zones/Wajaom_Woodlands/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(AHT_URHGAN,OLDUUM) == QUEST_COMPLETED and player:hasItem(15769) == false) then
        if (trade:hasItemQty(2217,1) and trade:getItemCount() == 1) then -- Trade Lightning Band
            player:tradeComplete(); -- Trade Complete
            player:addItem(15769); -- Receive Olduum Ring
            player:messageSpecial(ITEM_OBTAINED,15769); -- Message for Receiving Ring
        end
    end

    if (player:getQuestStatus(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS) == QUEST_ACCEPTED and player:getVar("NavigatingtheUnfriendlySeas") == 2) then
        if (trade:hasItemQty(2341,1) and trade:getItemCount() == 1) then -- Trade Hydrogauge
            player:messageSpecial(PLACE_HYDROGAUGE,2341); -- You set the <item> in the trench.
            player:tradeComplete(); --Trade Complete
            player:setVar("NavigatingtheUnfriendlySeas",3)
            player:setVar("Leypoint_waitJTime",getMidnight()); -- Time Set for 1 day real life time.
            printf("Midnight: %u",getMidnight());
            printf("Os: %u",os.time());
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS) == QUEST_ACCEPTED and player:getVar("NavigatingtheUnfriendlySeas") == 3) then
        if (player:getVar("Leypoint_waitJTime") <= os.time()) then
            player:startEvent(0x01FC);
            player:setVar("NavigatingtheUnfriendlySeas",4);   -- play cs for having waited enough time
        else
            player:messageSpecial(ENIGMATIC_LIGHT,2341);    -- play cs for not waiting long enough
        end
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
end;