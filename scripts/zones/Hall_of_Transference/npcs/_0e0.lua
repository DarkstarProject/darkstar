-----------------------------------
-- Area: Hall of Transference
--  NPC: Cermet Gate - Holla
-- !pos -219 -6 280 14
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Hall_of_Transference/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) > BELOW_THE_ARKS) then
        player:startEvent(150);
    else
        player:messageSpecial(NO_RESPONSE_OFFSET+1); -- The door is firmly shut.
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 150 and option == 1) then
        player:setPos(92.033, 0, 80.380, 255, 16); -- To Promyvion Holla {R}
    end
end;