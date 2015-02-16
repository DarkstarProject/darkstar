-----------------------------------
-- Wayward Echo LC
-- allied tags npc
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Rolanberry_Fields_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- 455 non camapin cs
	-- 255 dunno cs
	-- 262 supply mission cs
	-- 265 some chocobo cs thing
	--if(player:startEvent(0x0065) then
	     player:startEvent(455);
	--else
	--    player:startEvent(0x0451);
	--end
	
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
--print("CSID:",csid);
--print("RESULT:",option);
	if(option == 2) then
	    if(csid == 455) then
	    player:addStatusEffect(EFFECT_ALLIED_TAGS);
	    end	
    end
	return EFFECT_ALLIED_TAGS;
end;