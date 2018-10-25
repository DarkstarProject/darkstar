-----------------------------------
-- Area: Stellar Fulcrum
-- Door: Qe'Lov Gate
-- !pos -520 -4 17 179
-------------------------------------
require("scripts/globals/bcnm");
-------------------------------------

-- events:
-- 7D00 : BC menu
-- Param 4 is a bitmask for the choice of battlefields in the menu:

-- 1/0: Zilart Mission 8
-- 2/1:
-- 3/2:

function onTrade(player,npc,trade)
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

function onTrigger(player,npc)
    if (EventTriggerBCNM(player,npc)) then
        return 1;
    end
end;

function onEventUpdate(player,csid,option)
    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

function onEventFinish(player,csid,option)
    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;