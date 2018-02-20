-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Cavernous Maw
-- !pos 418 25 27 90
-- Teleports Players to Pashhow_Marshlands
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (hasMawActivated(player,4) == false) then
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (option == 1) then
        if (csid == 100) then
            player:addNationTeleport(MAW,16);
        end
        toMaw(player,16);
    end
end;