-----------------------------------
-- Area: LaLoff_Amphitheater
-- NPC:  Shimmering Circle (BCNM Entrances)
-------------------------------------

require("scripts/globals/bcnm");

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

function onTrigger(player,npc)
    EventTriggerBCNM(player,npc);
end;

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras,1);
end;

function onEventFinish(player,csid,option)
    EventFinishBCNM(player,csid,option);
end;
