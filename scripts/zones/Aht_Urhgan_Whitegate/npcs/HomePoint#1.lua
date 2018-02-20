-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: HomePoint#1
-- !pos  -21.129 0.001 -20.944 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 65);
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