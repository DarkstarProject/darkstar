-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Ugrihd
-- Coin Exchange Vendor
-- @pos -63.079 -6 -28.571 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/besieged");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local badges = { 0, 780, 783, 784, 794, 795, 825, 826, 827, 894, 900, 909 };
    local rank = 1;

	while player:hasKeyItem(badges[rank + 1]) == true do
		rank = rank + 1;
	end;

    player:startEvent(0x0096,rank-1,badges[rank],player:getCurrency("imperial_standing"),0,39183,10577,4095,0,0); -- Unsure of what other params mean
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

function onEventFinish(player,csid,option,npc)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

    local Quantity = bit.rshift(option, 8);
    local CoinType = bit.band(option, 255);
    local Stacks = Quantity / 99;
    local Remainder = Quantity % 99;
    -- printf("Quantity - %u CoinType - %u\n",Quantity, CoinType);
    -- printf("Stacks - %u Remainder - %u\n",Stacks, Remainder);

    if (csid ==0x0096) then
        if (CoinType == 1) then -- Bronze Pieces
            if (Quantity == 1) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2184);
                else
                    player:delCurrency("imperial_standing", 20*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINED,2184);
                    player:addItem(2184);
                end
            elseif (Quantity <= 99) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2184);
                else
                    player:delCurrency("imperial_standing", 20*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2184,Quantity);
                    player:addItem(2184,Quantity);
                end
            elseif (Quantity > 99 and Remainder == 0) then
                if (player:getFreeSlotsCount() <= Stacks) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2184);
                else
                    player:delCurrency("imperial_standing", 20*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2184,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2184,99);
                    end
                end
            elseif (Quantity > 99 and Remainder ~= 0) then
                if (player:getFreeSlotsCount() <= Stacks+1) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2184);
                else
                    player:delCurrency("imperial_standing", 20*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2184,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2184,99);
                    end
                    player:addItem(2184,Remainder);
                end
            end
        elseif (CoinType == 2) then -- Silver Pieces
            if (Quantity == 1) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
                else
                    player:delCurrency("imperial_standing", 100*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINED,2185);
                    player:addItem(2185);
                end
            elseif (Quantity <= 99) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
                else
                    player:delCurrency("imperial_standing", 100*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2185,Quantity);
                    player:addItem(2185,Quantity);
                end
            elseif (Quantity > 99 and Remainder == 0) then
                if (player:getFreeSlotsCount() <= Stacks) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
                else
                    player:delCurrency("imperial_standing", 100*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2185,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2185,99);
                    end
                end
            elseif (Quantity > 99 and Remainder ~= 0) then
                if (player:getFreeSlotsCount() <= Stacks+1) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
                else
                    player:delCurrency("imperial_standing", 100*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2185,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2185,99);
                    end
                    player:addItem(2185,Remainder);
                end
            end
        elseif (CoinType == 3) then -- Mythril Pieces
            if (Quantity == 1) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2186);
                else
                    player:delCurrency("imperial_standing", 200*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINED,2186);
                    player:addItem(2186);
                end
            elseif (Quantity <= 99) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2186);
                else
                    player:delCurrency("imperial_standing", 200*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2186,Quantity);
                    player:addItem(2186,Quantity);
                end
            elseif (Quantity > 99 and Remainder == 0) then
                if (player:getFreeSlotsCount() <= Stacks) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2186);
                else
                    player:delCurrency("imperial_standing", 200*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2186,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2186,99);
                    end
                end
            elseif (Quantity > 99 and Remainder ~= 0) then
                if (player:getFreeSlotsCount() <= Stacks+1) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2186);
                else
                    player:delCurrency("imperial_standing", 200*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2186,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2186,99);
                    end
                    player:addItem(2186,Remainder);
                end
            end
        elseif (CoinType == 4) then -- Gold Pieces
            if (Quantity == 1) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2187);
                else
                    player:delCurrency("imperial_standing", 1000*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINED,2187);
                    player:addItem(2187);
                end
            elseif (Quantity <= 99) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2187);
                else
                    player:delCurrency("imperial_standing", 1000*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2187,Quantity);
                    player:addItem(2187,Quantity);
                end
            elseif (Quantity > 99 and Remainder == 0) then
                if (player:getFreeSlotsCount() <= Stacks) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2187);
                else
                    player:delCurrency("imperial_standing", 1000*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2187,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2187,99);
                    end
                end
            elseif (Quantity > 99 and Remainder ~= 0) then
                if (player:getFreeSlotsCount() <= Stacks+1) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2187);
                else
                    player:delCurrency("imperial_standing", 1000*Quantity);
                    npc:showText(npc, UGRIHD_PURCHASE_DIALOGUE);
                    player:messageSpecial(ITEM_OBTAINEDX,2187,Quantity);
                    for i = 1, Stacks do
                        player:addItem(2187,99);
                    end
                    player:addItem(2187,Remainder);
                end
            end
        end
    end

end;