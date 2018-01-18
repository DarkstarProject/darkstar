-----------------------------------
-- Area: RuAun_Gardens
-- NPC:  HomePoint#1
-- !pos 5 -42 526 130
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

    homepointMenu( player, 8700, 59);
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

    if (csid == 8700) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;