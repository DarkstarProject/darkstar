-----------------------------------
-- Area: Bastok Markets
-- NPC:  HomePoint#4
-- @pos -191 -6 -68 235
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------
-- onTrade Action
-----------------------------------(

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    homepointMenu( player, 0x21ff, 100);
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

    if (csid == 0x21ff) then

        if (option == 1) then    
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;