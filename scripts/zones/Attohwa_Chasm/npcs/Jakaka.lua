-----------------------------------
--  Area: Attohwa Chasm
--  NPC:  Jakaka
--  Type: ENM
--  @pos -144.711 6.246 -250.309 7
-----------------------------------
package.loaded["scripts/zones/Attohwa_Chasm/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Attohwa_Chasm/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Parradamo Stones
	if (trade:hasItemQty(1778,1) and trade:getItemCount() == 1) then
		player:tradeComplete();
		player:startEvent(12);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local MiasmaFilterCD = player:getVar("[ENM]MiasmaFilter");
    
    if (player:hasKeyItem(MIASMA_FILTER)) then
        player:startEvent(11);
    else
        if (MiasmaFilterCD >= os.time(t)) then
            -- Both Vanadiel time and unix timestamps are based on seconds. Add the difference to the event.
            player:startEvent(14, VanadielTime()+(MiasmaFilterCD-os.time(t)));
        else
            if (player:hasItem(1778)==true or player:hasItem(1777)==true) then -- Parradamo Stones, Flaxen Pouch
                player:startEvent(15); 
            else
                player:startEvent(13); 
            end;
        end;
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
    if (csid == 12) then
		player:addKeyItem(MIASMA_FILTER);
		player:messageSpecial(KEYITEM_OBTAINED,MIASMA_FILTER);
		player:setVar("[ENM]MiasmaFilter",os.time(t)+86400*MIASMA_FILTER_COOLDOWN); -- Current time + 1dayInSeconds*MIASMA_FILTER_COOLDOWN
	elseif (csid == 13) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1777); -- Flaxen Pouch
            return;
        else
            player:addItem(1777);
            player:messageSpecial(ITEM_OBTAINED, 1777); -- Flaxen Pouch
        end
    end
end;
