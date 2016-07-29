-----------------------------------
--  Area: Bostaunieux Oubliette
--  NPC:  Chumia
--  Type: Standard NPC
--  @pos 102.420 -25.001 70.457 167
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bostaunieux_Oubliette/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, CHUMIA_DIALOG);
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

