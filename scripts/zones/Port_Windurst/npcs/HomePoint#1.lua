-----------------------------------
-- Area: Port Windurst
-- NPC:  HomePoint#1
-- @pos -68.216 -4.000 111.761 240
-----------------------------------

package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");
require("scripts/globals/homepoint");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    homepointMenu( player, 0x21fc, 22);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);

    if (csid == 0x21fc) then

        if (option == 1) then    
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;