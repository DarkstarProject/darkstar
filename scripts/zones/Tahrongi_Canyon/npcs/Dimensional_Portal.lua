-----------------------------------
-- Area: Tahrongi_Canyon
--  NPC: Dimensional_Portal
-- !pos 260.000 35.150 340.000 117
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Tahrongi_Canyon/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) > THE_WARRIOR_S_PATH) or (DIMENSIONAL_PORTAL_UNLOCK == true) then
        player:startEvent(915);
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
    if (csid == 915 and option == 1) then
        player:setPos(654.200,-2.799,100.700,193,33); -- To AlTaieu {R}
    end
end;