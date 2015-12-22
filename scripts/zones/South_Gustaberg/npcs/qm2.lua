-----------------------------------
-- Area: South Gustaberg
--  NPC: ???
-- Involved in Quest: Smoke on the Mountain
-- @pos 461 -21 -580 107
-----------------------------------
package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/South_Gustaberg/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:needToZone() == false) then
        player:setVar("SGusta_Sausage_Timer", 0);
    end

    local SmokeOnTheMountain = player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN);

    if (SmokeOnTheMountain == QUEST_ACCEPTED) then
        if (trade:hasItemQty(4372,1) and trade:getItemCount() == 1) then
            if (player:getVar("SGusta_Sausage_Timer") == 0) then
                -- player puts sheep meat on the fire
                player:messageSpecial(FIRE_PUT, 4372);
                player:tradeComplete();
                player:setVar("SGusta_Sausage_Timer", os.time() + 3456); -- 57 minutes 36 seconds, 1 Vana'diel Day
                player:needToZone(true);
            else
                -- message given if sheep meat is already on the fire
                player:messageSpecial(MEAT_ALREADY_PUT, 4372)
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:needToZone() == false) then
        player:setVar("SGusta_Sausage_Timer", 0);
    end

    local SmokeOnTheMountain = player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN);
    local sausageTimer = player:getVar("SGusta_Sausage_Timer");

    if (SmokeOnTheMountain ~= QUEST_AVAILABLE and sausageTimer ~= 0) then
        if (sausageTimer >= os.time()) then
            player:messageSpecial(FIRE_LONGER, 4372);
        elseif (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4395);
        elseif (sausageTimer < os.time()) then
            player:setVar("SGusta_Sausage_Timer", 0);
            player:messageSpecial(FIRE_TAKE, 4395);
            player:addItem(4395);
        end
    elseif (SmokeOnTheMountain ~= QUEST_AVAILABLE and sausageTimer == 0) then
        player:messageSpecial(FIRE_GOOD);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
end;