-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Excavation Point
-- Used in Quest: The Holy Crest
-- !pos 234 0.1 -110 198
-----------------------------------
require("scripts/globals/excavation");
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getVar("TheHolyCrest_Event") == 3 and player:hasItem(1159) == false) then
        if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then
            if (player:getFreeSlotsCount(0) >= 1) then
                player:tradeComplete();
                player:addItem(1159);
                player:messageSpecial(ID.text.ITEM_OBTAINED, 1159); -- Wyvern Egg
            else
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1159); -- Wyvern Egg
            end
        end
    else
        startExcavation(player,player:getZoneID(),npc,trade,60);
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;