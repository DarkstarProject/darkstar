-----------------------------------
-- Area: Tavnazian_Safehold
-- NPC:  HomePoint#3
-- @pos 73.59 -36.149 38.87 26
-----------------------------------

package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/zones/Tavnazian_Safehold/TextIDs");
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

    homepointMenu( player, 0x21fe, 121);
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