-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_KUFTAL_TUNNEL,player);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,735,736,737,738,739,740,741,742,0,0);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,735,736,737,738,739,740,741,742,0,0,GOV_MSG_KUFTAL_TUNNEL);
end;
