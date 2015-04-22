-----------------------------------
--	Area:	Southern San d'Oria [S]
--	NPC:	Porter Moogle
--	Type:	Storage Moogle
--	@zone 80
--	@pos TODO
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/porter_moogle_util");

local e = 
{
	TALK_EVENT_ID		=	659,
	STORE_EVENT_ID		=	660,
	RETRIEVE_EVENT_ID	=	661,
	ALREADY_STORED_ID	=	662,
	MAGIAN_TRIAL_ID		=	663
};

RETRIEVE_DIALOG_ID	=	15520;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	doTrade(player, trade, e);
end

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	-- No idea what the params are, other than event ID and gil.
	player:startEvent(e.TALK_EVENT_ID, 0x6FFFFF, 0x01, 0x06DD, 0x27, 0x7C7E, 0x15, player:getGil(), 0x03E8);
end

-----------------------------------
-- onEventUpdate
-----------------------------------
function onEventUpdate(player,csid,option)
	if (csid == e.RETRIEVE_EVENT_ID) then
		retrieveItem(player, option, RETRIEVE_DIALOG_ID, ITEM_CANNOT_BE_OBTAINED);
	end
end

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player,csid,option)
	-- Is there a default option value for cancelling selection windows?
	if (csid == e.TALK_EVENT_ID and option < 1000) then
		buyStorageSlip(player, option, ITEM_CANNOT_BE_OBTAINED, ITEM_OBTAINED, NOT_HAVE_ENOUGH_GIL);
	else
		player:setLocalVar('slipId', 0);
	end
end