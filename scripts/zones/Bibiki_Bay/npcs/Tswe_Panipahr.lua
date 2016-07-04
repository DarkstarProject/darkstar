-----------------------------------
--  Area: Bibiki Bay
--  NPC:  Tswe Panipahr
--  Type: Manaclipper
--  @pos 484.604 -4.035 729.671 4
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   local curentticket=0;
   if  (player:hasKeyItem(MANACLIPPER_TICKET)) then
       curentticket=MANACLIPPER_TICKET;
   elseif (player:hasKeyItem(MANACLIPPER_MULTITICKET)) then
       curentticket=MANACLIPPER_MULTITICKET;
   end
   
  if ( curentticket ~= 0 ) then
    player:messageSpecial(HAVE_BILLET,curentticket);
  else 
  local gils=player:getGil();
    player:startEvent(0x0023,MANACLIPPER_TICKET,MANACLIPPER_MULTITICKET ,80,gils,0,500);
  end
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
     if (csid == 0x0023) then
       if (option==1) then
       player:delGil(80);
       player:addKeyItem(MANACLIPPER_TICKET);
       player:messageSpecial(KEYITEM_OBTAINED,MANACLIPPER_TICKET);
       elseif (option==2) then
       player:delGil(500);
       player:addKeyItem(MANACLIPPER_MULTITICKET);
       player:messageSpecial(KEYITEM_OBTAINED,MANACLIPPER_MULTITICKET);
       player:setVar("Manaclipper_Ticket",10);
       end
     end
end;

