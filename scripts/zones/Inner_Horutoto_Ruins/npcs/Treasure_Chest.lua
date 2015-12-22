-----------------------------------
-- Area: Horutoto Ruins
-- NPC:  Treasure Chest
-- @zone 192
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/treasure");
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

local TreasureType = "Chest";
local TreasureLvL = 43;
local TreasureMinLvL = 33;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    --trade:hasItemQty(1029,1);         -- Treasure Key
    --trade:hasItemQty(1115,1);            -- Skeleton Key
    --trade:hasItemQty(1023,1);            -- Living Key
    --trade:hasItemQty(1022,1);            -- Thief's Tools
    local questItemNeeded = 0;
    
    -- Player traded a key.
    if ((trade:hasItemQty(1029,1) or trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1) then 
        local zone = player:getZoneID();
        local pack = openChance(player,npc,trade,TreasureType,TreasureLvL,TreasureMinLvL,questItemNeeded);
        local success = 0;
        if (pack[2] ~= nil) then
            player:messageSpecial(pack[2]);
            success = pack[1];
        else
            success = pack[1];
        end

        if (success ~= -2) then
            player:tradeComplete();

            if (math.random() <= success) then
                -- Succeded to open the coffer
                player:messageSpecial(CHEST_UNLOCKED);
                player:setVar("["..zone.."]".."Treasure_"..TreasureType,os.time() + math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME)); 
                    
                local loot = chestLoot(zone,npc);
                    -- print("loot array: "); -- debug
                    -- print("[1]", loot[1]); -- debug
                    -- print("[2]", loot[2]); -- debug

                if (loot[1]=="gil") then
                    player:addGil(loot[2]*GIL_RATE);
                    player:messageSpecial(GIL_OBTAINED,loot[2]*GIL_RATE);
                else
                    -- Item
                    player:addItem(loot[2]);
                    player:messageSpecial(ITEM_OBTAINED,loot[2]);
                end

                UpdateTreasureSpawnPoint(npc:getID());
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(CHEST_LOCKED,1029);
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