-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Kuu Mohzolhi
-- Starts and Finishes Quest: Growing Flowers
-- @zone 231
-- @pos -123 0 80
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
gil = trade:getGil();

itemQuality = 0;
    if (trade:getItemCount() == 1 and trade:getGil() == 0) then
        if (trade:hasItemQty(958,1)) then        -- Marguerite
            itemQuality = 2;
        elseif (trade:hasItemQty(957,1)  or        -- Amaryllis
                trade:hasItemQty(2554,1) or        -- Asphodel
                trade:hasItemQty(948,1)  or        -- Carnation
                trade:hasItemQty(1120,1) or        -- Casablanca
                trade:hasItemQty(1413,1) or        -- Cattleya
                trade:hasItemQty(636,1)  or        -- Chamomile
                trade:hasItemQty(959,1)  or        -- Dahlia
                trade:hasItemQty(835,1)  or        -- Flax Flower
                trade:hasItemQty(956,1)  or        -- Lilac
                trade:hasItemQty(2507,1) or        -- Lycopodium Flower
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

    GrowingFlowers = player:getQuestStatus(SANDORIA,GROWING_FLOWERS);

    if (itemQuality == 2) then
        if (GrowingFlowers == QUEST_COMPLETED) then
            player:startEvent(0x025d, 0, 231, 4);
        else 
            player:startEvent(0x025d, 0, 231, 2);
        end
    elseif (itemQuality == 1) then
        if (GrowingFlowers == QUEST_ACCEPTED) then
            player:startEvent(0x025d, 0, 231, 3);
        else 
            player:startEvent(0x025d, 0, 231, 1);
        end
    else 
        player:startEvent(0x025d, 0, 231, 0);
    end

end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x025d, 0, 231, 10);
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

    if (csid == 0x025d and option == 1002) then
        player:tradeComplete();
        player:completeQuest(SANDORIA,GROWING_FLOWERS);
        player:addFame(SANDORIA,120);
        player:moghouseFlag(1);
        player:messageSpecial(MOGHOUSE_EXIT);
    elseif (csid == 0x025d and option == 1) then
        player:tradeComplete();
        player:addQuest(SANDORIA,GROWING_FLOWERS);
    end
end;