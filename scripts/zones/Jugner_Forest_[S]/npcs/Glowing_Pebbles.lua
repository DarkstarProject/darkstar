-----------------------------------
--  Area: Jugner Forest (S)
--  NPC:  Glowing Pebbles
--  Type: Involved in Quest
--  @pos 
--  player:startEvent(0x006a); Left over Cutscene
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Jugner_Forest_[S]/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local yagudoGlue = 2558;

    if (trade:hasItemQty(yagudoGlue,1)) then

        local nextRoadToDivadomCS = 0x006B; -- CSID 107

        if (player:getVar("roadToDivadomCS") == 3) then
            player:tradeComplete();
            player:startEvent(nextRoadToDivadomCS);
            player:setVar("roadToDivadomCS",4);
        end;
    end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getVar("Lakeside_Minuet_Progress") == 3 and player:hasKeyItem(STARDUST_PEBBLE) == false) then
        player:startEvent(0x0064);
        player:addKeyItem(STARDUST_PEBBLE);
        player:messageSpecial(KEYITEM_OBTAINED,STARDUST_PEBBLE);
    elseif (player:getVar("roadToDivadomCS") == 2) then
        local nextRoadToDivadomCS = 0x006A; -- CSID 106
        player:startEvent(nextRoadToDivadomCS);
        player:setVar("roadToDivadomCS", 3);
    end;
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
end;

