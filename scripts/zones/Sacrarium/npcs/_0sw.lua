-----------------------------------
-- Area:  Sacrarium
-- NPC:   _0sw (Reliquiarium Gate)
-- @pos 23.447 -1.563 50.941 28
-----------------------------------


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getZPos() < 52) then
      player:messageSpecial(STURDY_GATE);    
    else
      player:messageSpecial(KEYHOLE_DAMAGED);            
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