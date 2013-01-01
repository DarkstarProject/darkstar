-----------------------------------
--	[Command name]: updateconquest
--	[Author      ]: Ezekyel
--	[Description ]: update all conquest guard (need modify in db first)
-----------------------------------

require("scripts/globals/conquest");

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target)
	WeekUpdateConquest();
end;