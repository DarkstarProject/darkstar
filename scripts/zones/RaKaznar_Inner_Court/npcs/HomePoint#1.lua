-----------------------------------
-- Area: RaKaznar_Inner_Court
--  NPC: HomePoint#1
-- !pos 757 120 17.5 276
-----------------------------------
package.loaded["scripts/zones/RaKaznar_Inner_Court/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/RaKaznar_Inner_Court/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 116);
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