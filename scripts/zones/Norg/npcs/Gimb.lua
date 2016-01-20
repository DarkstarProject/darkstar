-----------------------------------
--  Area: Norg
--   NPC: Gimb
--  Type: Begins the "Sahagin Key Quest" but it doesn't appear in the log. See http://wiki.ffxiclopedia.org/wiki/Sahagin_Key_Quest
-- @zone: 252
--  @pos -4.975 -1.975 -44.039
-- 
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0045);
    player:setVar("SahaginKeyProgress",1);
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

