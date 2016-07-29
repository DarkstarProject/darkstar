-----------------------------------
-- Area: Mount Zhayolm
-- NPC:  Engraved Tablet
-- @pos 320 -15.35 -379 61
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
    
    if (player:hasKeyItem(SILVER_SEA_SALT)) then
        player:startEvent(0x000c);
    else
        player:startEvent(0x000e);
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
    
    if (csid == 0x000c and option == 1) then
        player:delKeyItem(SILVER_SEA_SALT);
    end
    
end;