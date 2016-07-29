-----------------------------------
-- Area: Dynamis
-- NPC:  Somnial Threshold
-------------------------------------


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:startEvent(101, 0, 0, 5);

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
    
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);

    if (csid == 101 and option == 1) then
        player:setPos(116.000,0.994,-72.000,127,0xEA);
    end
    
end;