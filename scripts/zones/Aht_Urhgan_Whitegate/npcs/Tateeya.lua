-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Tateeya
-- Automaton Attachment Unlocks
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local tradeStatus = player:getVar('TateeyaTradeStatus');
    local automatonName = player:getAutomatonName();
    if (tradeStatus == 1) then
        for i=0,7 do
            local subid = trade:getItemSubId(i);
            if (subid >= 0x2000 and subid < 0x2800) then
                if (player:unlockAttachment(subid)) then
                    player:setVar('TateeyaUnlock', subid);
                    player:startEventString(0x028B, automatonName, automatonName, automatonName, automatonName, subid); --unlock attachment event
                    trade:confirmItem(i);
                    player:confirmTrade();
                else
                    player:startEvent(0x028C); --already unlocked event
                end
                break;
            end
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local tradeStatus = player:getVar('TateeyaTradeStatus');
    local automatonName = player:getAutomatonName();
    if (tradeStatus == 0) then
        if (player:getMainJob() == JOBS.PUP) then
            player:startEventString(0x028A, automatonName, automatonName, automatonName, automatonName); --trade me to unlock attachments
        else
            player:startEvent(0x0102); --default no PUP CS
        end
    else
        player:startEventString(0x028A, automatonName, automatonName, automatonName, automatonName, 1);
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
    if (csid == 0x028A) then --unlocking attachments explanation
        player:setVar('TateeyaTradeStatus', 1);
    elseif (csid == 0x028B) then
        local subid = player:getVar('TateeyaUnlock');
        player:messageSpecial(AUTOMATON_ATTACHMENT_UNLOCK, subid);
        player:setVar('TateeyaUnlock',0);
    end
end;



