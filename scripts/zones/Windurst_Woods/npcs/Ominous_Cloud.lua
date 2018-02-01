-----------------------------------
-- Area: Windurst Woods
--  NPC: Ominous Cloud
-- Type: Ninjutsu Toolbag Maker
-- !pos -20.632 -3.939 -40.554 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");

function onTrade(player,npc,trade)
    local toolList =
    {
        {1161, 5308}, -- uchitake
        {1164, 5309}, -- tsurara
        {1167, 5310}, -- kawahori-ogi
        {1170, 5311}, -- makibishi
        {1173, 5312}, -- hiraishin
        {1176, 5313}, -- mizu-deppo
        {1179, 5314}, -- shihei
        {1182, 5315}, -- jusatsu
        {1185, 5316}, -- kaginawa
        {1188, 5317}, -- sairui-ran
        {1191, 5318}, -- kodoku
        {1194, 5319}, -- shinobi-tabi
        {2553, 5417}, -- sanjaku-tenugui
        {2555, 5734}, -- soshi
        {2642, 5863}, -- kabenro
        {2643, 5864}, -- jinko
        {2970, 5866}, -- mokujin
        {2971, 5867}, -- inoshishinofuda
        {2972, 5868}, -- shikanofuda
        {2973, 5869}, -- chonofuda
    }

    local fruitNeeded = 0;
    local giveToPlayer = {};

    -- check for invalid items
    for i = 0,8,1 do
        local itemId = trade:getItemId(i);
        if (itemId > 0 and itemId ~= 951) then
            local validSlot = false;
            for k, v in pairs(toolList) do
                if (v[1] == itemId) then
                    local itemQty = trade:getSlotQty(i);
                    if (itemQty % 99 ~= 0) then
                        player:messageSpecial(CLOUD_BAD_COUNT, 951);
                        return;
                    end;
                    local stacks = itemQty / 99;
                    fruitNeeded = fruitNeeded + stacks;
                    giveToPlayer[#giveToPlayer+1] = {v[2], stacks};
                    validSlot = true;
                    break;
                end
            end
            if (not validSlot) then
                player:messageSpecial(CLOUD_BAD_ITEM);
                return;
            end
        end
    end

    -- check for correct number of wijnfruit
    if (fruitNeeded == 0 or trade:getItemQty(951) ~= fruitNeeded) then
        player:messageSpecial(CLOUD_BAD_COUNT, 951);
        return;
    end

    -- check for enough inventory space
    if (player:getFreeSlotsCount() < fruitNeeded) then
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, giveToPlayer[1][1]);
        return;
    end

    -- make the trade
    player:messageSpecial(CLOUD_GOOD_TRADE);
    for k, v in pairs(giveToPlayer) do
        player:addItem(v[1], v[2]);
        player:messageSpecial(ITEM_OBTAINED,v[1]);
    end
    player:tradeComplete();
end;

function onTrigger(player,npc)
    player:startEvent(698,npc:getID());
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
