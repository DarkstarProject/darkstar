-----------------------------------
-- Area: Navukgo Execution Chamber
-- NPC:  Cast Bronze Gate (Inside BCNM)
-- @zone 282 -123 380 64
-----------------------------------
package.loaded["scripts/zones/Navukgo_Execution_Chamber/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Navukgo_Execution_Chamber/TextIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (EventTriggerBCNM(player,npc)) then
        return;
    end
end;

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (EventFinishBCNM(player,csid,option)) then
        return;
    end

end;
