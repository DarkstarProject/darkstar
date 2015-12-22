-----------------------------------
--  Area: Abdhaljs Isle-Purgonorgo
--   NPC: Pursuivant
--  Type: Warp
-- @zone: 44
--  @pos 516.223 -3.038 545.258
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0003);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
    if (csid == 0x0003 and option == 1) then
        player:setPos(-0.135,0.000,22.880,105,244);
    end
end;