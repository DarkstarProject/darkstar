-----------------------------------
--  Area: Manaclipper
--  NPC:  Khots Chalahko
--  Type: NPC
--  @pos 0.019 -4.674 -18.782 3
-----------------------------------
package.loaded["scripts/zones/Manaclipper/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Manaclipper/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc,KHOTS_CHALAHKO_OFFSET);
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

