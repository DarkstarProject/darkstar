-----------------------------------
--  NPC: ??? (QM5)
--     Type: Eggblix dice roll game part 3
--     @zone 191
--     Involved in quest "As Thick As Thieves"
-----------------------------------
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Dangruf_Wadi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local thickAsThievesGamblingCS = player:getVar("thickAsThievesGamblingCS");

    if (thickAsThievesGamblingCS == 4) then
        if (trade:hasItemQty(4362,1) and trade:getItemCount() == 1) then -- Trade 1x lizard egg
            local rand1 = math.random(1,999);
            local rand2 = math.random(1,999);

            if (rand1 > rand2) then
                player:startEvent(138,1092,0,rand1,rand2); -- complete 2/3 gamble mini quest
            else
                player:startEvent(141,0,0,rand1,rand2); -- player looses
            end
        end
    end

end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
     -- printf("CSID: %u",csid);
     -- printf("RESULT: %u",option);

    if (csid == 141 and option == 1) then -- player looses dice game
        player:tradeComplete();
        player:setVar("thickAsThievesGamblingCS",2);
    elseif (csid == 138 and option == 0) then -- player wins dice game
        player:tradeComplete();
        player:setVar("thickAsThievesGamblingCS",5);
    end

end;

