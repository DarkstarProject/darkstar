-----------------------------------
-- Area: Palborough Mines
-- NPC:  Mythril Seam
-- Involved In Mission: Journey Abroad
-- Involved in quest: Rock Racketeer
-- @zone 143
-- !pos -68 -7 173  //  Rock Racketeer !pos 210 -32 -63
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Palborough_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local RRvar = player:getVar("rockracketeer_sold");

    if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then

        if (player:getFreeSlotsCount() >= 1) then

            local rand = math.random();

            if (rand <= 0.47) then -- 47%

                --Rock Racketeer
                if (RRvar == 5) then
                    player:startEvent(51,12,598); -- Sharp Stone (598)

                -- Standard
                else
                    player:startEvent(43,12,0,597); -- chunk of mine gravel (597)
                end
            else
                player:startEvent(52,8,598); -- pickaxe breaks
                player:tradeComplete();
            end

        else
            player:startEvent(53); -- cannot carry any more
        end

    -- need a pickaxe
    else
        player:startEvent(32);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(30,12,0,597);
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

    -- Rock Racketeer
    if (csid == 51) then
        player:tradeComplete();
        player:addItem(598);
        player:messageSpecial(ITEM_OBTAINED, 598);

    -- Standard
    elseif (csid == 43) then
        player:tradeComplete();
        player:addItem(597);
        player:messageSpecial(ITEM_OBTAINED,597); -- Mine Gravel
    end

end;