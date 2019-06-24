-----------------------------------
-- Area: Spire_of_vahlz
-- NPC:  web of regret
-----------------------------------

require("scripts/globals/bcnm");

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

function onTrigger(player,npc)
    EventTriggerBCNM(player,npc);
end;

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    EventFinishBCNM(player,csid,option);
end;