-----------------------------------
-- Area: La Theine Plateau
--  NPC: Dimensional Portal
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/La_Theine_Plateau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) > THE_WARRIOR_S_PATH) or (DIMENSIONAL_PORTAL_UNLOCK == true) then
        player:startEvent(204);
    else
        player:messageSpecial(ALREADY_OBTAINED_TELE+1); -- Telepoint Disappeared
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 204 and option == 1) then
        player:setPos(25.299,-2.799,579,193,33); -- To AlTaieu {R}
    end
end;