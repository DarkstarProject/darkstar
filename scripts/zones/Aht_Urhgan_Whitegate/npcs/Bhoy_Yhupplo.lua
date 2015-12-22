-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Bhoy Yhupplo
--  Type: Assault Mission Giver
--  @pos 127.474 0.161 -30.418 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/besieged");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local rank = getMercenaryRank(player);
    local haveimperialIDtag;
    local assaultPoints = player:getAssaultPoint(ILRUSI_ASSAULT_POINT);
    
    if (player:hasKeyItem(IMPERIAL_ARMY_ID_TAG)) then
        haveimperialIDtag = 1;
    else
        haveimperialIDtag = 0;
    end
    
--[[    if (rank > 0) then
        player:startEvent(277,rank,haveimperialIDtag,assaultPoints,player:getCurrentAssault());
    else]]
        player:startEvent(283); -- no rank
    --end
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
    if (csid == 277) then
        local selectiontype = bit.band(option, 0xF);
        if (selectiontype == 1) then
            -- taken assault mission
            player:addAssault(bit.rshift(option,4));
            player:delKeyItem(IMPERIAL_ARMY_ID_TAG);
            player:addKeyItem(ILRUSI_ASSAULT_ORDERS);
            player:messageSpecial(KEYITEM_OBTAINED,ILRUSI_ASSAULT_ORDERS);
        elseif (selectiontype == 2) then
            -- purchased an item
            local item = bit.rshift(option,14);
            local itemID = 0;
            local price = 0;
            
            -- Copy/pasted from Famad, TODO: fill in the actual IDs/prices for Bhoy Yhupplo
            --[[if (item == 1) then
                itemID = 15972;
                price = 3000;
            elseif (item == 2) then
                itemID = 15777;
                price = 5000;
            elseif (item == 3) then
                itemID = 15523;
                price = 8000;
            elseif (item == 4) then
                itemID = 15886;
                price = 10000;
            elseif (item == 5) then
                itemID = 15492;
                price = 10000;
            elseif (item == 6) then
                itemID = 18583;
                price = 10000;
            elseif (item == 7) then
                itemID = 18388;
                price = 15000;
            elseif (item == 8) then
                itemID = 18417;
                price = 15000;
            elseif (item == 9) then
                itemID = 14940;
                price = 15000;
            elseif (item == 10) then
                itemID = 15690;
                price = 20000;
            elseif (item == 11) then
                itemID = 14525;
                price = 20000;
            else
                return;
            end
            
            player:addItem(itemID);
            player:messageSpecial(ITEM_OBTAINED,itemID);
            player:delAssaultPoint(LEBROS_ASSAULT_POINT,price);]]
        end
    end
end;
