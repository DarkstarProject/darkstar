-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Glowing Pebbles
-- Type: Involved in Quest
-- !pos
--  player:startEvent(106); Left over Cutscene
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)

    local yagudoGlue = 2558;

    if (trade:hasItemQty(yagudoGlue,1)) then

        local nextRoadToDivadomCS = 107;

        if (player:getVar("roadToDivadomCS") == 3) then
            player:tradeComplete();
            player:startEvent(nextRoadToDivadomCS);
            player:setVar("roadToDivadomCS",4);
        end;
    end;
end;

function onTrigger(player,npc)

    if (player:getVar("Lakeside_Minuet_Progress") == 3 and player:hasKeyItem(dsp.ki.STARDUST_PEBBLE) == false) then
        player:startEvent(100);
        player:addKeyItem(dsp.ki.STARDUST_PEBBLE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.STARDUST_PEBBLE);
    elseif (player:getVar("roadToDivadomCS") == 2) then
        local nextRoadToDivadomCS = 106;
        player:startEvent(nextRoadToDivadomCS);
        player:setVar("roadToDivadomCS", 3);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
