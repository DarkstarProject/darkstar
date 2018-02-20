-----------------------------------
-- Area: North Gustaberg (S) (J-9)
--  NPC: Solitary Ant
-- Involved in Quests: Fire in the Hole
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:startEvent(112)

end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;
