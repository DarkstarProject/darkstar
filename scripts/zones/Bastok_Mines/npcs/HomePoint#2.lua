-----------------------------------
-- Area: Bastok Mines
-- NPC:  HomePoint#2
-- !pos 118 1 -58 234
-----------------------------------

package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;

package.loaded["scripts/globals/homepoint"] = nil;

require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");
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

    homepointMenu( player, 8701, 10);
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

    if (csid == 8701) then

        if (option == 1) then
            player:setHomePoint();
            player:messageSpecial(HOMEPOINT_SET);
        else
            hpTeleport( player, option);
        end
    end
end;