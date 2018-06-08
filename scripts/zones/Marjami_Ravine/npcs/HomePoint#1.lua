-----------------------------------
-- Area: Marjami Ravine
--  NPC: HomePoint#1
-- !pos  -23 0 174 266
-----------------------------------
package.loaded["scripts/zones/Marjami_Ravine/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Marjami_Ravine/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 50);
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