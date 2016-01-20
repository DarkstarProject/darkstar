-----------------------------------
-- Area: Davoi
-- NPC:  Village Well
-- Involved in Quest: Under Oath
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1095,1) and player:getVar("UnderOathCS") == 5) then
        player:startEvent(0x0071);
        player:tradeComplete();
    else
        player:messageSpecial(A_WELL);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getVar("UnderOathCS") == 5 and player:hasKeyItem(STRANGE_SHEET_OF_PAPER) and player:hasItem(1095) == false) then -- Under Oath Quest - PLD AF3
        SpawnMob(17387970,180):updateClaim(player); --One-eyed_Gwajboj
        SpawnMob(17387971,180):updateClaim(player); --Three-eyed_Prozpuz
    elseif (player:getVar("UnderOathCS") == 6 and player:hasKeyItem(KNIGHTS_CONFESSION)) then
        player:startEvent(0x0070);  --Under Oath -- Reads contents of the letter
    else
        player:messageSpecial(A_WELL);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0071) then
        player:addKeyItem(KNIGHTS_CONFESSION);
        player:messageSpecial(KEYITEM_OBTAINED,KNIGHTS_CONFESSION);
        player:setVar("UnderOathCS",6);
        player:delKeyItem(STRANGE_SHEET_OF_PAPER);
    end
end;
