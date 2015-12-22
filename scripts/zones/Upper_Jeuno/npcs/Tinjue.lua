-----------------------------------
--  Area: Upper Jeuno
--   NPC: Tinjue
--  Type: Past Event Watcher
-- @zone: 244
--  @pos -73.790 -1 148.181
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
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
    player:startEvent(0x271a);
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

