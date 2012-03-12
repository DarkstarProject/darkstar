-----------------------------------
--  Area: Southern San d`Oria
--   NPC: Alivatand
--  Type: Guildworkers Union Leather carft
-- @zone: 230
--  @pos: -179 0 15
-----------------------------------
-- Guild shops not implemented

package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:showText(npc,6692) -- is a temp textid 

	stock = {4242,200,1,		--plasma crystal
			 4238,200,1,		--inferno crystal
			 4239,200,1,		--glacier
			 4240,200,1,		--cyclone
			 4241,200,1,		--terra 
			 4243,200,1,		--torrent
			 4245,200,1,		--twilight
			 4244,200,1,		--aurora 

			 15448,10000,2,		--tanners belt
			 2129,10000,2,		--tanning
--			 2016,40000,2,		--leather purification is a key item
--			 2017,40000,2,		--leather ensorcelment is a key item
			 			 
			 14832,70000,3,		-- tanners gloves
			 
			 15823,80000,3,		--tanners ring
			 
			 14396,100000,3,	--tanners apron
			 
			 3668,50000,3,		--Hide stretcher
			 
			 202,150000,3,		--golden fleece
			 3329,15000,3,		--tanners emblem
			 339,200000,3}		--tanners signboard
	 
	showNationShop(player, SANDORIA, stock);

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
end;



