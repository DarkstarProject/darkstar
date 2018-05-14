-----------------------------------
-- Area: North Gustaberg [S]
--  NPC: Cavernous Maw
-- !pos 466 0 479 88
-- Teleports Players to North Gustaberg
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (hasMawActivated(player,7) == false) then
        player:startEvent(100);
    else
        player:startEvent(101);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
    if (option == 1) then
        if (csid == 100) then
            player:addNationTeleport(MAW,128);
        end
        dsp.teleport.toMaw(player,12);
    end
end;