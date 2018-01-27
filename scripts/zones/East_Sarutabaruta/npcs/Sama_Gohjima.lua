-----------------------------------
-- Area: East Sarutabaruta
--  NPC: Sama Gohjima
--  Involved in Mission: The Horutoto Ruins Experiment (optional)
-- !pos 377 -13 98 116
-----------------------------------
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/East_Sarutabaruta/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT and player:getVar("MissionStatus") == 1) then
        player:showText(npc,SAMA_GOHJIMA_PREDIALOG);
    elseif (player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT and player:getVar("MissionStatus") ~= 1) then
        player:messageSpecial(SAMA_GOHJIMA_POSTDIALOG);
    else
        player:startEvent(43);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;