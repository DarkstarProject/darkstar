-----------------------------------
--	[Command name]: jail
--	[Author      ]: Loraunt
--	[Description ]: Sends a target to Mordion Gaol
-----------------------------------

-----------------------------------
-- Action
-----------------------------------
ZONE_MORDION_GAOL = 131

cells = 
{
	-- Floor 1 (Bottom)
	{-620, 11,  660, 0},  {-180, 11,  660, 0}, {-260, 11,  660, 0}, {-700, 11,  660, 0},
	{-620, 11,  220, 0},  {-180, 11,  220, 0}, {-260, 11,  220, 0}, {-700, 11,  220, 0},
	{-620, 11, -220, 0},  {-180, 11, -220, 0}, {-260, 11, -220, 0}, {-700, 11, -220, 0},
	{-620, 11, -660, 0},  {-180, 11, -660, 0}, {-260, 11, -660, 0}, {-700, 11, -660, 0},
	
	-- Floor 2 (Top)
	{-620, -440,  660, 0},  {-180, -440,  660, 0}, {-260, -440,  660, 0}, {-700, -440,  660, 0},
	{-620, -440,  220, 0},  {-180, -440,  220, 0}, {-260, -440,  220, 0}, {-700, -440,  220, 0},
	{-620, -440, -220, 0},  {-180, -440, -220, 0}, {-260, -440, -220, 0}, {-700, -440, -220, 0},
	{-620, -440, -660, 0},  {-180, -440, -660, 0}, {-260, -440, -660, 0}, {-700, -440, -660, 0},
};

MAX_CELL = 32;
	
function onTrigger(gm, target, cellNumber, reason)
		
	pc = GetPlayerByName(target);
	
	if(pc ~= nil) then
		if(cellNumber == nil or cellNumber == 0 or cellNumber > MAX_CELL) then
			cellNumber = 1;
		end
		
		if(reason == nil) then
			reason = "Unspecified.";
		end
	
		local jail_message = string.format("%d jailing %d(%s) in cell %d.  Reason: %s", gm:getID(), pc:getID(), target, cellNumber, reason);
		printf(jail_message);
		pc:setVar("inJail", cellNumber);
		
		local dest = cells[cellNumber];
		pc:setPos(dest[1], dest[2], dest[3], dest[4], ZONE_MORDION_GAOL);
	else
		printf("Player named %s not found!", target);
	end

end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("CS : onEventUpdate");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("CS : onEventFinish");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
