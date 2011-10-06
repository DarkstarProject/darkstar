-----------------------------------
-- Area: Upper Jeuno
-- NPC: Chocobo
-- Finishes Quest: Chocobo's Wounds
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    ChocobosWounds = player:getQuestStatus(JEUNO,CHOCOBO_S_WOUNDS);

    if (ChocobosWounds == 0) then
        player:startEvent(0x003e);
    elseif (ChocobosWounds == 1) then
		count = trade:getItemCount();
		gil = trade:getGil();

        if (trade:hasItemQty(GYSAHL_GREENS,1)) then
        	player:startEvent(0x004c);
        elseif (trade:hasItemQty(GAUSEBIT_GRASS,1) and gil == 0 and count == 1) then
			--Check feeding status.
			feed = player:getVar("ChocobosWounds_Event");
			feedDay = player:getVar("ChocobosWounds_Day");
			feedYear = player:getVar("ChocobosWounds_Year");
			currentDay = VanadielDayOfTheYear();
			feedReady = ((feedDay < currentDay) or (feedDay > currentDay and feedYear < VanadielYear()))

            if (feed == 1) then
                player:startEvent(0x0039);
            elseif (feedReady == true) then
                if (feed == 2) then
                    player:startEvent(0x003a);
                elseif (feed == 3) then
                    player:startEvent(0x003b);
                elseif (feed == 4) then
                    player:startEvent(0x003c);
                elseif (feed == 5) then
                    player:startEvent(0x003f);
                elseif (feed == 6) then
                    player:startEvent(0x0040);
                end
            else
            	if (feed > 2) then
                	player:startEvent(0x0049);
                end
            end
        end
    else
        if (trade:hasItemQty(GYSAHL_GREENS,1)) then
     	   player:startEvent(0x0026);
     	end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    ChocobosWounds = player:getQuestStatus(JEUNO,CHOCOBO_S_WOUNDS);

    if (ChocobosWounds == 0) then
        player:startEvent(0x003e);
    elseif (ChocobosWounds == 1) then
        feed = player:getVar("ChocobosWounds_Event");

        if (feed == 1) then
            player:startEvent(0x0067);
        elseif (feed == 2) then
            player:startEvent(0x0033);
        elseif (feed == 3) then
            player:startEvent(0x0034);
        elseif (feed == 4) then
            player:startEvent(0x003b);
        elseif (feed == 5) then
            player:startEvent(0x002e);
        elseif (feed == 6) then
            player:startEvent(0x0037);
        end
    elseif (ChocobosWounds == 2) then
        player:startEvent(0x0037);
    else
        player:startEvent(0x0036);
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

    if (csid == 0x0039) then
        player:setVar("ChocobosWounds_Event", 2);
        player:setVar("ChocobosWounds_Day",VanadielDayOfTheYear());
        player:setVar("ChocobosWounds_Year",VanadielYear());
    elseif (csid == 0x003a) then
        player:setVar("ChocobosWounds_Event", 3);
        player:setVar("ChocobosWounds_Day",VanadielDayOfTheYear());
        player:setVar("ChocobosWounds_Year",VanadielYear());
    elseif (csid == 0x003b) then
        player:setVar("ChocobosWounds_Event", 4);
        player:setVar("ChocobosWounds_Day",VanadielDayOfTheYear());
        player:setVar("ChocobosWounds_Year",VanadielYear());
        player:tradeComplete();
		player:startEvent(0x0063); 
    elseif (csid == 0x003c) then
        player:setVar("ChocobosWounds_Event", 5);
        player:setVar("ChocobosWounds_Day",VanadielDayOfTheYear());
        player:setVar("ChocobosWounds_Year",VanadielYear());
        player:tradeComplete();
    elseif (csid == 0x003f) then
        player:setVar("ChocobosWounds_Event", 6);
        player:setVar("ChocobosWounds_Day",VanadielDayOfTheYear());
        player:setVar("ChocobosWounds_Year",VanadielYear());
        player:tradeComplete();            
    elseif (csid == 0x0040) then
        player:completeQuest(JEUNO,CHOCOBO_S_WOUNDS);
        player:addKeyItem(CHOCOBO_LICENSE);
        player:messageSpecial(KEYITEM_OBTAINED, CHOCOBO_LICENSE);
        player:setTitle(CHOCOBO_TRAINER);
        player:addFame(BASTOK,BAS_FAME*40);
        player:addFame(SAN_D_ORIA,SAN_FAME*40);
        player:addFame(WINDURST,WIN_FAME*40);
        player:setVar("ChocobosWounds_Event", 0);
        player:setVar("ChocobosWounds_Day", 0);
        player:setVar("ChocobosWounds_Year",0);
        player:tradeComplete();
    end
end;
