-----------------------------------
-- Area: Giddeus
-- NPC:  Quu Bokye
-- Involved in Quest: Dark Legacy
-- !pos -159 16 181 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getVar("darkLegacyCS") == 3 and trade:hasItemQty(4445,1) and trade:getItemCount() == 1) then -- Trade Yagudo Cherries
        player:startEvent(62);

    elseif (player:getVar("EARLY_BIRD_TRACK_BOOK") == 1 and trade:hasItemQty(750,1) and trade:getItemCount() == 1) then
        player:startEvent(58);

    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getVar("darkLegacyCS") == 3) then
        player:startEvent(61);

    elseif (player:getVar("EARLY_BIRD_TRACK_BOOK") == 1) then
        player:startEvent(57);

    elseif (player:getVar("EARLY_BIRD_TRACK_BOOK") == 2) then
        player:startEvent(59);

    else
        player:startEvent(56);
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

    if (csid == 62) then
        player:tradeComplete();
        player:setVar("darkLegacyCS",4);

    elseif (csid == 58) then
        player:tradeComplete();
        player:setVar("EARLY_BIRD_TRACK_BOOK",2);
        player:addKeyItem(ART_FOR_EVERYONE);
        player:messageSpecial(KEYITEM_OBTAINED,ART_FOR_EVERYONE);
    end

end;