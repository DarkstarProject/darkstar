-----------------------------------
-- Area: Konschtat Highlands
-- NPC:  Dimensional_Portal
-- @pos 220.000 19.104 140.000 108
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) > THE_WARRIOR_S_PATH) or (DIMENSIONAL_PORTAL_UNLOCK == true) then
        player:startEvent(0x0393);
    else
        player:messageSpecial(ALREADY_OBTAINED_TELE+1); -- Telepoint Disappeared
    end

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
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
    if (csid == 0x0393 and option == 1) then
        player:setPos(-635.599,-2.799,163.8,193,33); -- To AlTaieu {R}
    end
end;