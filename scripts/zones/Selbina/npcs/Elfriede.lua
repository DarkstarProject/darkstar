-----------------------------------
-- Area: Selbina
--  NPC: Elfriede
-- Involved In Quest: The Tenshodo Showdown
-- !pos 61 -15 10 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getVar("theTenshodoShowdownCS") == 3) then
        if (trade:hasItemQty(4569,1) and trade:getItemCount() == 1) then -- Trade Quadav Stew
            player:startEvent(10004,0,TENSHODO_ENVELOPE,4569);
        end
    end

end;

function onTrigger(player,npc)

    local theTenshodoShowdownCS = player:getVar("theTenshodoShowdownCS");

    if (theTenshodoShowdownCS == 2) then
        player:startEvent(10002,0,TENSHODO_ENVELOPE,4569); -- During Quest "The Tenshodo Showdown"
        player:setVar("theTenshodoShowdownCS",3);
    elseif (theTenshodoShowdownCS == 3) then
        player:startEvent(10003,0,0,4569);
    else
        player:startEvent(25); -- Standard dialog
    end

end;

-- 25  10002  10003  10004 4569

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 10004) then
        player:tradeComplete();
        player:setVar("theTenshodoShowdownCS",4);
        player:delKeyItem(TENSHODO_ENVELOPE);
        player:addKeyItem(SIGNED_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,SIGNED_ENVELOPE);
    end

end;