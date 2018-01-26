-----------------------------------
-- Area: Lower Jeuno
--   NPC: Yatniel
-- Type: Standard NPC
-- @zone 245
-- !pos -66.817 -7 -126.594
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)

    hittingTheMarquisateYatnielCS = player:getVar("hittingTheMarquisateYatnielCS");

    if (trade:hasItemQty(17314,4) and trade:getItemCount() == 4) then -- Trade quake grenades X4
        player:startEvent(10031);
    end

end;

function onTrigger(player,npc)

    hittingTheMarquisateYatnielCS = player:getVar("hittingTheMarquisateYatnielCS");

    if (hittingTheMarquisateYatnielCS == 1) then
        player:startEvent(10029,0,17314);
    elseif (hittingTheMarquisateYatnielCS == 2) then
        player:startEvent(10030,0,17314);
    elseif (hittingTheMarquisateYatnielCS == 3) then
        player:startEvent(10032);
    else
        player:startEvent(10028);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 10029) then
        player:setVar("hittingTheMarquisateYatnielCS",2);
    elseif (csid == 10031) then
        player:setVar("hittingTheMarquisateYatnielCS",3);
        player:tradeComplete();
    end



end;

