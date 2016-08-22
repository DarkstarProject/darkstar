-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Taulenne
-- Armor Storage NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/armorstorage"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/armorstorage");
require("scripts/globals/settings");
require("scripts/globals/quests");

local Deposit = 0x0304;
local Withdrawl = 0x0305;
local ArraySize = table.getn(StorageArray);
local G1 = 0;
local G2 = 0;
local G3 = 0;
local G4 = 0;
local G5 = 0;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end

    for SetId = 1,ArraySize,11 do
        local TradeCount = trade:getItemCount();
        local T1 = trade:hasItemQty(StorageArray[SetId + 5],1);
        if (T1 == true) then
            if (player:hasKeyItem(StorageArray[SetId + 10]) == false) then
                if (TradeCount == StorageArray[SetId + 3]) then
                    local T2 = trade:hasItemQty(StorageArray[SetId + 4],1);
                    local T3 = trade:hasItemQty(StorageArray[SetId + 6],1);
                    local T4 = trade:hasItemQty(StorageArray[SetId + 7],1);
                    local T5 = trade:hasItemQty(StorageArray[SetId + 8],1);
                    if (StorageArray[SetId + 4] == 0) then
                        T2 = true;
                    end
                    if (StorageArray[SetId + 6] == 0) then
                        T3 = true;
                    end
                    if (StorageArray[SetId + 7] == 0) then
                        T4 = true;
                    end
                    if (StorageArray[SetId + 8] == 0) then
                        T5 = true;
                    end
                    if (T2 == true and T3 == true and T4 == true and T5 == true) then
                        player:startEvent(Deposit,0,0,0,0,0,StorageArray[SetId + 9]);
                        player:addKeyItem(StorageArray[SetId + 10]);
                        player:messageSpecial(KEYITEM_OBTAINED,StorageArray[SetId + 10]);
                        break;
                    end
                end
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    local CurrGil = player:getGil();
    for KeyItem = 11,ArraySize,11 do
        if player:hasKeyItem(StorageArray[KeyItem]) then
            if StorageArray[KeyItem - 9] == 1 then
                G1 = G1 + StorageArray[KeyItem - 8];
            elseif StorageArray[KeyItem - 9] == 2 then
                G2 = G2 + StorageArray[KeyItem - 8];
            elseif StorageArray[KeyItem - 9] == 3 then
                G3 = G3 + StorageArray[KeyItem - 8];
            elseif StorageArray[KeyItem - 9] == 4 then
                G4 = G4 + StorageArray[KeyItem - 8];
            elseif StorageArray[KeyItem - 9] == 6 then
                G5 = G5 + StorageArray[KeyItem - 8];
            end
        end
    end

    player:startEvent(Withdrawl,G1,G2,G3,G4,CurrGil,G5);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------
function onEventUpdate(player,csid,option)
    if (csid == Withdrawl) then
        player:updateEvent(
            StorageArray[option * 11 - 6],
            StorageArray[option * 11 - 5],
            StorageArray[option * 11 - 4],
            StorageArray[option * 11 - 3],
            StorageArray[option * 11 - 2],
            StorageArray[option * 11 - 1]);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player,csid,option)
    if (csid == Withdrawl) then
        if (option > 0 and option <= StorageArray[ArraySize] - 10) then
            if (player:getFreeSlotsCount() >= StorageArray[option * 11 - 7]) then
                for Item = 2,6,1 do
                    if (StorageArray[option * 11 - Item] > 0) then
                        player:addItem(StorageArray[option * 11 - Item],1);
                        player:messageSpecial(ITEM_OBTAINED,StorageArray[option * 11 - Item]);
                    end
                end
                player:delKeyItem(StorageArray[option * 11]);
                player:setGil(player:getGil() - StorageArray[option * 11 - 1]);
            else
                for Item = 2,6,1 do
                    if (StorageArray[option * 11 - Item] > 0) then
                        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,StorageArray[option * 11 - Item]);
                    end
                end
            end
        end        
    end

    if (csid == Deposit) then
        player:tradeComplete();
    end
end;
