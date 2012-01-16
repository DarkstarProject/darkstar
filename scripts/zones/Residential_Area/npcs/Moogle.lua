-----------------------------------
-- Area: Residential Area
-- NPC:  Moogle
-- 
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
  local loadintro = player:getVar("MogIntro");
    if (loadintro ==0) then
      player:startEvent(0x7530);
    else
      player:sendMenu(1);
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
  local mogintro = player:getVar("MogIntro");
    if (mogintro==0) then
      player:setVar("mogintro",1);
    end
end;



