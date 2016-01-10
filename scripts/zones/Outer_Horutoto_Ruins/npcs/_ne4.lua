-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Strange Apparatus
-- @pos: -574 0 739 194
-----------------------------------

package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil;

require("scripts/zones/Outer_Horutoto_Ruins/TextIDs");
require("scripts/globals/strangeapparatus");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local trade = tradeToStrApp(player, trade);
    if (trade ~= nil) then

        if ( trade == 1) then -- good trade
        
            local drop    = player:getLocalVar("strAppDrop");
            local dropQty = player:getLocalVar("strAppDropQty");

            local docStatus = 0; -- Assistant
            if (hasStrAppDocStatus(player)) then
                docStatus = 1; -- Doctor
            end

            player:startEvent(0x0042, drop, dropQty, INFINITY_CORE, 0, 0, 0, docStatus, 0);
        else -- wrong chip, spawn elemental nm

            spawnElementalNM(player);
            delStrAppDocStatus(player);
            player:messageSpecial(text.SYS_OVERLOAD);
            player:messageSpecial(text.YOU_LOST_THE, trade);
        end
    else -- Invalid trade, lose doctor status
        delStrAppDocStatus(player);
        player:messageSpecial(text.DEVICE_NOT_WORKING);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local docStatus = 0; -- Assistant
    if (hasStrAppDocStatus(player)) then
        docStatus = 1; -- Doctor
    else
        player:setLocalVar( "strAppPass", 1);
    end

    player:startEvent(0x0040, docStatus, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID());
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u", option);

    if (csid == 0x0040) then

        if (hasStrAppDocStatus(player) == false) then

            local docStatus = 1; -- Assistant
            if ( option == strAppPass(player)) then -- Good password
                docStatus = 0; -- Doctor
                giveStrAppDocStatus(player);
            end
            
            player:updateEvent(docStatus, 0, INFINITY_CORE, 0, 0, 0, 0, 0);
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0042) then

        local drop    = player:getLocalVar("strAppDrop");
        local dropQty = player:getLocalVar("strAppDropQty");

        if (drop ~= 0) then

            if ( dropQty == 0) then
                dropQty = 1;
            end

            player:addItem(drop, dropQty);

            player:setLocalVar("strAppDrop", 0);
            player:setLocalVar("strAppDropQty", 0);
        end
    end
end;