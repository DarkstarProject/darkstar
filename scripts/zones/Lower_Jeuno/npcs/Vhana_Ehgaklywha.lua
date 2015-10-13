-----------------------------------
-- Area: Lower Jeuno
-- NPC: Vhana Ehgaklywha
-- Standard Info NPC
-- @pos -122.853 0.000 -195.605
-----------------------------------

package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");
package.loaded["scripts/globals/pathfind"] = nil;
require("scripts/globals/pathfind");

path = {
		 0.932,   0, 19.065,
		 -2.84,   0, 13.676,
			-5,   0,     13,
		-7.833,   0, 12.263,
		-8.782,   0, 12.736, -- lamp 1, path 5
		-9.938,   0, 10.595,
		   -18,   0, 14.855,
		   -25,   0,      3,
		   -19,   0, -0.644,
		-17.24,   0, -2.052,
		-18.11,   0, -4.691,
		-18.83,   0, -4.346, -- lamp 2, path 12
		-19.34,   0, -7.971,
		-30.38,   0, -26.50,
		-32.38,   0, -28.52,
		-32.76,   0, -28.63,
		-32.98,   0, -28.60, -- lamp 3, path 17
		-31.93,   0, -38.83,
		-34.78,   0, -43.10,
		-45.12,   0, -47.10, -- lamp 4, path 20
		-52.76,   0, -60.53, -- lamp 5, path 21
		-41.77,   0, -48.81,
		-41.14,   0, -48.66,
		-40.34,   0, -48.79,
		-39.83,   0, -49.20,
		-39.92,   0, -49.83,
		-45.65,   6, -62.83,
		-49.97,   6, -70.32,
		-57.87,   6, -75.37,
		-60.87,   6, -74.87, -- lamp 6, path 30
		-61.05,   6, -83.40,
		-66.38,   6, -92.58,
		-72.88,   6, -95.78, -- lamp 7, path 33
		-75.42,   6, -112.4,
		-77.24, 5.9, -115.7,
		-82.75, 0.7, -125.1,
		-84.13,   0, -127.1,
		-85.94,   0, -126.2,
		-81.08,   0, -110.5, -- lamp 8, path 39
		-88.57,   0, -123.3, -- lamp 9, path 40
		-88.20,   0, -134.2,
		-88.31,   0, -134.9,
		-92.52,   0, -142.7,
		-100.4,   0, -144.3, -- lamp 10, path 44
		-108.6,   0, -158.0, -- lamp 11, path 45
		-116.7,   0, -171.8, -- lamp 12, path 46
		-114.8,   0, -182.0,
		-122.8,   0, -195.6, -- end
		
}

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	player:showText(npc, 7160);
end; 
-----------------------------------
-- onPath
-----------------------------------
function onPath(npc)
	local pathpoints = { 5, 12, 17, 20, 21, 30, 33, 39, 40, 44, 45, 46};
		for _, v in pairs(pathpoints) do
		-- local lampOffset = 17780881;
			if (npc:atPoint(pathfind.get(path,v))) then
				npc:setPos(npc:getXPos(), npc:getYPos(), npc:getZPos(), 150);
				npc:wait(5300);
				print("Waiting..");
				--GetNPCByID(lampOffset):openDoor(3);
				--printf("%s lamp reached | ID is: %i",GetNPCByID(lampOffset):getName(), lampOffset);
				return;
			else
				if (npc:atPoint(pathfind.get(path,48))) then
					npc:wait(1000);
					npc:setStatus(2);
				end
			end
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
end;