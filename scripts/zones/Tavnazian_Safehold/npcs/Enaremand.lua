-----------------------------------
-- Area: Tavnazian Safehold
--   NPC: Enaremand
-- Type: Standard NPC
-- !pos 95.962 -42.003 51.613 26
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(537);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

