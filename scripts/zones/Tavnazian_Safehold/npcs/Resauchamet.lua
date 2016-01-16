-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Resauchamet
-- Standard Info NPC
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
 local kill=player:getVar("FOMOR_HATE");
 local n=0;
  if (kill< 8) then n=0; 
  elseif (kill< 15) then n=1; 
  elseif (kill< 50) then n=2; 
  elseif (kill>= 50) then n=3; 
  end
player:startEvent(0x0163,n);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



