-----------------------------------
-- Area: RuAun_Gardens
-- NPC:  HomePoint#3
-- @pos -312 -42 -422 130
-----------------------------------

package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;

require("scripts/globals/settings");
require("scripts/zones/RuAun_Gardens/TextIDs");
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

    homepointMenu( player, 0x21fe, 61);
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