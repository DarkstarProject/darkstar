-----------------------------------
-- Area: Port Jeuno
-- NPC:  Zona Shodhun
-- Starts and Finishes Quest: Pretty Little Things
-- @zone 246
-- @pos -175 -5 -4
-----------------------------------
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
gil = trade:getGil();

itemQuality = 0;
    if (trade:getItemCount() == 1 and trade:getGil() == 0) then
        if (trade:hasItemQty(771,1)) then        -- Yellow Rock
            itemQuality = 2;
        elseif (trade:hasItemQty(769,1)  or        -- Red Rock
                trade:hasItemQty(770,1)  or        -- Blue Rock
                trade:hasItemQty(772,1)  or        -- Green Rock
                trade:hasItemQty(773,1)  or        -- Translucent Rock
                trade:hasItemQty(774,1)  or        -- Purple Rock
                trade:hasItemQty(775,1)  or        -- Black Rock
                trade:hasItemQty(776,1)  or        -- White Rock
                trade:hasItemQty(957,1)  or        -- Amaryllis
                trade:hasItemQty(2554,1) or        -- Asphodel
                trade:hasItemQty(948,1)  or        -- Carnation
                trade:hasItemQty(1120,1) or        -- Casablanca
                trade:hasItemQty(1413,1) or        -- Cattleya
                trade:hasItemQty(636,1)  or        -- Chamomile
                trade:hasItemQty(959,1)  or        -- Dahlia
                trade:hasItemQty(835,1)  or        -- Flax Flower
                trade:hasItemQty(956,1)  or        -- Lilac
                trade:hasItemQty(2507,1) or        -- Lycopodium Flower
                trade:hasItemQty(958,1)  or        -- Marguerite
                trade:hasItemQty(1412,1) or        -- Olive Flower
                trade:hasItemQty(938,1)  or        -- Papaka Grass
                trade:hasItemQty(1411,1) or        -- Phalaenopsis
                trade:hasItemQty(949,1)  or        -- Rain Lily
                trade:hasItemQty(941,1)  or        -- Red Rose
                trade:hasItemQty(1725,1) or        -- Snow Lily
                trade:hasItemQty(1410,1) or        -- Sweet William
                trade:hasItemQty(950,1)  or        -- Tahrongi Cactus
                trade:hasItemQty(2960,1) or        -- Water Lily
                trade:hasItemQty(951,1)) then    -- Wijnruit
            itemQuality = 1;
        end
    end

    PrettyLittleThings = player:getQuestStatus(JEUNO,PRETTY_LITTLE_THINGS);

    if (itemQuality == 2) then
        if (PrettyLittleThings == QUEST_COMPLETED) then
            player:startEvent(0x2727, 0, 246, 4);
        else 
            player:startEvent(0x2727, 0, 246, 2);
        end
    elseif (itemQuality == 1) then
        if (PrettyLittleThings == QUEST_COMPLETED) then
            player:startEvent(0x2727, 0, 246, 5);
        elseif (PrettyLittleThings == QUEST_ACCEPTED) then
            player:startEvent(0x2727, 0, 246, 3);
        else 
            player:startEvent(0x2727, 0, 246, 1);
        end
    else 
        player:startEvent(0x2727, 0, 246, 0);
    end

end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x2727, 0, 246, 10);
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

    if (csid == 0x2727 and option == 4002) then
        player:moghouseFlag(8);
        player:messageSpecial(MOGHOUSE_EXIT);
        player:addFame(JEUNO, JEUNO_FAME*30);
        player:tradeComplete();
        player:completeQuest(JEUNO,PRETTY_LITTLE_THINGS);
    elseif (csid == 0x2727 and option == 1) then
        player:tradeComplete();
        player:addQuest(JEUNO,PRETTY_LITTLE_THINGS);
    end
end;