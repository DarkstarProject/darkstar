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
-69, 1.555555, -22,
-68, 1.555555, -21,
-67, 1.555555, -20,
-66, 1.555555, -20,
-65, 1.555555, -20,
-64, 1.555555, -20,
-63, 1.555555, -20,
-62, 1.555555, -20,
-61, 1.555555, -20,
-60, 1.555555, -20,
-59, 1.555555, -20,
-58, 1.555555, -20,
-57, 1.555555, -20,
-56, 1.555555, -20,
-55, 1.555555, -20,
-54, 1.555555, -20,
-53, 1.555555, -20,
-52, 1.555555, -20,
-51, 1.555555, -20,
-50, 1.555555, -20,
-49, 1.555555, -20,
-48, 1.555555, -20,
-47, 1.555555, -20,
-46, 1.555555, -20,
-45, 1.555555, -20,
-44, 1.555555, -20,
-43, 1.555555, -20,
-42, 1.555555, -20,
-41, 1.555555, -20,
-40, 1.555555, -20,
-39, 1.555555, -20,
-38, 1.555555, -20,
-37, 1.555555, -20,
-36, 1.555555, -20,
-35, 1.555555, -20,
-34, 1.555555, -20,
-33, 1.555555, -20,
-32, 1.555555, -20,
-31, 1.555555, -20,
-30, 1.555555, -20,		---------
-31, 1.555555, -20,
-32, 1.555555, -20,
-33, 1.555555, -20,
-34, 1.555555, -20,
-35, 1.555555, -20,
-36, 1.555555, -20,
-37, 1.555555, -20,
-38, 1.555555, -20,
-39, 1.555555, -20,
-40, 1.555555, -20,
-41, 1.555555, -20,
-42, 1.555555, -20,
-43, 1.555555, -20,
-44, 1.555555, -20,
-45, 1.555555, -20,
-46, 1.555555, -20,
-47, 1.555555, -20,
-48, 1.555555, -20,
-49, 1.555555, -20,
-50, 1.555555, -20,
-51, 1.555555, -20,
-52, 1.555555, -20,
-53, 1.555555, -20,
-54, 1.555555, -20,
-55, 1.555555, -20,
-56, 1.555555, -20,
-57, 1.555555, -20,
-58, 1.555555, -20,
-59, 1.555555, -20,
-60, 1.555555, -20,
-61, 1.555555, -20,
-62, 1.555555, -20,
-63, 1.555555, -20,
-64, 1.555555, -20,
-65, 1.555555, -20,
-66, 1.555555, -20,
-67, 1.555555, -20,
-68, 1.555555, -21,
-69, 1.555555, -22,
-69, 1.555555, -23,
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
			4186,3,    -- Sulfur
			5441,3,             -- Popoto
			4216,3,             -- Rye Flour
			4167,3,             -- Eggplant
			4250,3,
			5361,3,
			4251,3,
			5725,3,
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




