-----------------------------------
--      Area: Southern San d'Oria
--      NPC: Apairemant
--      Only sells when San d'Oria controls Gustaberg Region
--      @zone 230
--      @pos 72 2 0
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--RegionOwner = GetRegionOwner(GUSTABERG);

	--if (RegionOwner ~= SANDORIA) then
			--player:showText(npc,APAIREMANT_CLOSED_DIALOG);
	--else
			player:showText(npc,APAIREMANT_OPEN_DIALOG);

			stock = {
			4184,3,    -- Sulfur
			4183,3,             -- Popoto
			4169,3,             -- Rye Flour
			4185,3,             -- Eggplant

}
showShop(player,SANDORIA,stock);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




