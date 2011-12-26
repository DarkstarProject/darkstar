-----------------------------------
--	[Command name]: additem
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,itemID,quantity)
	player:addItem(itemID,quantity);
end;