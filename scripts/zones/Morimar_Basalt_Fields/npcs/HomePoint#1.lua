-----------------------------------
-- Area: Morimar Basalt Fields
--  NPC: HomePoint#1
-- !pos -415 -63.2 409 265
-----------------------------------
package.loaded["scripts/zones/Morimar_Basalt_Fields/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Morimar_Basalt_Fields/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    homepointMenu(player, 8700, 48);
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