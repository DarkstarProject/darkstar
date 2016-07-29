-----------------------------------
--  Area: Bastok Mines
--   NPC: Zopago
--  Type: VCS Chocobo Trainer
-- @zone: 234
--  @pos 51.706 -0.126 -109.065
--
-- Auto-Script: Requires Verification
-----------------------------------

package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

--    player:startEvent(0x0202); -- event that follows egg trading
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:startEvent(0x01fc);
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