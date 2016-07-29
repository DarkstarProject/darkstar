-----------------------------------
--  Area: Beadeaux
--  NPC:  Ge'Fhu Yagudoeye
--  Type: Quest NPC
--  @pos -91.354 -4.251 -127.831 147
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Beadeaux/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x007c);
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
end;

