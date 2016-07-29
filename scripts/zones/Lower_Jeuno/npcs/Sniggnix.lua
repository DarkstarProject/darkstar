-----------------------------------
--  Area: Lower Jeuno
--   NPC: Sniggnix
--  Type: Standard NPC
-- @zone: 245
--  @pos -45.832 4.498 -135.029
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");
    
    if (trade:hasItemQty(1092,1) and trade:getItemCount() == 1 and thickAsThievesGamblingCS == 7) then -- Trade Regal die
        rand1 = math.random(1,700);
        player:startEvent(0x272a,0,1092,rand1);     -- complete gambling side quest for as thick as thieves
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");

    if (thickAsThievesGamblingCS == 1) then
        rand1 = math.random(1,999);
        rand2 = math.random(1,999);
        player:startEvent(0x2728,0,1092,rand1,rand2);        
    elseif (thickAsThievesGamblingCS >= 2 and thickAsThievesGamblingCS <= 6) then
        player:startEvent(0x2729,0,1092,rand1,rand2);    
        
    else
        player:startEvent(0x2727);
    end
    
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
    
    if (csid == 0x2728 and option == 1) then                -- player won first dice game
        player:setVar("thickAsThievesGamblingCS",2);
    elseif (csid == 0x272a) then
        player:tradeComplete();
        player:setVar("thickAsThievesGamblingCS",8);
        player:delKeyItem(SECOND_FORGED_ENVELOPE);
        player:addKeyItem(SECOND_SIGNED_FORGED_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,SECOND_SIGNED_FORGED_ENVELOPE);
    end    
    
    
end;

