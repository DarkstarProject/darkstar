-----------------------------------
-- Area: Ceizak Battlegrounds
--  NPC: HomePoint#1
-- !pos -107 3.2 295 261
-----------------------------------
package.loaded["scripts/zones/Ceizak_Battlegrounds/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Ceizak_Battlegrounds/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 46);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport(player, option);
        end
    end
end;