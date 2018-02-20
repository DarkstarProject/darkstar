-----------------------------------
-- Area: Crawler Nest
--  NPC: Treasure Coffer
-- @zone 197
-- !pos -94 0 207
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/treasure");
require("scripts/globals/quests");
require("scripts/zones/Crawlers_Nest/TextIDs");

local TreasureType = "Coffer";
local TreasureLvL = 53;
local TreasureMinLvL = 43;

function onTrade(player,npc,trade)

    -- trade:hasItemQty(1045,1);         -- Treasure Key
    -- trade:hasItemQty(1115,1);            -- Skeleton Key
    -- trade:hasItemQty(1023,1);            -- Living Key
    -- trade:hasItemQty(1022,1);            -- Thief's Tools
    local questItemNeeded = 0;

    -- Player traded a key.
    if ((trade:hasItemQty(1045,1) or trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1) then

        -- IMPORTANT ITEM: AF Keyitems, AF Items, & Map -----------
        local mJob = player:getMainJob();
        local zone = player:getZoneID();
        local AFHandsActivated = player:getVar("BorghertzAlreadyActiveWithJob");
        local listAF = getAFbyZone(zone);
        if ((AFHandsActivated == 2 or AFHandsActivated == 9) and player:hasKeyItem(OLD_GAUNTLETS) == false) then
            questItemNeeded = 1;
        else
            for nb = 1,#listAF,3 do
                if (player:getQuestStatus(JEUNO,listAF[nb + 1]) ~= QUEST_AVAILABLE and mJob == listAF[nb] and player:hasItem(listAF[nb + 2]) == false) then
                    questItemNeeded = 2;
                    break
                end
            end
        end
        --------------------------------------

        local pack = openChance(player,npc,trade,TreasureType,TreasureLvL,TreasureMinLvL,questItemNeeded);
        local success = 0;
        if (pack[2] ~= nil) then
            player:messageSpecial(pack[2]);
        end
        success = pack[1];

        if (success ~= -2) then
            player:tradeComplete();
            if (math.random() <= success) then
                -- Succeded to open the coffer
                player:messageSpecial(CHEST_UNLOCKED);

                if (questItemNeeded == 1) then
                    player:addKeyItem(OLD_GAUNTLETS);
                    player:messageSpecial(KEYITEM_OBTAINED,OLD_GAUNTLETS); -- Old Gauntlets (KI)
                elseif (questItemNeeded == 2) then
                    for nb = 1,#listAF,3 do
                        if (mJob == listAF[nb]) then
                            player:addItem(listAF[nb + 2]);
                            player:messageSpecial(ITEM_OBTAINED,listAF[nb + 2]);
                            break
                        end
                    end
                else
                    player:setVar("["..zone.."]".."Treasure_"..TreasureType,os.time() + math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME));

                    local loot = cofferLoot(zone,npc);
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
                end
                UpdateTreasureSpawnPoint(npc:getID());
            else
                player:messageSpecial(CHEST_MIMIC);
                spawnMimic(zone,npc,player);
                UpdateTreasureSpawnPoint(npc:getID(), true);
            end
        end
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(CHEST_LOCKED,1045);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;