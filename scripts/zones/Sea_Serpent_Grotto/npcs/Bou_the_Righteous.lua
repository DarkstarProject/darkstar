-----------------------------------
-- Area: Sea Serpent Grotto
--   NPC: Bou the Righteous
-- Type: Involved in the "Sahagin Key Quest"
-- @zone 176
-- !pos -125.029 46.568 -334.778
--
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(108);
    player:setVar("SahaginKeyProgress",2);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

