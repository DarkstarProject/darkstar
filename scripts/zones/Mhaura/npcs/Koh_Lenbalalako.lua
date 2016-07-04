-----------------------------------
--  Area: Mhaura
--  NPC:  Koh Lenbalalako
--  Type: Standard NPC
--  @pos -64.412 -17 29.213 249
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Mhaura/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(13315,1) and trade:getItemCount() == 1) then -- Trade gold earring (during Rng AF3 quest)    
        local UnbridledPassionCS = player:getVar("unbridledPassion");
        if (UnbridledPassionCS == 2) then
            player:startEvent(0x271b);
        end
    end    

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local FireAndBrimstoneCS = player:getVar("fireAndBrimstone");        
    local UnbridledPassionCS = player:getVar("unbridledPassion");    
    
    -- during RNG af2
    if (FireAndBrimstoneCS == 1) then 
        player:startEvent(0x2717); 
        
    -- during RNG af3
    elseif (UnbridledPassionCS == 1) then 
        player:startEvent(0x2719, 0, 13360, 13315); 
    elseif (UnbridledPassionCS == 2) then 
        player:startEvent(0x271a, 0, 0, 13315);     
    elseif (UnbridledPassionCS == 3) then 
        player:startEvent(0x271c); 
        
    else
        player:startEvent(0x271d);
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
    if (csid == 0x2717) then
        player:startEvent(0x2730);
        player:setVar("fireAndBrimstone",2);
    elseif (csid == 0x2719) then
        player:setVar("unbridledPassion",2);
    elseif (csid == 0x271b) then
        player:addKeyItem(KOHS_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,KOHS_LETTER);            
        player:tradeComplete();    
        player:setVar("unbridledPassion",3);    
    end
end;

