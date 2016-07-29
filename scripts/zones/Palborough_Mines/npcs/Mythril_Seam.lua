-----------------------------------
-- Area: Palborough Mines
-- NPC:  Mythril Seam
-- Involved In Mission: Journey Abroad
-- Involved in quest: Rock Racketeer
-- @zone 143
-- @pos -68 -7 173  //  Rock Racketeer @pos 210 -32 -63
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Palborough_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

RRvar = player:getVar("rockracketeer_sold");
    
    --Rock Racketeer
    if (trade:hasItemQty(605,1) and trade:getItemCount() == 1 and RRvar == 5) then
        if (player:getFreeSlotsCount() >= 1) then
            rand = math.random();
            rand = math.random();
            rand = math.random();
            
            if (rand <= 0.47) then -- 47%
                
                
                player:startEvent(0x0033,12,598); -- Sharp Stone (598)
                else
                player:startEvent(0x0034,8,598); -- pickaxe breaks
                player:tradeComplete();
                end
        
            else
                player:startEvent(0x0035); -- cannot carry any more
            end
        
    -- Standard
    elseif (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then -- Trade Pickaxe
        if (player:getFreeSlotsCount() >= 1) then
            rand = math.random();
            rand = math.random();
            rand = math.random();
            
            if (rand <= 0.47) then -- 47%
                
                
                player:startEvent(0x002b,12,0,597); -- chunk of mine gravel (597)
                else
                player:startEvent(0x001f,8,0,597); -- pickaxe breaks
                player:tradeComplete();
                end
            else
                player:startEvent(0x0021); -- cannot carry any more
            end
        -- need a pickaxe
        else
            player:startEvent(0x0020); 
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x001e,12,0,597);
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
    
    if (csid == 0x002b) then
        player:tradeComplete();
        player:addItem(597);
        player:messageSpecial(ITEM_OBTAINED,597); -- Mine Gravel
    end
    
end;