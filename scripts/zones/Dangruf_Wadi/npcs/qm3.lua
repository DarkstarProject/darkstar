-----------------------------------
--  NPC: ??? (QM3)
--  Type: Saltvix dice roll game part 2
--  @zone: 191
--  Involved in quest "As Thick As Thieves"
-----------------------------------
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Dangruf_Wadi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");

    if (thickAsThievesGamblingCS == 2) then
        if (trade:hasItemQty(936,1) and trade:getItemCount() == 1) then -- Trade 1x rock slat
            local rand1 = math.random(1,999);
            local rand2 = math.random(1,999);    

            if (rand1 > rand2) then
                player:startEvent(0x0088,1092,0,rand1,rand2); -- complete 1/3 gamble mini quest    
            else
                player:startEvent(0x008b,0,0,rand1,rand2); -- player looses    
            end
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
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

    if (csid == 0x008b and option == 1) then -- player looses dice game
        player:tradeComplete();     
        player:setVar("thickAsThievesGamblingCS",2);        
    elseif (csid == 0x0088 and option == 0) then -- player wins dice game
        player:tradeComplete();
        player:setVar("thickAsThievesGamblingCS",3);
    end         
    
end;

