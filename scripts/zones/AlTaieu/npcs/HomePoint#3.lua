-----------------------------------
-- Area: AlTaieu
-- NPC:  HomePoint#3
-- @pos 569 0 410 33
-----------------------------------

package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/zones/AlTaieu/TextIDs");
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
    homepointMenu( player, 0x21fe, 87);
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
    if (csid == 0x21fe) then
        if (option == 1) then    
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;