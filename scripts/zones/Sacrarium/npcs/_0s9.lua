-----------------------------------
-- Area:  Sacrarium
-- NPC:   _0s9 (Wooden Gate)
-- @pos 20.000 0.500 19.500 28
-----------------------------------


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getZPos() > 20) then
        player:messageSpecial(CANNOT_OPEN_SIDE);
    elseif (player:getZPos() < 20) then
        player:startEvent(0x006a);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;