-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Palardaifault V Draffles
-- @zone 80
-- !pos 9 1 -35
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, 11024); -- Greetings, I am Curate Palardaifaut, and I have been assigned to the Knights of the Iron Ram to ensure that its members stray not from the path of the Goddess.
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;