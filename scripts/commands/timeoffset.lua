-----------------------------------
--	[Command name]: timeoffset
--	[Author      ]: Loraunt
--	[Description ]: Sets the custom time offset of the CVanaTime instance.
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

	
function onTrigger(gm, offset)
  SetVanadielTimeOffset(offset);
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
