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
