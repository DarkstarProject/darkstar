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
require("scripts/globals/pathfind");


local path = {
-72, 1.555555, -22,
-71, 1.555555, -21,
-70, 1.555555, -20,
-69, 1.555555, -20,
-68, 1.555555, -20,
-67, 1.555555, -20,
-66, 1.555555, -20,
-65, 1.555555, -20,
-64, 1.555555, -20,
-63, 1.555555, -20,
-62.468536, 2.000000, -19,
-61.541172, 2.000000, -20,
-60.519985, 2.000000, -20,
-59.474659, 2.000000, -20,
-58.417450, 2.000000, -21,
-57.351425, 2.000000, -21,
-56.286743, 2.000000, -21,
-26.770412, 2.000000, -22,
-16.354427, 1.700000, -22,
-17.421194, 1.700000, -22, -- auction house
-46.848141, 2.000000, -23,
-59.516224, 2.000000, -21.955723,
-60.555450, 2.000000, -20.638817,
-61.514832, 2.000000, -20.127840,
-62.426712, 2.000000, -20,
-63, 1.555555, -20,
-64, 1.555555, -20,
-65, 1.555555, -20,
-66, 1.555555, -20,
-67, 1.555555, -20,
-68, 1.555555, -20,
-69, 1.555555, -20,
-70, 1.555555, -20,
-71, 1.555555, -21,
-72, 1.555555, -22,
-72, 1.555555, -23,
};

function onSpawn(npc)
    npc:initNpcAi();
	npc:setPos(pathfind.first(path));
	onPath(npc);

	-- test fromStart
	local start = pathfind.fromStart(path, 2);
	local startFirst = pathfind.get(path, 3);

	if(start[1] ~= startFirst[1] or start[2] ~= startFirst[2] or start[3] ~= startFirst[3]) then
		printf("[Error] start path is not right %f %f %f actually = %f %f %f", startFirst[1], startFirst[2], startFirst[3], start[1], start[2], start[3]);
	end

	-- test fromEnd
	-- local endPt = pathfind.fromEnd(path, 2);
	-- local endFirst = pathfind.get(path, 37);

	-- if(endPt[1] ~= endFirst[1] or endPt[2] ~= endFirst[2] or endPt[3] ~= endFirst[3]) then
	-- 	printf("[Error] endPt path is not right %f %f %f actually = %f %f %f", endFirst[1], endFirst[2], endFirst[3], endPt[1], endPt[2], endPt[3]);
	-- end
end;

function onPath(npc)
		-- go back and forth the set path
	pathfind.patrol(npc, path);

end;
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
	pathfind.patrol(npc, path);
	npc:wait(0);
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
	npc:wait(0);
end;




