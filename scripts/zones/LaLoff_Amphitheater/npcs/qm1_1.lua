-----------------------------------
-- Area: LaLoff_Amphitheater
-- NPC:  Shimmering Circle (BCNM Entrances)
-------------------------------------
require("scripts/globals/bcnm");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
-------------------------------------

-- Death cutscenes:

--    player:startEvent(32001,1,instance:getFastestTime(),1,instance:getTimeInside(),1,0,0); -- hume
--    player:startEvent(32001,1,instance:getFastestTime(),1,instance:getTimeInside(),1,1,0); -- taru
--    player:startEvent(32001,1,instance:getFastestTime(),1,instance:getTimeInside(),1,2,0); -- mithra
--    player:startEvent(32001,1,instance:getFastestTime(),1,instance:getTimeInside(),1,3,0); -- elvaan
--    player:startEvent(32001,1,instance:getFastestTime(),1,instance:getTimeInside(),1,4,0); -- galka
--    player:startEvent(32001,1,instance:getFastestTime(),1,instance:getTimeInside(),1,5,0); -- divine might

-- param 1: entrance #
-- param 2: fastest time
-- param 3: unknown
-- param 4: clear time
-- param 5: zoneid
-- param 6: exit cs (0-4 AA, 5 DM, 6-10 neo AA, 11 neo DM)
-- param 7: skip (0 - no skip, 1 - prompt, 2 - force)
-- param 8: 0

function onTrade(player,npc,trade)
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

function onTrigger(player,npc)
    if (EventTriggerBCNM(player,npc)) then
        return;
    end
end;

function onEventUpdate(player,csid,option)
    if (EventUpdateBCNM(player,csid,option,1)) then
        return;
    end
end;

function onEventFinish(player,csid,option)
    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;