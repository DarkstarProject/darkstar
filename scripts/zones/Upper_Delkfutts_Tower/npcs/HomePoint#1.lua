-----------------------------------
-- Area: Upper Delkfutt's Tower
--  NPC: HomePoint#1
-- !pos -365 -176.5 -36 158
-----------------------------------
package.loaded["scripts/zones/Upper_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Upper_Delkfutts_Tower/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 71);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;