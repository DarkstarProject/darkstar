-----------------------------------
-- Area: La Theine Plateau
--  NPC: Vicorpasse
-- Involved in Mission: The Rescue Drill
-- !pos -344 37 266 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL) then
        local MissionStatus = player:getVar("MissionStatus");

        if (MissionStatus == 4) then
            player:startEvent(108);
        elseif (MissionStatus >= 5 and MissionStatus <= 7) then
            player:showText(npc, RESCUE_DRILL + 19);
        elseif (MissionStatus == 8) then
            player:showText(npc, RESCUE_DRILL + 21);
        elseif (MissionStatus == 9) then
            player:showText(npc, RESCUE_DRILL + 26);
        elseif (MissionStatus == 10) then
            player:startEvent(115);
        elseif (MissionStatus == 11) then
            player:showText(npc, RESCUE_DRILL + 30);
        else
            player:startEvent(5);
        end
    else
        player:startEvent(5);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 108) then
        player:setVar("MissionStatus",5);
    elseif (csid == 115) then
        player:addKeyItem(RESCUE_TRAINING_CERTIFICATE);
        player:messageSpecial(KEYITEM_OBTAINED,RESCUE_TRAINING_CERTIFICATE);
        player:setVar("theRescueDrillRandomNPC",0);
        player:setVar("MissionStatus",11);
    end

end;