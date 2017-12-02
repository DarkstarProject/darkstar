-----------------------------------
-- Area: Metalworks
-- NPC:  Grohm
-- Involved In Mission: Journey Abroad
-- !pos -18 -11 -27 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK) then
        if (player:getVar("notReceivePickaxe") == 1) then
            player:startEvent(425);
        elseif (player:getVar("MissionStatus") == 4) then
            player:startEvent(423);
        elseif (player:getVar("MissionStatus") == 5 and player:hasItem(599) == false) then
            player:startEvent(424);
        else
            player:startEvent(422);
        end
    elseif (player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2) then
        if (player:getVar("MissionStatus") == 9) then
            player:startEvent(426);
        else
            player:startEvent(427);
        end
    elseif (player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK) then
        if (player:getVar("notReceivePickaxe") == 1) then
            player:startEvent(425,1);
        elseif (player:getVar("MissionStatus") == 4) then
            player:startEvent(423,1);
        elseif (player:getVar("MissionStatus") == 5 and player:hasItem(599) == false) then
            player:startEvent(424,1);
        else
            player:startEvent(422);
        end
    elseif (player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK2) then
        if (player:getVar("MissionStatus") == 9) then
            player:startEvent(426,1);
        else
            player:startEvent(427,1);
        end
    else
        player:startEvent(427);--422
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

    if (csid == 423 or csid == 425) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,605); -- Pickaxes
            player:setVar("notReceivePickaxe",1);
        else
            player:addItem(605,5);
            player:messageSpecial(ITEM_OBTAINED,605); -- Pickaxes
            player:setVar("MissionStatus",5);
            player:setVar("notReceivePickaxe",0);
        end
    elseif (csid == 426) then
        player:setVar("MissionStatus",10);
    end

end;