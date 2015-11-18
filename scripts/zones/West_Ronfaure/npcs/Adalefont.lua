-----------------------------------
--	Area: West Ronfaure
--	NPC:  Adalefont
--  @pos -176.000 -61.999 377.460 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/West_Ronfaure/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local thePickpocket = player:getQuestStatus(SANDORIA, THE_PICKPOCKET);

	if (thePickpocket > 0) then
		player:showText(npc, 7265);
	else
		player:showText(npc, ADALEFONT_DIALOG);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
end;



