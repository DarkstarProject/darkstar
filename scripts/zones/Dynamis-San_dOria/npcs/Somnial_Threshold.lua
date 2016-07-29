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
        player:setPos(161.000,-2.000,161.000,94,0xE6);
    end
    
end;