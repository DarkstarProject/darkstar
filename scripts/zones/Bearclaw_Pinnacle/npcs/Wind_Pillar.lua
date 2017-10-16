-----------------------------------
-- Area: Bearclaw Pinnacle
-- NPC:  Wind Pillar
-----------------------------------

require("scripts/globals/bcnm");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    TradeBCNM(player,npc,trade);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    EventTriggerBCNM(player,npc);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    EventFinishBCNM(player,csid,option);
end;