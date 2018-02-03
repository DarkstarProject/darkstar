-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Sleakachiq
-- !pos 162.504 14.999 136.901 12
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Newton_Movalpolos/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    local Ypos = player:getYPos();

    if (Ypos <= 16.5) then
        if (trade:getItemCount() == 1 and trade:getGil() == 800) then
            player:tradeComplete();
            player:startEvent(28);
        end
    elseif (Ypos >= 19.5) then
        player:messageSpecial(39966); -- H0000! ... Come closer, can't trade from so far away.
    end
end;

function onTrigger(player,npc)

    local Ypos = player:getYPos();

    if (Ypos <= 16.5) then
        player:startEvent(27);
    elseif (Ypos >= 19.5) then
        player:startEvent(26);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 28) then
        if (option == 1) then
            player:setPos(447.99,-4.092,729.791,96,106); -- To North Gustaberg {R}
        elseif (option == 2) then
            player:setPos(-93.657,-119.999,-583.561,232,13); -- To Mine Shaft Entrance {R}
        end
    end
end;

