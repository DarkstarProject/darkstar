-----------------------------------
--  Area: The Garden of Ru'Hmet
--  NPC:  particle gate
-----------------------------------

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
    
    if (player:hasKeyItem(BRAND_OF_DAWN)==false) then
        player:startEvent(0x006E);
    end
    
    return 1;
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
  if (csid == 0x006E and option==1) then
      player:messageSpecial(KEYITEM_OBTAINED,BRAND_OF_DAWN);
      player:addKeyItem(BRAND_OF_DAWN);
  end
end;