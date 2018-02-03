-----------------------------------
-- Area: La_Theine Plateau
--  NPC: Shattered Telepoint
-- !pos 334 19 -60 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/La_Theine_Plateau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") == 1) then
        player:startEvent(202,0,0,1); -- first time in promy -> have you made your preparations cs
    elseif (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and (player:hasKeyItem(LIGHT_OF_MEA) or player:hasKeyItem(LIGHT_OF_DEM))) then
        if (player:getVar("cspromy2") == 1) then
            player:startEvent(201);  -- cs you get nearing second promyvion
        else
            player:startEvent(202)
        end
    elseif (player:getCurrentMission(COP) > THE_MOTHERCRYSTALS or player:hasCompletedMission(COP,THE_LAST_VERSE) or (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") > 1)) then
        player:startEvent(202); -- normal cs (third promyvion and each entrance after having that promyvion visited or mission completed)
    else
        player:messageSpecial(TELEPOINT_HAS_BEEN_SHATTERED);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 201) then
        player:setVar("cspromy2",0);
        player:setVar("cs2ndpromy",1);
        player:setPos(-266.76, -0.635, 280.058, 0, 14); -- To Hall of Transference {R}
    elseif (csid == 202 and option == 0) then
        player:setPos(-266.76, -0.635, 280.058, 0, 14); -- To Hall of Transference {R}
    end

end;

